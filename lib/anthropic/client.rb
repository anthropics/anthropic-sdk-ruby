# frozen_string_literal: true

module Anthropic
  class Client < Anthropic::Transport::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Default per-request timeout.
    DEFAULT_TIMEOUT_IN_SECONDS = 600.0

    # Default initial retry delay in seconds.
    # Overall delay is calculated using exponential backoff + jitter.
    DEFAULT_INITIAL_RETRY_DELAY = 0.5

    # Default max retry delay in seconds.
    DEFAULT_MAX_RETRY_DELAY = 8.0

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

    # Creates and returns a new client for interacting with the API.
    #
    # @param api_key [String, nil] Defaults to `ENV["ANTHROPIC_API_KEY"]`
    #
    # @param auth_token [String, nil] Defaults to `ENV["ANTHROPIC_AUTH_TOKEN"]`
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g., `"https://api.example.com/v2/"`
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
      base_url: nil,
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
