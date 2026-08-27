# typed: strong

module Anthropic
  module Models
    BetaContainerSkill = Beta::BetaContainerSkill

    module Beta
      class BetaContainerSkill < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaContainerSkill,
              Anthropic::Internal::AnyHash
            )
          end

        # Skill ID
        sig { returns(String) }
        attr_accessor :skill_id

        # Type of skill - either 'anthropic' (built-in) or 'custom' (user-defined)
        sig { returns(Anthropic::Beta::BetaContainerSkill::Type::TaggedSymbol) }
        attr_accessor :type

        # The resolved version: a skill version ID for custom skills.
        sig { returns(String) }
        attr_accessor :version

        # A skill that was loaded in a container (response model).
        sig do
          params(
            skill_id: String,
            type: Anthropic::Beta::BetaContainerSkill::Type::OrSymbol,
            version: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Skill ID
          skill_id:,
          # Type of skill - either 'anthropic' (built-in) or 'custom' (user-defined)
          type:,
          # The resolved version: a skill version ID for custom skills.
          version:
        )
        end

        sig do
          override.returns(
            {
              skill_id: String,
              type: Anthropic::Beta::BetaContainerSkill::Type::TaggedSymbol,
              version: String
            }
          )
        end
        def to_hash
        end

        # Type of skill - either 'anthropic' (built-in) or 'custom' (user-defined)
        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaContainerSkill::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ANTHROPIC =
            T.let(
              :anthropic,
              Anthropic::Beta::BetaContainerSkill::Type::TaggedSymbol
            )
          CUSTOM =
            T.let(
              :custom,
              Anthropic::Beta::BetaContainerSkill::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaContainerSkill::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
