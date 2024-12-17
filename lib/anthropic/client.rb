# frozen_string_literal: true

module Anthropic
  class Client < Anthropic::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 600

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # Client option
    # @return [String, nil]
    attr_reader :api_key

    # Client option
    # @return [String, nil]
    attr_reader :auth_token

    # @return [Anthropic::Resources::Completions]
    attr_reader :completions

    # @return [Anthropic::Resources::Messages]
    attr_reader :messages

    # @return [Anthropic::Resources::Models]
    attr_reader :models

    # @return [Anthropic::Resources::Beta]
    attr_reader :beta

    # Creates and returns a new client for interacting with the API.
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g., `"https://api.example.com/v2/"`
    #
    # @param api_key [String, nil] Defaults to `ENV["ANTHROPIC_API_KEY"]`
    #
    # @param auth_token [String, nil] Defaults to `ENV["ANTHROPIC_AUTH_TOKEN"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    def initialize(
      base_url: nil,
      api_key: ENV["ANTHROPIC_API_KEY"],
      auth_token: ENV["ANTHROPIC_AUTH_TOKEN"],
      max_retries: DEFAULT_MAX_RETRIES,
      timeout: DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: DEFAULT_MAX_RETRY_DELAY
    )
      base_url ||= "https://api.anthropic.com"

      headers = {
        "anthropic-version" => "2023-06-01"
      }

      @api_key = api_key&.to_s
      @auth_token = auth_token&.to_s

      super(
        base_url: base_url,
        timeout: timeout,
        max_retries: max_retries,
        initial_retry_delay: initial_retry_delay,
        max_retry_delay: max_retry_delay,
        headers: headers
      )

      @completions = Anthropic::Resources::Completions.new(client: self)
      @messages = Anthropic::Resources::Messages.new(client: self)
      @models = Anthropic::Resources::Models.new(client: self)
      @beta = Anthropic::Resources::Beta.new(client: self)
    end
  end
end
