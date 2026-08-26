# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class BetaFederationRuleWorkspace < Anthropic::Internal::Type::BaseModel
            # @!attribute created_at
            #   When this workspace was enabled for the rule.
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute created_by_actor_id
            #   Tagged ID (`user_...` or `svac_...`) of the actor that enabled this workspace
            #   for the rule, if known.
            #
            #   @return [String, nil]
            required :created_by_actor_id, String, nil?: true

            # @!attribute federation_rule_id
            #   Tagged ID of the federation rule.
            #
            #   @return [String]
            required :federation_rule_id, String

            # @!attribute type
            #
            #   @return [Symbol, :federation_rule_workspace]
            required :type, const: :federation_rule_workspace

            # @!attribute workspace_id
            #   Tagged ID of the workspace this rule is enabled for.
            #
            #   @return [String]
            required :workspace_id, String

            # @!attribute workspace_name
            #   Workspace display name. Populated when listing; null in the enable response.
            #
            #   @return [String, nil]
            required :workspace_name, String, nil?: true

            # @!method initialize(created_at:, created_by_actor_id:, federation_rule_id:, workspace_id:, workspace_name:, type: :federation_rule_workspace)
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Federation::BetaFederationRuleWorkspace}
            #   for more details.
            #
            #   @param created_at [Time] When this workspace was enabled for the rule.
            #
            #   @param created_by_actor_id [String, nil] Tagged ID (`user_...` or `svac_...`) of the actor that enabled this workspace fo
            #
            #   @param federation_rule_id [String] Tagged ID of the federation rule.
            #
            #   @param workspace_id [String] Tagged ID of the workspace this rule is enabled for.
            #
            #   @param workspace_name [String, nil] Workspace display name. Populated when listing; null in the enable response.
            #
            #   @param type [Symbol, :federation_rule_workspace]
          end
        end
      end
    end
  end
end
