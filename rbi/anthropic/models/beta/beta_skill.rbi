# typed: strong

module Anthropic
  module Models
    BetaSkill = Beta::BetaSkill

    module Beta
      class BetaSkill < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Anthropic::Beta::BetaSkill, Anthropic::Internal::AnyHash)
          end

        # Skill ID
        sig { returns(String) }
        attr_accessor :skill_id

        # Type of skill - either 'anthropic' (built-in) or 'custom' (user-defined)
        sig { returns(Anthropic::Beta::BetaSkill::Type::TaggedSymbol) }
        attr_accessor :type

        # Skill version or 'latest' for most recent version
        sig { returns(String) }
        attr_accessor :version

        # A skill that was loaded in a container (response model).
        sig do
          params(
            skill_id: String,
            type: Anthropic::Beta::BetaSkill::Type::OrSymbol,
            version: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Skill ID
          skill_id:,
          # Type of skill - either 'anthropic' (built-in) or 'custom' (user-defined)
          type:,
          # Skill version or 'latest' for most recent version
          version:
        )
        end

        sig do
          override.returns(
            {
              skill_id: String,
              type: Anthropic::Beta::BetaSkill::Type::TaggedSymbol,
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
            T.type_alias { T.all(Symbol, Anthropic::Beta::BetaSkill::Type) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ANTHROPIC =
            T.let(:anthropic, Anthropic::Beta::BetaSkill::Type::TaggedSymbol)
          CUSTOM =
            T.let(:custom, Anthropic::Beta::BetaSkill::Type::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaSkill::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
