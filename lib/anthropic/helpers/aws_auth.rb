# frozen_string_literal: true

module Anthropic
  module Helpers
    # Shared AWS authentication module used by both the AWS gateway client and the
    # Bedrock Mantle client. Provides SigV4 signing, credential resolution, and
    # config handling parameterized by service name and environment variable names.
    module AWSAuth
      # Sets up AWS authentication state. Call from the including class's `initialize`.
      #
      # @param api_key [String, nil]
      # @param aws_access_key [String, nil]
      # @param aws_secret_access_key [String, nil]
      # @param aws_session_token [String, nil]
      # @param aws_profile [String, nil]
      # @param aws_region [String, nil]
      # @param workspace_id [String, nil]
      # @param skip_auth [Boolean]
      # @param base_url [String, nil]
      # @param service_name [String] AWS service name for SigV4 signing
      # @param env_api_key [String] Primary env var for API key
      # @param env_api_key_fallback [String, nil] Fallback env var for API key
      # @param env_workspace_id [String] Primary env var for workspace ID
      # @param env_workspace_id_fallback [String, nil] Fallback env var for workspace ID
      # @param derive_base_url [Proc] Lambda that takes region and returns default base URL
      #
      # @return [Array(String, String)] [effective_api_key, resolved_base_url]
      private def setup_aws_auth(
        api_key:,
        aws_access_key:,
        aws_secret_access_key:,
        aws_session_token:,
        aws_profile:,
        aws_region:,
        skip_auth:,
        base_url:,
        service_name:,
        env_api_key:,
        derive_base_url:,
        workspace_id: nil,
        env_api_key_fallback: nil,
        env_workspace_id: nil,
        env_workspace_id_fallback: nil,
        use_bearer_auth: false
      )
        @use_bearer_auth = use_bearer_auth
        begin
          require("aws-sdk-core")
        rescue LoadError
          message = <<~MSG

            In order to use Anthropic AWS clients you must require the `aws-sdk-core` gem.
            You can install it by adding the following to your Gemfile:

                gem "aws-sdk-core"

            and then running `bundle install`.

            Alternatively, if you are not using Bundler, simply run:

                gem install aws-sdk-core
          MSG

          raise RuntimeError.new(message)
        end

        if (aws_access_key && !aws_secret_access_key) || (!aws_access_key && aws_secret_access_key)
          raise ArgumentError.new("Both aws_access_key and aws_secret_access_key must be provided together")
        end

        @skip_auth = skip_auth

        if @skip_auth
          effective_api_key = nil
          @use_sig_v4 = false
        else
          # Resolve auth mode. Explicit platform auth args suppress the API key env var check.
          has_platform_auth = aws_access_key || aws_secret_access_key || aws_profile
          env_key = env_lookup(env_api_key, env_api_key_fallback)
          effective_api_key = api_key || (has_platform_auth ? nil : env_key)
          @use_sig_v4 = effective_api_key.nil?
        end

        if @use_sig_v4
          if aws_region.to_s.empty?
            # rubocop:disable Layout/LineLength
            raise ArgumentError.new("No aws_region was given. Set the `aws_region` argument or the `AWS_REGION` / `AWS_DEFAULT_REGION` environment variable.")
            # rubocop:enable Layout/LineLength
          end

          @aws_region = aws_region
          credentials = resolve_credentials(
            aws_access_key: aws_access_key,
            aws_secret_access_key: aws_secret_access_key,
            aws_session_token: aws_session_token,
            aws_profile: aws_profile
          )
          @signer = Aws::Sigv4::Signer.new(
            service: service_name,
            region: @aws_region,
            credentials_provider: credentials
          )
        end

        # Workspace ID: constructor > primary env > fallback env
        if env_workspace_id
          resolved_workspace_id = workspace_id
          if resolved_workspace_id.to_s.empty?
            resolved_workspace_id = env_lookup(env_workspace_id, env_workspace_id_fallback)
          end
          @workspace_id = resolved_workspace_id.to_s.empty? ? nil : resolved_workspace_id.to_s

          unless @skip_auth
            if @workspace_id.nil?
              # rubocop:disable Layout/LineLength
              raise ArgumentError.new("No workspace ID found. Set the `workspace_id` argument or the `#{env_workspace_id}` environment variable.")
              # rubocop:enable Layout/LineLength
            end
          end
        end

        if base_url.nil? && !aws_region.to_s.empty?
          @aws_region ||= aws_region
          base_url = derive_base_url.call(aws_region)
        end

        if base_url.nil?
          # rubocop:disable Layout/LineLength
          raise ArgumentError.new("No base_url was given and no aws_region is available to derive one. Set the `base_url` argument or provide an `aws_region`.")
          # rubocop:enable Layout/LineLength
        end

        [effective_api_key, base_url]
      end

      # Override the base client's auth_headers to prevent ANTHROPIC_API_KEY
      # from leaking as an x-api-key header in SigV4 mode, and to send the API
      # key as an Authorization: Bearer header when use_bearer_auth is set.
      #
      # @return [Hash{String=>String}]
      private def auth_headers
        return {} if @use_sig_v4
        if @use_bearer_auth
          return {} if @api_key.nil?
          return {"authorization" => "Bearer #{@api_key}"}
        end
        super
      end

      # Applies workspace-id header and SigV4 signing to the request.
      # Call from the including class's `transform_request`.
      #
      # @param request [Hash{Symbol=>Object}]
      # @return [Hash{Symbol=>Object}]
      private def aws_auth_transform_request(request)
        headers = request.fetch(:headers)

        headers["anthropic-workspace-id"] = @workspace_id if @workspace_id

        return request unless @use_sig_v4

        sliced = request.slice(:method, :url, :body).transform_keys(method: :http_method)
        signed = @signer.sign_request({**sliced, headers: headers})
        headers = Anthropic::Internal::Util.normalized_headers(headers, signed.headers)
        headers.delete("connection")
        {**request, headers: headers}
      end

      # Resolves AWS credentials from explicit args, profile, env vars, or default chain.
      #
      # @param aws_access_key [String, nil]
      # @param aws_secret_access_key [String, nil]
      # @param aws_session_token [String, nil]
      # @param aws_profile [String, nil]
      #
      # @return [Aws::Credentials, Aws::SharedCredentials, Aws::SSOCredentials, Aws::InstanceProfileCredentials]
      private def resolve_credentials(
        aws_access_key:,
        aws_secret_access_key:,
        aws_session_token:,
        aws_profile:
      )
        if aws_access_key && aws_secret_access_key
          return Aws::Credentials.new(aws_access_key, aws_secret_access_key, aws_session_token)
        end

        if aws_profile
          return resolve_profile_credentials(aws_profile)
        end

        # Default credential chain: env vars → shared config file → instance profile
        if ENV["AWS_ACCESS_KEY_ID"] && ENV["AWS_SECRET_ACCESS_KEY"]
          return Aws::Credentials.new(
            ENV["AWS_ACCESS_KEY_ID"],
            ENV["AWS_SECRET_ACCESS_KEY"],
            ENV["AWS_SESSION_TOKEN"]
          )
        end

        begin
          shared = Aws::SharedCredentials.new
          return shared if shared.set?
        rescue StandardError
          nil
        end

        # Fall back to instance profile (EC2/ECS/Lambda metadata service)
        Aws::InstanceProfileCredentials.new
      end

      # Resolve credentials for a named AWS profile. Tries the same resolution
      # order as Aws::CredentialProviderChain for explicit profiles: SSO,
      # assume-role (including web identity), credential_process, and static
      # shared credentials.
      #
      # Uses Aws.shared_config which is @api private in aws-sdk-core, but is
      # the only path to load SSO/assume-role/process credentials from a profile
      # name without re-parsing ~/.aws/config. This is the same approach the
      # SDK's own CredentialProviderChain uses and has been stable across v3.
      #
      # @param aws_profile [String]
      # @return [Aws::CredentialProvider]
      # @raise [ArgumentError] if the profile resolves no usable credentials
      private def resolve_profile_credentials(aws_profile)
        sc = Aws.shared_config

        # Same order as Aws::CredentialProviderChain for explicit profiles.
        # The config-file resolvers are gated on config_enabled? since they
        # read ~/.aws/config; static shared credentials read ~/.aws/credentials
        # and are always attempted as the final fallback.
        resolvers = []
        if sc.config_enabled?
          resolvers += [
            -> { sc.assume_role_web_identity_credentials_from_config(profile: aws_profile) },
            -> { sc.sso_credentials_from_config(profile: aws_profile) },
            -> { sc.assume_role_credentials_from_config(profile: aws_profile) },
            -> {
              process_provider = sc.credential_process(profile: aws_profile)
              Aws::ProcessCredentials.new([process_provider]) if process_provider
            }
          ]
        end
        resolvers << -> { Aws::SharedCredentials.new(profile_name: aws_profile) }

        resolvers.each do |resolver|
          creds = resolver.call
          return creds if creds&.set?
        rescue Aws::Errors::NoSuchProfileError
          # fall through to next strategy
          nil
        end

        raise ArgumentError.new(
          "Could not resolve credentials for profile #{aws_profile.inspect}. " \
          "If this is an SSO profile, " \
          "run `aws sso login --profile #{aws_profile}` first."
        )
      end

      # Returns the first non-empty value from the given env var names.
      #
      # @param names [Array<String, nil>]
      # @return [String, nil]
      private def env_lookup(*names)
        names.each do |name|
          next if name.nil?
          val = ENV[name]
          return val unless val.to_s.empty?
        end
        nil
      end
    end
  end
end
