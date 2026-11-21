# frozen_string_literal: true

module Anthropic
  module Models
    # The request's Workspace has Human Review turned off, and this operation is not
    # available there. Use a Workspace with Human Review on.
    class WorkspaceHumanReviewDisabledError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :workspace_human_review_disabled]

      # @return [Anthropic::Models::WorkspaceHumanReviewDisabledErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::WorkspaceHumanReviewDisabledErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
