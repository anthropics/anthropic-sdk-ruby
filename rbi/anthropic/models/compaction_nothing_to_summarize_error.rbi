# typed: strong

module Anthropic
  module Models
    # `messages` holds no `user` or `assistant` content to summarize or adopt.
    class CompactionNothingToSummarizeError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::CompactionNothingToSummarizeErrorDetails) }
      def details
      end
    end
  end
end
