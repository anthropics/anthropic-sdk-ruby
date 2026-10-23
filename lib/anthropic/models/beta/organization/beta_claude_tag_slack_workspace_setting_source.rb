# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagSlackWorkspaceSettingSource < Anthropic::Internal::Type::BaseModel
          # @!attribute slack_workspace_id
          #   The workspace's identifier, starting with `slws_`.
          #
          #   @return [String]
          required :slack_workspace_id, String

          # @!attribute type
          #
          #   @return [Symbol, :slack_workspace]
          required :type, const: :slack_workspace

          # @!method initialize(slack_workspace_id:, type: :slack_workspace)
          #   The value comes from a Slack workspace of the organization.
          #
          #   @param slack_workspace_id [String] The workspace's identifier, starting with `slws_`.
          #
          #   @param type [Symbol, :slack_workspace]
        end
      end
    end
  end
end
