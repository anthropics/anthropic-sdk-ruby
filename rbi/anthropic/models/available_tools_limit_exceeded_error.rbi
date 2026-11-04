# typed: strong

module Anthropic
  module Models
    # The tools available after a message exceed a limit on their number or their
    # size.
    class AvailableToolsLimitExceededError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::AvailableToolsLimitExceededErrorDetails) }
      def details
      end
    end
  end
end
