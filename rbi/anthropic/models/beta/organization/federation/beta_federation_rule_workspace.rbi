# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class BetaFederationRuleWorkspace < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Federation::BetaFederationRuleWorkspace,
                  Anthropic::Internal::AnyHash
                )
              end

            # When this workspace was enabled for the rule.
            sig { returns(Time) }
            attr_accessor :created_at

            # Tagged ID (`user_...` or `svac_...`) of the actor that enabled this workspace
            # for the rule, if known.
            sig { returns(T.nilable(String)) }
            attr_accessor :created_by_actor_id

            # Tagged ID of the federation rule.
            sig { returns(String) }
            attr_accessor :federation_rule_id

            sig { returns(Symbol) }
            attr_accessor :type

            # Tagged ID of the workspace this rule is enabled for.
            sig { returns(String) }
            attr_accessor :workspace_id

            # Workspace display name. Populated when listing; null in the enable response.
            sig { returns(T.nilable(String)) }
            attr_accessor :workspace_name

            sig do
              params(
                created_at: Time,
                created_by_actor_id: T.nilable(String),
                federation_rule_id: String,
                workspace_id: String,
                workspace_name: T.nilable(String),
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # When this workspace was enabled for the rule.
              created_at:,
              # Tagged ID (`user_...` or `svac_...`) of the actor that enabled this workspace
              # for the rule, if known.
              created_by_actor_id:,
              # Tagged ID of the federation rule.
              federation_rule_id:,
              # Tagged ID of the workspace this rule is enabled for.
              workspace_id:,
              # Workspace display name. Populated when listing; null in the enable response.
              workspace_name:,
              type: :federation_rule_workspace
            )
            end

            sig do
              override.returns(
                {
                  created_at: Time,
                  created_by_actor_id: T.nilable(String),
                  federation_rule_id: String,
                  type: Symbol,
                  workspace_id: String,
                  workspace_name: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
