# frozen_string_literal: true

module Anthropic
  module Credentials
    # An access token provider driven by an in-memory configuration hash.
    #
    # Instead of reading from a config file, +InMemoryConfig+ accepts a hash with
    # the same shape as +configs/<profile>.json+, allowing flexible configuration
    # without filesystem dependencies. This approach matches the behavior of
    # Go SDK's {option.WithConfig} and TypeScript SDK's {ClientOptions.config}.
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
    class InMemoryConfig < ConfigProvider
      # Initializes a new InMemoryConfig provider.
      #
      # @param config [Hash] configuration hash with the same shape as
      #   +configs/<profile>.json+. Must include +authentication+ (Hash, required).
      # @param identity_token_provider [Proc, nil] optional callable that returns
      #   an OIDC identity token string.
      #
      # @raise [Anthropic::Errors::ConfigurationError] if +config+ is missing the
      #   +authentication+ object, has an unknown +authentication.type+, or is
      #   missing required fields for the specified authentication type
      def initialize(config, identity_token_provider: nil)
        super()

        auth = config["authentication"]
        unless auth.is_a?(Hash)
          raise Anthropic::Errors::ConfigurationError,
                "config hash is missing the 'authentication' object. " \
                "Expected shape: {\"authentication\": {\"type\": " \
                "\"#{AUTH_TYPE_OIDC_FEDERATION}\"|\"#{AUTH_TYPE_USER_OAUTH}\", ...}, ...}"
        end

        auth_type = auth["type"]
        unless [AUTH_TYPE_OIDC_FEDERATION, AUTH_TYPE_USER_OAUTH].include?(auth_type)
          raise Anthropic::Errors::ConfigurationError,
                "Unknown authentication.type #{auth_type.inspect}. " \
                "Expected #{AUTH_TYPE_OIDC_FEDERATION.inspect} or #{AUTH_TYPE_USER_OAUTH.inspect}."
        end

        credentials_path = auth["credentials_path"]
        if auth_type == AUTH_TYPE_USER_OAUTH && !credentials_path
          raise Anthropic::Errors::ConfigurationError,
                "authentication.type #{AUTH_TYPE_USER_OAUTH.inspect} requires " \
                "'authentication.credentials_path' (where the access/refresh tokens live). " \
                "For profile-based resolution, use CredentialsFile instead."
        end

        @raw_config = config
        @credentials_path = credentials_path ? Pathname.new(credentials_path).expand_path : nil
        @identity_token_provider_override = identity_token_provider
      end

      private

      # @return [String] the descriptor used in error messages
      def config_source
        "<in-memory config>"
      end

      # Symbolizes the config hash on first call; cached thereafter.
      #
      # @return [Hash] the configuration hash with symbol keys
      def load_config
        # rubocop:disable Naming/MemoizedInstanceVariableName
        @config ||= JSON.parse(JSON.generate(@raw_config), symbolize_names: true)
        # rubocop:enable Naming/MemoizedInstanceVariableName
      end

      # Builds a {WorkloadIdentity} delegate, honoring the optional
      # +identity_token_provider+ override supplied at construction.
      #
      # @param auth [Hash] the +authentication+ object from the configuration
      # @return [WorkloadIdentity] a bound workload identity delegate
      # @raise [Anthropic::Errors::ConfigurationError] if +federation_rule_id+
      #   or +organization_id+ are missing
      def build_workload_delegate(auth)
        return super if @identity_token_provider_override.nil?

        config = load_config
        federation_rule_id = auth[:federation_rule_id]
        organization_id = config[:organization_id]

        unless federation_rule_id && organization_id
          raise Anthropic::Errors::ConfigurationError,
                "config hash with authentication.type #{AUTH_TYPE_OIDC_FEDERATION.inspect} must include " \
                "'authentication.federation_rule_id' and top-level 'organization_id'"
        end

        delegate = WorkloadIdentity.new(
          identity_token_provider: @identity_token_provider_override,
          federation_rule_id: federation_rule_id,
          organization_id: organization_id,
          service_account_id: auth[:service_account_id],
          workspace_id: config[:workspace_id],
          scope: auth[:scope]
        )

        delegate.bind_base_url(@base_url || DEFAULT_BASE_URL)
        delegate
      end
    end
  end
end
