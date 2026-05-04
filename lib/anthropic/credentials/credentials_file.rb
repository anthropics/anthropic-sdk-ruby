# frozen_string_literal: true

module Anthropic
  module Credentials
    # An access token provider backed by a named profile.
    #
    # A profile is a pair of files under the config directory
    # (+~/.config/anthropic/+ by default; override with +ANTHROPIC_CONFIG_DIR+):
    #
    # * +configs/<profile>.json+ -- non-secret. Holds the nested +authentication+
    #   object (discriminated by its +type+ field), plus top-level
    #   +organization_id+, +workspace_id+, and +base_url+. The +authentication+
    #   object may contain a +credentials_path+ field overriding the credentials
    #   file location.
    # * +credentials/<profile>.json+ -- secret (0600). Holds +access_token+,
    #   +expires_at+, and (for +user_oauth+ with a +client_id+) +refresh_token+.
    #
    # Dispatches on the +authentication.type+ discriminator:
    #
    # [+oidc_federation+]
    #   OIDC workload identity federation. Lazily constructs a {WorkloadIdentity}
    #   delegate from the nested auth fields plus the top-level +organization_id+
    #   and calls it to perform the jwt-bearer exchange.
    #
    # [+user_oauth+]
    #   Output of an interactive PKCE login. The credentials file contains the
    #   +access_token+ (and optionally +refresh_token+). Currently refresh is not
    #   implemented in Ruby; the credentials file is treated as externally rotated.
    class CredentialsFile < ConfigProvider
      # @return [String] the profile name
      attr_reader :profile

      # @return [Pathname] path to the config file
      attr_reader :config_path

      # @param profile [String, nil] profile name; if +nil+, resolves via
      #   +ANTHROPIC_PROFILE+ env -> +active_config+ pointer file -> "default"
      def initialize(profile = nil)
        super()
        @profile = profile || resolve_profile
        Anthropic::Config.validate_profile_name!(@profile)
        @config_path = config_file_path(@profile)
      end

      private

      # @return [Pathname] the path used in error messages and as the load target
      def config_source
        @config_path
      end

      # Loads and caches the config file.
      #
      # @return [Hash] the parsed config
      # @raise [Anthropic::Errors::ConfigurationError] on read or parse errors
      def load_config
        return @config if @config

        begin
          raw = @config_path.read
        rescue Errno::ENOENT
          raise Anthropic::Errors::ConfigurationError,
                "Config file not found at #{@config_path} (profile #{@profile.inspect}). " \
                "Set #{ENV_PROFILE} to select a different profile, or set #{ENV_CONFIG_DIR} " \
                "to relocate the config directory."
        rescue StandardError => e
          raise Anthropic::Errors::ConfigurationError,
                "Config file at #{@config_path} could not be read: #{e.message}"
        end

        begin
          config = JSON.parse(raw, symbolize_names: true)
        rescue JSON::ParserError => e
          raise Anthropic::Errors::ConfigurationError,
                "Config file at #{@config_path} is not valid JSON: #{e.message}"
        end

        unless config.is_a?(Hash)
          raise Anthropic::Errors::ConfigurationError,
                "Config file at #{@config_path} must contain a JSON object, not #{config.class.name}."
        end

        auth = config[:authentication]
        unless auth.is_a?(Hash)
          raise Anthropic::Errors::ConfigurationError,
                "Config file at #{@config_path} is missing the 'authentication' object. " \
                "Expected shape: {\"authentication\": {\"type\": " \
                "\"#{AUTH_TYPE_OIDC_FEDERATION}\"|\"#{AUTH_TYPE_USER_OAUTH}\", ...}, ...}"
        end

        fill_missing_from_env(config, auth)

        @base_url = resolve_base_url(config)
        Anthropic::Config.require_https!(@base_url, field: "#{@config_path}: base_url")

        override = auth[:credentials_path]
        @credentials_path = if override
          Pathname.new(override.to_s).expand_path
        else
          credentials_file_path(@profile)
        end

        @config = config
      end

      def resolve_profile
        Anthropic::Credentials.active_profile
      end

      def config_dir
        Anthropic::Credentials.config_dir
      end

      def config_file_path(profile)
        Anthropic::Credentials.config_file_path(profile)
      end

      def credentials_file_path(profile)
        Anthropic::Credentials.config_dir.join("credentials", "#{profile}.json")
      end
    end
  end
end
