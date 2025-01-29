# typed: strong

module Anthropic
  class Client < Anthropic::BaseClient
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

    sig do
      params(
        base_url: T.nilable(String),
        api_key: T.nilable(String),
        auth_token: T.nilable(String),
        max_retries: Integer,
        timeout: Float,
        initial_retry_delay: Float,
        max_retry_delay: Float
      ).void
    end
    def initialize(
      base_url: nil,
      api_key: ENV["ANTHROPIC_API_KEY"],
      auth_token: ENV["ANTHROPIC_AUTH_TOKEN"],
      max_retries: DEFAULT_MAX_RETRIES,
      timeout: DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: DEFAULT_MAX_RETRY_DELAY
    ); end
  end
end
