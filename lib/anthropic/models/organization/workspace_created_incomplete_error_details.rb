# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class WorkspaceCreatedIncompleteErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :workspace_created_incomplete]
        required :error_code, const: :workspace_created_incomplete

        # @!attribute workspace_id
        #   ID of the Workspace the request created.
        #
        #   @return [String]
        required :workspace_id, String

        # @!method initialize(workspace_id:, error_code: :workspace_created_incomplete)
        #   The Workspace was created, but some of what the request asked for did not take
        #   effect, or may not have. Don't send the create again. The error's `message` says
        #   what to do with the Workspace at `workspace_id`.
        #
        #   @param workspace_id [String] ID of the Workspace the request created.
        #
        #   @param error_code [Symbol, :workspace_created_incomplete]
      end
    end
  end
end
