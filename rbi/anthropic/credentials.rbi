# typed: strong

module Anthropic
  module Credentials
    GRANT_TYPE_JWT_BEARER =
      T.let("urn:ietf:params:oauth:grant-type:jwt-bearer", String)
    GRANT_TYPE_REFRESH_TOKEN = T.let("refresh_token", String)
    TOKEN_ENDPOINT = T.let("/v1/oauth/token", String)
    TOKEN_EXCHANGE_TIMEOUT = T.let(30, Integer)
    OAUTH_API_BETA_HEADER = T.let("oauth-2025-04-20", String)
    FEDERATION_BETA_HEADER = T.let("oidc-federation-2026-04-01", String)
    ADVISORY_REFRESH_SECONDS = T.let(120, Integer)
    MANDATORY_REFRESH_SECONDS = T.let(30, Integer)
    DEFAULT_PROFILE = T.let("default", String)
    DEFAULT_BASE_URL = T.let("https://api.anthropic.com", String)
    ENV_API_KEY = T.let("ANTHROPIC_API_KEY", String)
    ENV_AUTH_TOKEN = T.let("ANTHROPIC_AUTH_TOKEN", String)
    ENV_BASE_URL = T.let("ANTHROPIC_BASE_URL", String)
    ENV_CONFIG_DIR = T.let("ANTHROPIC_CONFIG_DIR", String)
    ENV_PROFILE = T.let("ANTHROPIC_PROFILE", String)
    ENV_IDENTITY_TOKEN = T.let("ANTHROPIC_IDENTITY_TOKEN", String)
    ENV_IDENTITY_TOKEN_FILE = T.let("ANTHROPIC_IDENTITY_TOKEN_FILE", String)
    ENV_FEDERATION_RULE_ID = T.let("ANTHROPIC_FEDERATION_RULE_ID", String)
    ENV_ORGANIZATION_ID = T.let("ANTHROPIC_ORGANIZATION_ID", String)
    ENV_SERVICE_ACCOUNT_ID = T.let("ANTHROPIC_SERVICE_ACCOUNT_ID", String)
    ENV_SCOPE = T.let("ANTHROPIC_SCOPE", String)
    AUTH_TYPE_OIDC_FEDERATION = T.let("oidc_federation", String)
    AUTH_TYPE_USER_OAUTH = T.let("user_oauth", String)

    sig { returns(Pathname) }
    def self.config_dir
    end

    sig { returns(T.nilable(String)) }
    def self.read_active_config_pointer
    end

    sig { returns(String) }
    def self.active_profile
    end

    sig { params(profile: String).returns(Pathname) }
    def self.config_file_path(profile)
    end

    sig { returns(T::Boolean) }
    def self.active_profile_config?
    end

    sig { returns(T::Boolean) }
    def self.explicit_active_config?
    end

    sig { params(path: T.nilable(String)).returns(T.nilable(Pathname)) }
    def self.resolve_identity_token_path(path = nil)
    end

    sig { returns(T::Boolean) }
    def self.auto_discoverable_credentials?
    end

    sig { params(base_url: String).returns(T.nilable(CredentialResult)) }
    def self.default_credentials(base_url: DEFAULT_BASE_URL)
    end

    class CredentialResult
      sig { returns(T.untyped) }
      attr_reader :provider

      sig { returns(T::Hash[String, String]) }
      attr_reader :extra_headers

      sig { returns(T.nilable(String)) }
      attr_reader :base_url

      sig do
        params(
          provider: T.untyped,
          extra_headers: T::Hash[String, String],
          base_url: T.nilable(String)
        ).void
      end
      def initialize(provider:, extra_headers: {}, base_url: nil)
      end
    end

    class AccessToken
      sig { returns(String) }
      attr_reader :token

      sig { returns(T.nilable(Integer)) }
      attr_reader :expires_at

      sig { params(token: String, expires_at: T.nilable(Integer)).void }
      def initialize(token:, expires_at: nil)
      end

      sig { returns(Integer) }
      def hash
      end

      sig { params(other: T.untyped).returns(T::Boolean) }
      def ==(other)
      end

      sig { params(other: T.untyped).returns(T::Boolean) }
      def eql?(other)
      end
    end

    class StaticToken
      sig { params(token: String).void }
      def initialize(token)
      end

      sig { params(force_refresh: T::Boolean).returns(AccessToken) }
      def call(force_refresh: false)
      end
    end

    class IdentityTokenFile
      sig { returns(Pathname) }
      attr_reader :path

      sig { params(path: T.nilable(String)).void }
      def initialize(path = nil)
      end

      sig { returns(String) }
      def call
      end
    end

    class WorkloadIdentityError < Anthropic::Errors::Error
      sig { returns(T.nilable(Integer)) }
      attr_reader :status_code

      sig { returns(T.nilable(T.any(T::Hash[Symbol, T.untyped], String))) }
      attr_reader :body

      sig { returns(T.nilable(String)) }
      attr_reader :request_id

      sig do
        params(
          message: String,
          status_code: T.nilable(Integer),
          body: T.nilable(T.any(T::Hash[Symbol, T.untyped], String)),
          request_id: T.nilable(String)
        ).void
      end
      def initialize(message, status_code: nil, body: nil, request_id: nil)
      end

      sig { returns(String) }
      def to_s
      end
    end

    class WorkloadIdentity
      MAX_ASSERTION_BYTES = T.let(16 * 1024, Integer)

      sig do
        params(
          identity_token_provider: T.untyped,
          federation_rule_id: String,
          organization_id: String,
          service_account_id: T.nilable(String),
          scope: T.nilable(String)
        ).void
      end
      def initialize(
        identity_token_provider:,
        federation_rule_id:,
        organization_id:,
        service_account_id: nil,
        scope: nil
      )
      end

      sig { params(base_url: String).void }
      def bind_base_url(base_url)
      end

      sig { params(force_refresh: T::Boolean).returns(AccessToken) }
      def call(force_refresh: false)
      end
    end

    class TokenCache
      sig do
        params(
          provider: T.untyped,
          advisory_refresh_seconds: T.nilable(Integer),
          mandatory_refresh_seconds: T.nilable(Integer)
        ).void
      end
      def initialize(
        provider,
        advisory_refresh_seconds: nil,
        mandatory_refresh_seconds: nil
      )
      end

      sig { returns(String) }
      def get_token
      end

      sig { void }
      def invalidate
      end
    end

    class ConfigProvider
      sig { params(force_refresh: T::Boolean).returns(AccessToken) }
      def call(force_refresh: false)
      end

      sig { returns(T.nilable(String)) }
      def resolved_base_url
      end

      sig { params(base_url: String).void }
      def bind_base_url(base_url)
      end

      sig { returns(T::Hash[String, String]) }
      def extra_headers
      end
    end

    class CredentialsFile < ConfigProvider
      sig { returns(String) }
      attr_reader :profile

      sig { returns(Pathname) }
      attr_reader :config_path

      sig { params(profile: T.nilable(String)).void }
      def initialize(profile = nil)
      end
    end

    class InMemoryConfig < ConfigProvider
      sig do
        params(
          config: T::Hash[String, T.untyped],
          identity_token_provider: T.nilable(T.proc.returns(String))
        ).void
      end
      def initialize(config, identity_token_provider: nil)
      end

      sig { returns(T.nilable(Pathname)) }
      def config_path
      end
    end
  end
end
