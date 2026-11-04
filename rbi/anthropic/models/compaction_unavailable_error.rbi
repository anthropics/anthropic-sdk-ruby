# typed: strong

module Anthropic
  module Models
    # The compaction could not be completed for a transient server reason. Retry the
    # request.
    class CompactionUnavailableError < Anthropic::Errors::OverloadedError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::CompactionUnavailableErrorDetails) }
      def details
      end
    end
  end
end
