# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsCustomSkillParams =
      Beta::BetaManagedAgentsCustomSkillParams

    module Beta
      class BetaManagedAgentsCustomSkillParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsCustomSkillParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Tagged ID of the custom skill (e.g., "skill_01XJ5...").
        sig { returns(String) }
        attr_accessor :skill_id

        sig { returns(Symbol) }
        attr_accessor :type

        # Version to pin. Defaults to latest if omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :version

        # A user-created custom skill.
        sig do
          params(
            skill_id: String,
            version: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Tagged ID of the custom skill (e.g., "skill_01XJ5...").
          skill_id:,
          # Version to pin. Defaults to latest if omitted.
          version: nil,
          type: :custom
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
