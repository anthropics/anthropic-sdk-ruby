# frozen_string_literal: true

module Anthropic
  module Credentials
    # Abstract base for access-token providers backed by a config object,
    # whether read from disk ({CredentialsFile}) or supplied in memory
    # ({InMemoryConfig}).
    #
    # Subclasses must implement:
    # * +load_config+ (private) -- parse and cache the config hash into
    #   +@config+, populate +@base_url+ (validated via +require_https!+),
    #   and resolve +@credentials_path+ if applicable. Idempotent.
    # * +config_source+ (private) -- a string used in error messages to
    #   identify the configuration's origin (a file path or a sentinel).
    class ConfigProvider
      def initialize
        @config = nil
        @credentials_path = nil
        @base_url = nil
        @bound_base_url = nil
        @workload_delegate = nil
      end

      # Returns an access token, performing token exchange if necessary.
      #
      # @param force_refresh [Boolean] if true, bypasses any cached token
      # @return [AccessToken] the access token
      # @raise [Anthropic::Errors::ConfigurationError] on configuration errors
      # @raise [WorkloadIdentityError] on token exchange failures
      def call(force_refresh: false)
        auth = auth_block
        auth_type = auth[:type]

        case auth_type
        when AUTH_TYPE_OIDC_FEDERATION
          call_oidc_federation(auth, force_refresh: force_refresh)
        when AUTH_TYPE_USER_OAUTH
          call_user_oauth(auth, force_refresh: force_refresh)
        else
          raise Anthropic::Errors::ConfigurationError,
                "Unknown authentication.type #{auth_type.inspect} at #{config_source}. " \
                "Expected #{AUTH_TYPE_OIDC_FEDERATION.inspect} or #{AUTH_TYPE_USER_OAUTH.inspect}."
        end
      end

      # Returns the +base_url+ from the config, if set.
      #
      # @return [String, nil] the base URL, or +nil+ if not configured
      def resolved_base_url
        config = load_config
        raw = config[:base_url]
        raw ? raw.to_s.chomp("/") : nil
      end

      # Sets the owning client's +base_url+ as a fallback for token exchange.
      #
      # @param base_url [String] the base URL (must be HTTPS except for localhost)
      # @return [void]
      def bind_base_url(base_url)
        bound = base_url.to_s.chomp("/")
        Anthropic::Config.require_https!(bound, field: "base_url")
        @bound_base_url = bound

        return unless @config
        @base_url = resolve_base_url(@config)
        Anthropic::Config.require_https!(@base_url, field: "#{config_source}: base_url")
      end

      # Returns headers derived from the config (e.g., +workspace_id+).
      #
      # @return [Hash{String => String}] headers to merge into API requests
      def extra_headers
        config = load_config
        headers = {}

        auth_type = config[:authentication][:type]
        if auth_type != AUTH_TYPE_OIDC_FEDERATION
          workspace_id = config[:workspace_id]
          headers["anthropic-workspace-id"] = workspace_id.to_s if workspace_id
        end

        headers
      end

      private

      # @abstract Subclass must populate and cache +@config+ (symbolized hash),
      #   set +@base_url+ (and validate it via +Anthropic::Config.require_https!+
      #   when applicable), and set +@credentials_path+ if the config references
      #   one. Must be idempotent: a no-op when +@config+ is already set.
      #
      # @return [Hash] the loaded config hash with symbol keys
      def load_config
        raise NotImplementedError, "#{self.class} must implement #load_config"
      end

      # @abstract Subclass must return a human-readable identifier of the
      #   config origin used in error messages (a file path or a sentinel
      #   string).
      #
      # @return [#to_s]
      def config_source
        raise NotImplementedError, "#{self.class} must implement #config_source"
      end

      # @return [Hash] the authentication block from the config
      def auth_block
        config = load_config
        config[:authentication]
      end

      # Handles OIDC federation authentication.
      #
      # @param auth [Hash] the authentication block
      # @param force_refresh [Boolean] whether to force a fresh exchange
      # @return [AccessToken] the access token
      def call_oidc_federation(auth, force_refresh:)
        @workload_delegate ||= build_workload_delegate(auth)

        return @workload_delegate.call(force_refresh: force_refresh) unless @credentials_path

        cached = read_credentials_if_exists
        if !force_refresh && cached
          access_token = cached[:access_token]
          expires_at = cached[:expires_at]

          if access_token && expires_at
            begin
              expires_at_int = Integer(expires_at)
              if Time.now.to_i < expires_at_int - MANDATORY_REFRESH_SECONDS
                return AccessToken.new(token: access_token.to_s, expires_at: expires_at_int)
              end
            rescue ArgumentError, TypeError # rubocop:disable Lint/SuppressedException
            end
          end
        end

        token = @workload_delegate.call(force_refresh: force_refresh)

        begin
          cached_strings = cached&.transform_keys(&:to_s) || {}
          write_credentials(
            cached_strings.merge(
              "version" => "1.0",
              "type" => "oauth_token",
              "access_token" => token.token,
              "expires_at" => token.expires_at
            )
          )
        rescue StandardError
          # cache write failures are non-fatal; return the freshly minted token regardless
        end

        token
      end

      # Handles user OAuth authentication.
      #
      # @param auth [Hash] the authentication block
      # @param force_refresh [Boolean] ignored; refresh not implemented
      # @return [AccessToken] the access token from the credentials file
      def call_user_oauth(_auth, force_refresh:) # rubocop:disable Lint/UnusedMethodArgument
        creds = read_credentials
        access_token = creds[:access_token]

        unless access_token
          raise Anthropic::Errors::ConfigurationError,
                "Credentials file at #{@credentials_path} is missing 'access_token'."
        end

        expires_at = coerce_expires_at(creds[:expires_at])
        AccessToken.new(token: access_token, expires_at: expires_at)
      end

      # Builds a WorkloadIdentity delegate for OIDC federation.
      #
      # @param auth [Hash] the authentication block
      # @return [WorkloadIdentity] the configured delegate
      def build_workload_delegate(auth)
        federation_rule_id = auth[:federation_rule_id]
        organization_id = @config[:organization_id]

        unless federation_rule_id && organization_id
          raise Anthropic::Errors::ConfigurationError,
                "Config file with authentication.type #{AUTH_TYPE_OIDC_FEDERATION.inspect} must include " \
                "'authentication.federation_rule_id' and top-level 'organization_id': #{config_source}"
        end

        provider = resolve_identity_token_provider(auth)

        delegate = WorkloadIdentity.new(
          identity_token_provider: provider,
          federation_rule_id: federation_rule_id,
          organization_id: organization_id,
          service_account_id: auth[:service_account_id],
          scope: auth[:scope]
        )

        delegate.bind_base_url(@base_url)
        delegate
      end

      # Resolves the identity token provider from the auth config.
      #
      # @param auth [Hash] the authentication block
      # @return [#call] the provider (IdentityTokenFile or a Proc)
      def resolve_identity_token_provider(auth)
        identity_token_cfg = auth[:identity_token]

        return IdentityTokenFile.new unless identity_token_cfg

        if identity_token_cfg.is_a?(Hash)
          source = identity_token_cfg[:source]

          case source
          when "file"
            identity_token_path = identity_token_cfg[:path]
            unless identity_token_path && !identity_token_path.empty?
              raise Anthropic::Errors::ConfigurationError,
                    "identity_token source 'file' requires a non-empty path; " \
                    "#{config_source} has identity_token=#{identity_token_cfg.inspect}."
            end
            IdentityTokenFile.new(identity_token_path)
          when "env"
            env_var_name = identity_token_cfg[:value]
            unless env_var_name && !env_var_name.empty?
              raise Anthropic::Errors::ConfigurationError,
                    "identity_token source 'env' requires a non-empty value; " \
                    "#{config_source} has identity_token=#{identity_token_cfg.inspect}."
            end
            -> {
              content = ENV[env_var_name]
              if content.nil?
                raise Anthropic::Errors::ConfigurationError,
                      "Identity token environment variable #{env_var_name} is not set"
              end
              content = content.strip
              if content.empty?
                raise Anthropic::Errors::ConfigurationError,
                      "Identity token environment variable #{env_var_name} is empty"
              end
              content
            }
          else
            raise Anthropic::Errors::ConfigurationError,
                  "identity_token source #{source.inspect} is not supported; only 'file' and 'env' are implemented"
          end
        else
          identity_token_path = identity_token_cfg.to_s
          IdentityTokenFile.new(identity_token_path)
        end
      end

      # Reads the credentials file. Re-reads on every call -- daemons rotate it.
      #
      # On Unix, verifies the file is not group/world-readable. World-readable
      # credentials files are refused outright; group-readable files log a
      # warning but are accepted. The check is skipped on Windows where POSIX
      # mode bits don't carry the same meaning.
      #
      # @return [Hash] the parsed credentials
      # @raise [Anthropic::Errors::ConfigurationError] on read or parse errors
      def read_credentials
        validate_credentials_permissions!

        raw = @credentials_path.read
        JSON.parse(raw, symbolize_names: true)
      rescue Anthropic::Errors::ConfigurationError
        raise
      rescue JSON::ParserError => e
        raise Anthropic::Errors::ConfigurationError,
              "Credentials file at #{@credentials_path} is not valid JSON: #{e.message}"
      rescue StandardError => e
        raise Anthropic::Errors::ConfigurationError,
              "Credentials file at #{@credentials_path} could not be read: #{e.message}"
      end

      # Verifies the credentials file exists, is not a symlink, and has
      # sufficiently restrictive POSIX permissions.
      #
      # @return [void]
      # @raise [Anthropic::Errors::ConfigurationError] if the file is missing,
      #   a symlink, or world-readable
      def validate_credentials_permissions!
        begin
          lstat = File.lstat(@credentials_path)
        rescue Errno::ENOENT
          raise Anthropic::Errors::ConfigurationError,
                "Credentials file not found at #{@credentials_path}."
        rescue SystemCallError => e
          raise Anthropic::Errors::ConfigurationError,
                "Credentials file at #{@credentials_path} could not be accessed: #{e.message}"
        end

        return if windows?

        if lstat.symlink?
          raise Anthropic::Errors::ConfigurationError,
                "Credentials file at #{@credentials_path} is a symlink; refusing to follow " \
                "(move the real file into place to keep secret material on the expected filesystem)."
        end

        mode = lstat.mode & 0o777
        if mode.anybits?(0o004)
          raise Anthropic::Errors::ConfigurationError,
                "Credentials file at #{@credentials_path} is world-readable " \
                "(mode 0#{mode.to_s(8)}); run `chmod 600 #{@credentials_path}` before retrying."
        end

        return if mode.nobits?(0o070)

        warn(
          "[anthropic-ruby] Credentials file at #{@credentials_path} is group-readable " \
          "(mode 0#{mode.to_s(8)}); consider `chmod 600 #{@credentials_path}`."
        )
      end

      # @return [Boolean] true if running on Windows
      def windows?
        Anthropic::Internal::Util.os == "Windows"
      end

      # Reads the credentials file if it exists.
      #
      # @return [Hash, nil] the parsed credentials, or +nil+ if not found
      def read_credentials_if_exists
        return nil unless @credentials_path&.exist?

        read_credentials
      rescue Anthropic::Errors::ConfigurationError
        nil
      end

      # Atomically writes to the credentials file.
      #
      # @param data [Hash] the data to write
      # @return [void]
      def write_credentials(data)
        temp_path = nil
        parent = @credentials_path.parent
        parent.mkpath
        parent.chmod(0o700)

        temp_path = @credentials_path.dirname.join(".#{@credentials_path.basename}.tmp#{SecureRandom.hex(8)}")

        File.open(temp_path, "w", 0o600) do |f|
          f.write(JSON.pretty_generate(data))
          f.fsync
        end

        File.rename(temp_path, @credentials_path)
      ensure
        unless temp_path.nil?
          begin
            File.unlink(temp_path)
          rescue StandardError
            # best-effort cleanup; the temp file may already be gone (successful rename or concurrent unlink)
          end
        end
      end

      # Coerces an expires_at value to an Integer.
      #
      # @param value [Object, nil] the value to coerce
      # @return [Integer, nil] the coerced value
      # @raise [Anthropic::Errors::ConfigurationError] if coercion fails
      def coerce_expires_at(value)
        return nil if value.nil?

        Integer(value)
      rescue ArgumentError, TypeError
        raise Anthropic::Errors::ConfigurationError,
              "Credentials file at #{@credentials_path} has invalid 'expires_at' #{value.inspect}; " \
              "expected an integer Unix timestamp in seconds."
      end

      # @param config [Hash] the config hash
      # @return [String] the resolved base URL
      def resolve_base_url(config)
        if config[:base_url]
          config[:base_url].to_s.chomp("/")
        elsif @bound_base_url
          @bound_base_url
        else
          DEFAULT_BASE_URL
        end
      end

      # Fills missing config fields from environment variables.
      #
      # @param config [Hash] the config hash
      # @param auth [Hash] the authentication block
      # @return [void]
      def fill_missing_from_env(config, auth)
        fill(config, :base_url, ENV_BASE_URL)
        fill(config, :organization_id, ENV_ORGANIZATION_ID)

        auth_type = auth[:type]
        if auth_type == AUTH_TYPE_OIDC_FEDERATION
          fill(auth, :federation_rule_id, ENV_FEDERATION_RULE_ID)
          fill(auth, :service_account_id, ENV_SERVICE_ACCOUNT_ID)
          fill(auth, :scope, ENV_SCOPE)

          unless auth[:identity_token]
            v = ENV[ENV_IDENTITY_TOKEN_FILE]
            auth[:identity_token] = {source: "file", path: v} if v && !v.empty?
          end
        elsif auth_type == AUTH_TYPE_USER_OAUTH
          fill(auth, :scope, ENV_SCOPE)
        end
      end

      # Fills a single field from an environment variable if not already set.
      #
      # @param target [Hash] the hash to fill
      # @param key [Symbol] the key to fill
      # @param env_var [String] the environment variable name
      # @return [void]
      def fill(target, key, env_var)
        value = target[key]
        return unless value.nil? || (value.is_a?(String) && value.empty?)
        v = ENV[env_var]
        target[key] = v if v && !v.empty?
      end
    end
  end
end
