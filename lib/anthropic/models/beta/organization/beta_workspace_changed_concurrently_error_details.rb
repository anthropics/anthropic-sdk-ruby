# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaWorkspaceChangedConcurrentlyErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :workspace_changed_concurrently]
          required :error_code, const: :workspace_changed_concurrently

          # @!attribute field
          #   The request field whose change was refused. Other values may be returned. The
          #   value is a name with no data of its own.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaWorkspaceChangedConcurrentlyField]
          required :field, enum: -> { Anthropic::Beta::Organization::BetaWorkspaceChangedConcurrentlyField }

          # @!method initialize(field:, error_code: :workspace_changed_concurrently)
          #   Another request changed the Workspace, so this request left the setting named in
          #   `field` as it is. The error's `message` says which of this request's other
          #   changes are in place. Read the Workspace and send the request again if you still
          #   want the change.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaWorkspaceChangedConcurrentlyErrorDetails}
          #   for more details.
          #
          #   @param field [Symbol, Anthropic::Models::Beta::Organization::BetaWorkspaceChangedConcurrentlyField] The request field whose change was refused. Other values may be returned. The va
          #
          #   @param error_code [Symbol, :workspace_changed_concurrently]
        end
      end
    end
  end
end
