# typed: strong

module Anthropic
  module Models
    # The compaction request ends on an `assistant` turn that is not finished.
    class CompactionIncompleteTurnError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::CompactionIncompleteTurnErrorDetails) }
      def details
      end
    end
  end
end
