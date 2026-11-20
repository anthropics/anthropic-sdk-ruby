# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # The Workspace was created, but some of what the request asked for did not take
      # effect, or may not have. Don't send the create again. The error's `message` says
      # what to do with the Workspace at `workspace_id`.
      class WorkspaceCreatedIncompleteError < Anthropic::Errors::ServiceUnavailableError
        # @!method error_code
        #   @return [Symbol, :workspace_created_incomplete]

        # @return [Anthropic::Models::Organization::WorkspaceCreatedIncompleteErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::WorkspaceCreatedIncompleteErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
