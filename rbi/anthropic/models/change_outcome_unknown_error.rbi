# typed: strong

module Anthropic
  module Models
    # Some of the request's changes may have been saved and others not. Send the same
    # request again to finish it; changes already saved aren't repeated.
    class ChangeOutcomeUnknownError < Anthropic::Errors::ServiceUnavailableError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::ChangeOutcomeUnknownErrorDetails) }
      def details
      end
    end
  end
end
