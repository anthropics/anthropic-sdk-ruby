# typed: strong

module Anthropic
  class Client < Anthropic::Internal::Transport::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(600.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    sig { returns(T.nilable(String)) }
    attr_reader :api_key

    sig { returns(T.nilable(String)) }
    attr_reader :auth_token

    sig { returns(T.nilable(String)) }
    attr_reader :webhook_key

    sig { returns(T.nilable(Anthropic::Credentials::TokenCache)) }
    attr_reader :token_cache

    sig { returns(Anthropic::Resources::Messages) }
    attr_reader :messages

    sig { returns(Anthropic::Resources::Models) }
    attr_reader :models

    sig { returns(Anthropic::Resources::Files) }
    attr_reader :files

    sig { returns(Anthropic::Resources::Skills) }
    attr_reader :skills

    sig { returns(Anthropic::Resources::UserProfiles) }
    attr_reader :user_profiles

    sig { returns(Anthropic::Resources::Organization) }
    attr_reader :organization

    sig { returns(Anthropic::Resources::Beta) }
    attr_reader :beta

    # @api private
    sig { override.returns(T::Hash[String, String]) }
    private def auth_headers
    end

    # @api private
    sig { returns(T::Hash[String, String]) }
    private def api_key_auth
    end

    # @api private
    sig { returns(T::Hash[String, String]) }
    private def bearer_auth
    end

    # @api private
    sig { returns(T::Boolean) }
    private def resolve_default_credentials?
    end

    # @api private
    sig { returns(T::Boolean) }
    def timeout_overridden?
    end

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        auth_token: T.nilable(String),
        webhook_key: T.nilable(String),
        credentials: T.untyped,
        config: T.nilable(T::Hash[String, T.untyped]),
        base_url: T.nilable(String),
        proxy: T.nilable(T.any(String, URI::Generic)),
        max_retries: Integer,
        timeout: T.nilable(Float),
        open_telemetry:
          T.nilable(T.any(T::Boolean, Anthropic::Internal::AnyHash)),
        initial_retry_delay: Float,
        max_retry_delay: Float,
        middleware: T.nilable(Anthropic::Middleware::EntryOrArray)
      ).returns(T.attached_class)
    end
    def self.new(
      # Defaults to `ENV["ANTHROPIC_API_KEY"]` when no explicit credential argument is
      # passed.
      api_key: nil,
      # Defaults to `ENV["ANTHROPIC_AUTH_TOKEN"]` when no explicit credential argument
      # is passed and `ANTHROPIC_API_KEY` is not set.
      auth_token: nil,
      # Defaults to `ENV["ANTHROPIC_WEBHOOK_SIGNING_KEY"]`
      webhook_key: ENV["ANTHROPIC_WEBHOOK_SIGNING_KEY"],
      # Credential provider — any callable returning
      # `AccessToken.new(token:, expires_at:)`. The provider is wrapped in a
      # `TokenCache` for thread-safe caching and proactive refresh (120s advisory / 30s
      # mandatory before expiry). Common providers: `WorkloadIdentity`,
      # `CredentialsFile`, `StaticToken`, or a custom lambda.
      credentials: nil,
      # In-memory configuration hash with the same shape as `configs/<profile>.json`.
      # Must include an `authentication` object with a `type` field (`oidc_federation`
      # or `user_oauth`). For `user_oauth`, must also include
      # `authentication.credentials_path`.
      config: nil,
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["ANTHROPIC_BASE_URL"]`
      base_url: ENV["ANTHROPIC_BASE_URL"],
      # HTTP proxy URL, e.g., `"http://user:pass@proxy.example.com:8080"`. When `nil`,
      # `net/http` reads the `http_proxy`, `https_proxy`, and `no_proxy` environment
      # variables.
      proxy: nil,
      # Max number of retries to attempt after a failed retryable request.
      max_retries: Anthropic::Client::DEFAULT_MAX_RETRIES,
      # Request timeout in seconds. Defaults to
      # `Anthropic::Client::DEFAULT_TIMEOUT_IN_SECONDS` when `nil`.
      timeout: nil,
      # OpenTelemetry tracing of this client's API calls. Each call emits a span when
      # the application has registered a tracer provider with the OpenTelemetry API.
      # `true` and `false` are short for `{traces: true}` and `{traces: false}`. Keys
      # can be Strings, and an unknown key raises `ArgumentError`. A client that is
      # given no option reads `ENV["ANTHROPIC_OPEN_TELEMETRY"]`, where `false` is
      # `open_telemetry: false`, `ENV["ANTHROPIC_OPEN_TELEMETRY_PROPAGATION"]`, where
      # `false` is `propagation: false`,
      # `ENV["ANTHROPIC_OPEN_TELEMETRY_TRACES_CONTENT_MODE"]` and
      # `ENV["ANTHROPIC_OPEN_TELEMETRY_TRACES_MAX_CONTENT_BYTES"]`. A client that is
      # given the option, even `true` or `{}`, reads none of them.
      #
      # - `:tracer_provider` is used in place of the registered tracer provider.
      # - `propagation: false` sends no trace context headers, such as `traceparent`,
      #   with this client's requests, for an application whose HTTP client
      #   instrumentation already sends them, so that a request does not carry them
      #   twice. The spans are unaffected. Defaults to `true`.
      # - `:traces` holds the settings of the spans. `true` and `false` are short for
      #   `{enabled: true}` and `{enabled: false}`. Its keys:
      #   - `enabled: false` disables the spans, and the other keys are then unused.
      #     Defaults to `true`.
      #   - `content_mode: :content` adds the content of requests and responses to the
      #     spans, and `:metadata_only` does not. Defaults to `:metadata_only`.
      #   - `:max_content_bytes` is the most bytes of content that one span holds, an
      #     Integer of 1 or more. Content over the bound is cut, and the span then has
      #     `anthropic.content.truncated`. Defaults to 0.75 MB.
      open_telemetry: nil,
      initial_retry_delay: Anthropic::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: Anthropic::Client::DEFAULT_MAX_RETRY_DELAY,
      # Per-attempt HTTP around-middleware. Each entry is a
      # `#call(req, nxt) -> Anthropic::APIResponse` callable. See
      # {Anthropic::Middleware}.
      middleware: nil
    )
    end
  end
end
