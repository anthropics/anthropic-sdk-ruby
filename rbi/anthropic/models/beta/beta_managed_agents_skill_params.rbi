# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSkillParams = Beta::BetaManagedAgentsSkillParams

    module Beta
      # Skill to load in the session container.
      module BetaManagedAgentsSkillParams
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAnthropicSkillParams,
              Anthropic::Beta::BetaManagedAgentsCustomSkillParams
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsSkillParams::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ANTHROPIC =
            T.let(
              :anthropic,
              Anthropic::Beta::BetaManagedAgentsSkillParams::Type::TaggedSymbol
            )
          CUSTOM =
            T.let(
              :custom,
              Anthropic::Beta::BetaManagedAgentsSkillParams::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSkillParams::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaManagedAgentsSkillParams::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: T.any(Symbol, String),
            skill_id: String,
            version: T.nilable(String)
          ).returns(Anthropic::Beta::BetaManagedAgentsSkillParams::Variants)
        end
        def self.new(
          type:,
          # Identifier of the Anthropic skill (e.g., "xlsx").
          skill_id:,
          # Version to pin. Defaults to latest if omitted.
          version: nil
        )
        end
      end
    end
  end
end
