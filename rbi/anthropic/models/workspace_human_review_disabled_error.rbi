# typed: strong

module Anthropic
  module Models
    # The request's Workspace has Human Review turned off, and this operation is not
    # available there. Use a Workspace with Human Review on.
    class WorkspaceHumanReviewDisabledError < Anthropic::Errors::BadRequestError
      sig { returns(Symbol) }
      def error_code
      end

      sig { returns(Anthropic::WorkspaceHumanReviewDisabledErrorDetails) }
      def details
      end
    end
  end
end
