# typed: strong

module Anthropic
  module Models
    # The request combines `thread` with a request field or an organization setting
    # that Threads do not support; `unsupported`, when present, names it. Send the
    # full conversation without `thread`, or change that field.
    class ThreadUnsupportedRequestError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::ThreadUnsupportedRequestErrorDetails) }
      def details
      end
    end
  end
end
