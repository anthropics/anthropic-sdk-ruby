# typed: strong

module Anthropic
  module Errors
    class Error < StandardError
      sig { returns(T.nilable(StandardError)) }
      attr_accessor :cause
    end

    # Raise from a middleware to opt a middleware-origin failure into the SDK's
    # retry loop. Retry classification walks `Exception#cause`.
    class RetryableError < Anthropic::Errors::Error
    end

    class ConversionError < Anthropic::Errors::Error
      sig { returns(T.nilable(StandardError)) }
      def cause
      end

      # @api private
      sig do
        params(
          on: T::Class[StandardError],
          method: Symbol,
          target: T.anything,
          value: T.anything,
          cause: T.nilable(StandardError)
        ).returns(T.attached_class)
      end
      def self.new(on:, method:, target:, value:, cause: nil)
      end
    end

    class APIError < Anthropic::Errors::Error
      sig { returns(URI::Generic) }
      attr_accessor :url

      sig { returns(T.nilable(Integer)) }
      attr_accessor :status

      sig { returns(T.nilable(T::Hash[String, String])) }
      attr_accessor :headers

      sig { returns(T.nilable(T.anything)) }
      attr_accessor :body

      sig { returns(T.nilable(String)) }
      def request_id
      end

      sig { returns(T.nilable(String)) }
      def workspace_id
      end

      # @api private
      sig do
        params(
          url: URI::Generic,
          status: T.nilable(Integer),
          headers: T.nilable(T::Hash[String, String]),
          body: T.nilable(Object),
          request: NilClass,
          response: NilClass,
          message: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        url:,
        status: nil,
        headers: nil,
        body: nil,
        request: nil,
        response: nil,
        message: nil
      )
      end
    end

    class APIConnectionError < Anthropic::Errors::APIError
      sig { returns(NilClass) }
      attr_accessor :status

      sig { returns(NilClass) }
      attr_accessor :body

      # @api private
      sig do
        params(
          url: URI::Generic,
          status: NilClass,
          headers: T.nilable(T::Hash[String, String]),
          body: NilClass,
          request: NilClass,
          response: NilClass,
          message: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        url:,
        status: nil,
        headers: nil,
        body: nil,
        request: nil,
        response: nil,
        message: "Connection error."
      )
      end
    end

    class APITimeoutError < Anthropic::Errors::APIConnectionError
      # @api private
      sig do
        params(
          url: URI::Generic,
          status: NilClass,
          headers: T.nilable(T::Hash[String, String]),
          body: NilClass,
          request: NilClass,
          response: NilClass,
          message: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        url:,
        status: nil,
        headers: nil,
        body: nil,
        request: nil,
        response: nil,
        message: "Request timed out."
      )
      end
    end

    class APIStatusError < Anthropic::Errors::APIError
      # A human-readable explanation of the error. Its wording can change, so don't
      # match on it.
      #
      # `error.message` from the response body, if present.
      sig { returns(T.nilable(String)) }
      def api_message
      end

      # The broad category of the error.
      #
      # `error.type` from the response body, if present.
      sig { returns(T.nilable(Anthropic::ErrorType::TaggedSymbol)) }
      def type
      end

      # A stable code that names the cause.
      #
      # `error.details.error_code` from the response body, if present and a string.
      sig { returns(T.nilable(Symbol)) }
      def error_code
      end

      # Machine-readable detail about the cause of the error. `error_code` names the
      # cause; branch on it rather than on `message`. Absent when the error has no code.
      # Treat an unrecognized `error_code` as the bare `type`.
      #
      # `error.details` from the response body, if present.
      sig { returns(T.nilable(Anthropic::ErrorDetails::Variants)) }
      def details
      end

      # @api private
      sig do
        params(
          url: URI::Generic,
          status: Integer,
          headers: T.nilable(T::Hash[String, String]),
          body: T.nilable(Object),
          request: NilClass,
          response: NilClass,
          message: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.for(
        url:,
        status:,
        headers:,
        body:,
        request:,
        response:,
        message: nil
      )
      end

      sig { returns(Integer) }
      attr_accessor :status

      # @api private
      sig do
        params(
          url: URI::Generic,
          status: Integer,
          headers: T.nilable(T::Hash[String, String]),
          body: T.nilable(Object),
          request: NilClass,
          response: NilClass,
          message: T.nilable(String)
        ).returns(T.attached_class)
      end
      def self.new(
        url:,
        status:,
        headers:,
        body:,
        request:,
        response:,
        message: nil
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
      HTTP_STATUS = T.let((500..), T::Range[Integer])
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
