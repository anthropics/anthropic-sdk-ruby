# frozen_string_literal: true

module Anthropic
  class Client < Anthropic::BaseClient
    # Default max number of retries to attempt after a failed retryable request.
    DEFAULT_MAX_RETRIES = 2

    # Client option
    # @return [String]
    attr_reader :api_key

    # Client option
    # @return [String]
    attr_reader :auth_token

    # @return [Anthropic::Resources::Completions]
    attr_reader :completions

    # @return [Anthropic::Resources::Messages]
    attr_reader :messages

    # @return [Anthropic::Resources::Beta]
    attr_reader :beta

    # Creates and returns a new client for interacting with the API.
    #
    # @param base_url [String, nil] Override the default base URL for the API, e.g., `"https://api.example.com/v2/"`
    # @param api_key [String, nil] Defaults to `ENV["ANTHROPIC_API_KEY"]`
    # @param auth_token [String, nil] Defaults to `ENV["ANTHROPIC_AUTH_TOKEN"]`
    # @param max_retries [Integer] Max number of retries to attempt after a failed retryable request.
    def initialize(
      base_url: nil,
      api_key: nil,
      auth_token: nil,
      max_retries: DEFAULT_MAX_RETRIES,
      timeout: 600
    )
      base_url ||= "https://api.anthropic.com"

      headers = {"anthropic-version" => "2023-06-01"}

      @api_key = [api_key, ENV["ANTHROPIC_API_KEY"]].find { |v| !v.nil? }
      @auth_token = [auth_token, ENV["ANTHROPIC_AUTH_TOKEN"]].find { |v| !v.nil? }

      super(base_url: base_url, max_retries: max_retries, timeout: timeout, headers: headers)

      @completions = Anthropic::Resources::Completions.new(client: self)
      @messages = Anthropic::Resources::Messages.new(client: self)
      @beta = Anthropic::Resources::Beta.new(client: self)
    end

    # @!visibility private
    private def make_status_error(message:, body:, response:)
      case response.code.to_i
      in 400
        Anthropic::HTTP::BadRequestError.new(message: message, response: response, body: body)
      in 401
        Anthropic::HTTP::AuthenticationError.new(message: message, response: response, body: body)
      in 403
        Anthropic::HTTP::PermissionDeniedError.new(message: message, response: response, body: body)
      in 404
        Anthropic::HTTP::NotFoundError.new(message: message, response: response, body: body)
      in 409
        Anthropic::HTTP::ConflictError.new(message: message, response: response, body: body)
      in 422
        Anthropic::HTTP::UnprocessableEntityError.new(message: message, response: response, body: body)
      in 429
        Anthropic::HTTP::RateLimitError.new(message: message, response: response, body: body)
      in 500..599
        Anthropic::HTTP::InternalServerError.new(message: message, response: response, body: body)
      else
        Anthropic::HTTP::APIStatusError.new(message: message, response: response, body: body)
      end
    end
  end
end
