# frozen_string_literal: true

module Anthropic
  class Client < Anthropic::Internal::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 600.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

    # Models that have specific non-streaming token limits
    MODEL_NONSTREAMING_TOKENS = {
      "claude-opus-4-20250514": 8_192,
      "claude-opus-4-0": 8_192,
      "claude-4-opus-20250514": 8_192,
      "anthropic.claude-opus-4-20250514-v1:0": 8_192,
      "claude-opus-4@20250514": 8_192
    }.freeze

    # @return [String, nil]
    attr_reader :api_key

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

    # @api private
    #
    # @return [Hash{String=>String}]
    private def auth_headers
      {**api_key_auth, **bearer_auth}
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def api_key_auth
      {"x-api-key" => @api_key}
    end

    # @api private
    #
    # @return [Hash{String=>String}]
    private def bearer_auth
      return {} if @auth_token.nil?

      {"authorization" => "Bearer #{@auth_token}"}
    end

    # Calculate the timeout for non-streaming requests based on token count
    #
    # @param max_tokens [Integer] The maximum number of tokens to generate
    # @param max_nonstreaming_tokens [Integer, nil] The maximum tokens allowed for non-streaming
    # @return [Float] The calculated timeout in seconds
    # @raise [ArgumentError] If expected time exceeds default time or max_tokens exceeds max_nonstreaming_tokens
    def calculate_nonstreaming_timeout(max_tokens, max_nonstreaming_tokens = nil)
      maximum_time = 60 * 60 # 1 hour in seconds
      default_time = 60 * 10 # 10 minutes in seconds

      expected_time = maximum_time * max_tokens / 128_000.0
      if expected_time > default_time || (max_nonstreaming_tokens && max_tokens > max_nonstreaming_tokens)
        raise ArgumentError.new(
          "Streaming is strongly recommended for operations that may take longer than 10 minutes. " \
          "See https://github.com/anthropics/anthropic-sdk-ruby#long-requests for more details"
        )
      end

      DEFAULT_TIMEOUT_IN_SECONDS
    end

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] Defaults to `ENV["ANTHROPIC_API_KEY"]`
    #
    # @param auth_token [String, nil] Defaults to `ENV["ANTHROPIC_AUTH_TOKEN"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g.,
    # `"https://api.example.com/v2/"`. Defaults to `ENV["ANTHROPIC_BASE_URL"]`
    #
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    #
    # @param timeout [Float]
    #
    # @param initial_retry_delay [Float]
    #
    # @param max_retry_delay [Float]
    def initialize(
      api_key: ENV["ANTHROPIC_API_KEY"],
      auth_token: ENV["ANTHROPIC_AUTH_TOKEN"],
      base_url: ENV["ANTHROPIC_BASE_URL"],
      max_retries: self.class::DEFAULT_MAX_RETRIES,
      timeout: self.class::DEFAULT_TIMEOUT_IN_SECONDS,
      initial_retry_delay: self.class::DEFAULT_INITIAL_RETRY_DELAY,
      max_retry_delay: self.class::DEFAULT_MAX_RETRY_DELAY
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
