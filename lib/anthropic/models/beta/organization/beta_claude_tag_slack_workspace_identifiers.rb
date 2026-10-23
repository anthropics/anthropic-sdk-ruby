# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSlackWorkspaceIdentifiers < Anthropic::Internal::Type::BaseModel
          # @!attribute workspace_id
          #   Slack's identifier for the workspace, starting with `T`, such as `T0123ABCD`.
          #
          #   @return [String]
          required :workspace_id, String

          # @!method initialize(workspace_id:)
          #   The identifier Slack shows for a workspace. It is Slack's own, not an identifier
          #   of this API.
          #
          #   @param workspace_id [String] Slack's identifier for the workspace, starting with `T`, such as `T0123ABCD`.
        end
      end
    end
  end
end
