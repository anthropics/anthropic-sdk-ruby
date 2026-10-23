# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeTag
          module Bundles
            class BetaClaudeTagSlackWorkspaceBundleTarget < Anthropic::Internal::Type::BaseModel
              # @!attribute id
              #   The Bundle Target's identifier. Starts with `btgt_`. No two Bundle Targets have
              #   the same one, and the same Bundle and target always give the same one, also
              #   after a detach and a new attach. It is opaque.
              #
              #   @return [String]
              required :id, String

              # @!attribute created_at
              #   Time the Bundle was attached.
              #
              #   @return [Time]
              required :created_at, Time

              # @!attribute slack_workspace_id
              #   The identifier of the Slack workspace the Bundle is attached to, starting with
              #   `slws_`.
              #
              #   @return [String]
              required :slack_workspace_id, String

              # @!attribute type
              #
              #   @return [Symbol, :slack_workspace]
              required :type, const: :slack_workspace

              # @!method initialize(id:, created_at:, slack_workspace_id:, type: :slack_workspace)
              #   One Bundle attached to one Slack workspace. The Bundle can be used in the
              #   workspace and in every channel in it.
              #
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::Organization::ClaudeTag::Bundles::BetaClaudeTagSlackWorkspaceBundleTarget}
              #   for more details.
              #
              #   @param id [String] The Bundle Target's identifier. Starts with `btgt_`. No two Bundle Targets have
              #
              #   @param created_at [Time] Time the Bundle was attached.
              #
              #   @param slack_workspace_id [String] The identifier of the Slack workspace the Bundle is attached to, starting with `
              #
              #   @param type [Symbol, :slack_workspace]
            end
          end
        end
      end
    end
  end
end
