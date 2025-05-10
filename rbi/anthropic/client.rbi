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

    sig { returns(Anthropic::Resources::Completions) }
    attr_reader :completions

    sig { returns(Anthropic::Resources::Messages) }
    attr_reader :messages

    sig { returns(Anthropic::Resources::Models) }
    attr_reader :models

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

    # Creates and returns a new client for interacting with the API.
    sig do
      params(
        api_key: T.nilable(String),
        auth_token: T.nilable(String),
        base_url: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).returns(T.attached_class)
    end
    def self.new(
      # Defaults to `ENV["ANTHROPIC_API_KEY"]`
      api_key: ENV["ANTHROPIC_API_KEY"],
      # Defaults to `ENV["ANTHROPIC_AUTH_TOKEN"]`
      auth_token: ENV["ANTHROPIC_AUTH_TOKEN"],
      # Override the default base URL for the API, e.g.,
      # `"https://api.example.com/v2/"`. Defaults to `ENV["ANTHROPIC_BASE_URL"]`
      base_url: ENV["ANTHROPIC_BASE_URL"],
      # Max number of retries to attempt after a failed retryable request.
      max_retries: Anthropic::Client::DEFAULT_MAX_RETRIES,
      timeout: Anthropic::Client::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: Anthropic::Client::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: Anthropic::Client::DEFAULT_MAX_RETRY_DELAY
    )
    end
  end
end
