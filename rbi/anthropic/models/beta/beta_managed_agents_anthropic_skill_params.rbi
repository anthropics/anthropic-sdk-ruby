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

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams::Type::OrSymbol
          )
        end
        attr_accessor :type

        # Version to pin. Defaults to latest if omitted.
        sig { returns(T.nilable(String)) }
        attr_accessor :version

        # An Anthropic-managed skill.
        sig do
          params(
            skill_id: String,
            type:
              Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams::Type::OrSymbol,
            version: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Identifier of the Anthropic skill (e.g., "xlsx").
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
                Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams::Type::OrSymbol,
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
                Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ANTHROPIC =
            T.let(
              :anthropic,
              Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams::Type::TaggedSymbol
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
