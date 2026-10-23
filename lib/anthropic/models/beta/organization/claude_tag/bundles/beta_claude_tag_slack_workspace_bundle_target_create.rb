# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          module Bundles
            class BetaClaudeTagSlackWorkspaceBundleTargetCreate < Anthropic::Internal::Type::BaseModel
              # @!attribute slack_workspace_id
              #   The identifier of the Slack workspace to attach the Bundle to, starting with
              #   `slws_`.
              #
              #   @return [String]
              required :slack_workspace_id, String

              # @!attribute type
              #
              #   @return [Symbol, :slack_workspace]
              required :type, const: :slack_workspace

              # @!method initialize(slack_workspace_id:, type: :slack_workspace)
              #   Attach the Bundle to a Slack workspace.
              #
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTargetCreate}
              #   for more details.
              #
              #   @param slack_workspace_id [String] The identifier of the Slack workspace to attach the Bundle to, starting with `sl
              #
              #   @param type [Symbol, :slack_workspace]
            end
          end
        end
      end
    end
  end
end
