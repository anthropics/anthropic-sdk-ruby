# frozen_string_literal: true

module Anthropic
  module Errors
    class Error < StandardError
      # @!attribute cause
      #
      #   @return [StandardError, nil]
    end

    # Raise from a middleware to explicitly opt a middleware-origin failure
    # into the SDK's retry loop. Retry classification walks `Exception#cause`,
    # so a middleware may wrap with its own error class and still have the SDK
    # retry as long as `RetryableError` is reachable via the cause chain.
    #
    # @example
    #   begin
    #     backend.call
    #   rescue BackendUnavailable => e
    #     raise Anthropic::Errors::RetryableError, cause: e
    #   end
    class RetryableError < Anthropic::Errors::Error
    end

    class ConversionError < Anthropic::Errors::Error
      # @return [StandardError, nil]
      def cause = @cause.nil? ? super : @cause

      # @api private
      #
      # @param on [Class<StandardError>]
      # @param method [Symbol]
      # @param target [Object]
      # @param value [Object]
      # @param cause [StandardError, nil]
      def initialize(on:, method:, target:, value:, cause: nil)
        cls = on.name.split("::").last

        message = [
          "Failed to parse #{cls}.#{method} from #{value.class} to #{target.inspect}.",
          "To get the unparsed API response, use #{cls}[#{method.inspect}].",
          cause && "Cause: #{cause.message}"
        ].filter(&:itself).join(" ")

        @cause = cause
        super(message)
      end
    end

    class APIError < Anthropic::Errors::Error
      # @return [URI::Generic]
      attr_accessor :url

      # @return [Integer, nil]
      attr_accessor :status

      # @return [Hash{String=>String}, nil]
      attr_accessor :headers

      # @return [Object, nil]
      attr_accessor :body

      # @return [String, nil]
      def request_id = headers&.[]("request-id")

      # @return [String, nil]
      def workspace_id = headers&.[]("anthropic-workspace-id")

      # @api private
      #
      # @param url [URI::Generic]
      # @param status [Integer, nil]
      # @param headers [Hash{String=>String}, nil]
      # @param body [Object, nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(url:, status: nil, headers: nil, body: nil, request: nil, response: nil, message: nil)
        @url = url
        @status = status
        @headers = headers
        @body = body
        @request = request
        @response = response
        super(message)
      end
    end

    class APIConnectionError < Anthropic::Errors::APIError
      # @!attribute status
      #
      #   @return [nil]

      # @!attribute body
      #
      #   @return [nil]

      # @api private
      #
      # @param url [URI::Generic]
      # @param status [nil]
      # @param headers [Hash{String=>String}, nil]
      # @param body [nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(
        url:,
        status: nil,
        headers: nil,
        body: nil,
        request: nil,
        response: nil,
        message: "Connection error."
      )
        super
      end
    end

    class APITimeoutError < Anthropic::Errors::APIConnectionError
      # @api private
      #
      # @param url [URI::Generic]
      # @param status [nil]
      # @param headers [Hash{String=>String}, nil]
      # @param body [nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(
        url:,
        status: nil,
        headers: nil,
        body: nil,
        request: nil,
        response: nil,
        message: "Request timed out."
      )
        super
      end
    end

    class APIStatusError < Anthropic::Errors::APIError
      # `error.message` from the response body, if present.
      #
      # @return [String, nil]
      def api_message = Anthropic::Internal::Util.dig(body, [:error, :message])

      # `error.type` from the response body, if present.
      #
      # @return [Symbol, Anthropic::Models::ErrorType, nil]
      def type
        value = Anthropic::Internal::Util.dig(body, [:error, :type])
        value.is_a?(String) ? value.to_sym : value
      end

      # `error.details.error_code` from the response body, if present and a string.
      #
      # @return [Symbol, nil]
      def error_code
        code = Anthropic::Internal::Util.dig(body, [:error, :details, :error_code])
        code.to_sym if code.is_a?(String)
      end

      # `error.details` from the response body, if present.
      #
      # @return [Anthropic::Models::ErrorDetails, nil]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::ErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end

      # @api private
      #
      # @param url [URI::Generic]
      # @param status [Integer]
      # @param headers [Hash{String=>String}, nil]
      # @param body [Object, nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      #
      # @return [self]
      def self.for(url:, status:, headers:, body:, request:, response:, message: nil)
        kwargs =
          {
            url: url,
            status: status,
            headers: headers,
            body: body,
            request: request,
            response: response,
            message: message
          }

        error_code = Anthropic::Internal::Util.dig(body, [:error, :details, :error_code])
        error_class = Anthropic::Errors::ERROR_CLASSES[[status, error_code]]
        error_class ||= Anthropic::Errors::ERROR_CLASSES[[status, nil]]
        error_class ||= status >= 500 ? Anthropic::Errors::InternalServerError : Anthropic::Errors::APIStatusError
        error_class.new(**kwargs)
      end

      # @!parse
      #   # @return [Integer]
      #   attr_accessor :status

      # @api private
      #
      # @param url [URI::Generic]
      # @param status [Integer]
      # @param headers [Hash{String=>String}, nil]
      # @param body [Object, nil]
      # @param request [nil]
      # @param response [nil]
      # @param message [String, nil]
      def initialize(url:, status:, headers:, body:, request:, response:, message: nil)
        message ||= {url: url.to_s, status: status, body: body}
        super(
          url: url,
          status: status,
          headers: headers,
          body: body,
          request: request,
          response: response,
          message: message&.to_s
        )
      end
    end

    class BadRequestError < Anthropic::Errors::APIStatusError
      HTTP_STATUS = 400
    end

    class AuthenticationError < Anthropic::Errors::APIStatusError
      HTTP_STATUS = 401
    end

    class PermissionDeniedError < Anthropic::Errors::APIStatusError
      HTTP_STATUS = 403
    end

    class NotFoundError < Anthropic::Errors::APIStatusError
      HTTP_STATUS = 404
    end

    class RequestTimeoutError < Anthropic::Errors::APIStatusError
      HTTP_STATUS = 408
    end

    class ConflictError < Anthropic::Errors::APIStatusError
      HTTP_STATUS = 409
    end

    class PreconditionFailedError < Anthropic::Errors::APIStatusError
      HTTP_STATUS = 412
    end

    class ContentTooLargeError < Anthropic::Errors::APIStatusError
      HTTP_STATUS = 413
    end

    class UnprocessableEntityError < Anthropic::Errors::APIStatusError
      HTTP_STATUS = 422
    end

    class RateLimitError < Anthropic::Errors::APIStatusError
      HTTP_STATUS = 429
    end

    class RequestHeaderFieldsTooLargeError < Anthropic::Errors::APIStatusError
      HTTP_STATUS = 431
    end

    class ClientClosedRequestError < Anthropic::Errors::APIStatusError
      HTTP_STATUS = 499
    end

    class InternalServerError < Anthropic::Errors::APIStatusError
      HTTP_STATUS = (500..)
    end

    class HTTPNotImplementedError < Anthropic::Errors::InternalServerError
      HTTP_STATUS = 501
    end

    class ServiceUnavailableError < Anthropic::Errors::InternalServerError
      HTTP_STATUS = 503
    end

    class GatewayTimeoutError < Anthropic::Errors::InternalServerError
      HTTP_STATUS = 504
    end

    class OverloadedError < Anthropic::Errors::InternalServerError
      HTTP_STATUS = 529
    end

    class ConfigurationError < Anthropic::Errors::Error
    end
  end
end
