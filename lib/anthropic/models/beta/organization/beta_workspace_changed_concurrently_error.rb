# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # Another request changed the Workspace, so this request left the setting named in
        # `field` as it is. The error's `message` says which of this request's other
        # changes are in place. Read the Workspace and send the request again if you still
        # want the change.
        class BetaWorkspaceChangedConcurrentlyError < Anthropic::Errors::ConflictError
          # @!method error_code
          #   @return [Symbol, :workspace_changed_concurrently]

          # @return [Anthropic::Models::Beta::Organization::BetaWorkspaceChangedConcurrentlyErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaWorkspaceChangedConcurrentlyErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
