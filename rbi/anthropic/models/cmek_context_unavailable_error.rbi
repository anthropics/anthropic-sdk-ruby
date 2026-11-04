# typed: strong

module Anthropic
  module Models
    # The workspace's encryption settings could not be read, so the request was
    # refused. Retry in a few minutes.
    class CMEKContextUnavailableError < Anthropic::Errors::ServiceUnavailableError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::CMEKContextUnavailableErrorDetails) }
      def details
      end
    end
  end
end
