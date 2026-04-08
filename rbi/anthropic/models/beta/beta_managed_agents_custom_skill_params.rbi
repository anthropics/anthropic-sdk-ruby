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

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsCustomSkillParams::Type::OrSymbol
          )
        end
        attr_accessor :type

        # Version to pin. Defaults to latest if omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :version

        # A user-created custom skill.
        sig do
          params(
            skill_id: String,
            type:
              Anthropic::Beta::BetaManagedAgentsCustomSkillParams::Type::OrSymbol,
            version: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Tagged ID of the custom skill (e.g., "skill_01XJ5...").
          skill_id:,
          type:,
          # Version to pin. Defaults to latest if omitted.
          version: nil
        )
        end

        sig do
          override.returns(
            {
              skill_id: String,
              type:
                Anthropic::Beta::BetaManagedAgentsCustomSkillParams::Type::OrSymbol,
              version: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsCustomSkillParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CUSTOM =
            T.let(
              :custom,
              Anthropic::Beta::BetaManagedAgentsCustomSkillParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsCustomSkillParams::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
