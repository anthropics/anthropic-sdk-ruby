# typed: strong

module Anthropic
  class Client < Anthropic::BaseClient
    DEFAULT_MAX_RETRIES = 2

    DEFAULT_TIMEOUT_IN_SECONDS = T.let(600.0, Float)

    DEFAULT_INITIAL_RETRY_DELAY = T.let(0.5, Float)

    DEFAULT_MAX_RETRY_DELAY = T.let(8.0, Float)

    sig { returns(T.nilable(String)) }
    def api_key
    end

    sig { returns(T.nilable(String)) }
    def auth_token
    end

    sig { returns(Anthropic::Resources::Completions) }
    def completions
    end

    sig { returns(Anthropic::Resources::Messages) }
    def messages
    end

    sig { returns(Anthropic::Resources::Models) }
    def models
    end

    sig { returns(Anthropic::Resources::Beta) }
    def beta
    end

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

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        base_url: T.nilable(String),
        api_key: T.nilable(String),
        auth_token: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      )
        .returns(T.attached_class)
    end
    def self.new(
      # Override the default base URL for the API, e.g., `"https://api.example.com/v2/"`
      base_url: nil,
      # Defaults to `ENV["ANTHROPIC_API_KEY"]`
      api_key: ENV["ANTHROPIC_API_KEY"],
      # Defaults to `ENV["ANTHROPIC_AUTH_TOKEN"]`
      auth_token: ENV["ANTHROPIC_AUTH_TOKEN"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: DEFAULT_MAX_RETRIES,
      timeout: DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
