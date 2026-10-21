# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAnthropicSkillParams =
      Beta::BetaManagedAgentsAnthropicSkillParams

    module Beta
      class BetaManagedAgentsAnthropicSkillParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Identifier of the Anthropic skill (e.g., "xlsx").
        sig { returns(String) }
        attr_accessor :skill_id

        sig { returns(Symbol) }
        attr_accessor :type

        # Version to pin. Defaults to latest if omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :version

        # An Anthropic-managed skill.
        sig do
          params(
            skill_id: String,
            version: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Identifier of the Anthropic skill (e.g., "xlsx").
          skill_id:,
          # Version to pin. Defaults to latest if omitted.
          version: nil,
          type: :anthropic
        )
        end

        sig do
          override.returns(
            { skill_id: String, type: Symbol, version: T.nilable(String) }
          )
        end
        def to_hash
        end
      end
    end
  end
end
