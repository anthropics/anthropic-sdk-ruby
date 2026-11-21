# frozen_string_literal: true

module Anthropic
  module Models
    class WorkspaceHumanReviewDisabledErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :workspace_human_review_disabled]
      required :error_code, const: :workspace_human_review_disabled

      # @!method initialize(error_code: :workspace_human_review_disabled)
      #   The request's Workspace has Human Review turned off, and this operation is not
      #   available there. Use a Workspace with Human Review on.
      #
      #   @param error_code [Symbol, :workspace_human_review_disabled]
    end
  end
end
