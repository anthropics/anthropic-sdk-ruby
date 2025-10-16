# typed: strong

module Anthropic
  module Models
    BetaSkillParams = Beta::BetaSkillParams

    module Beta
      class BetaSkillParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaSkillParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Skill ID
        sig { returns(String) }
        attr_accessor :skill_id

        # Type of skill - either 'anthropic' (built-in) or 'custom' (user-defined)
        sig { returns(Anthropic::Beta::BetaSkillParams::Type::OrSymbol) }
        attr_accessor :type

        # Skill version or 'latest' for most recent version
        sig { returns(T.nilable(String)) }
        attr_reader :version

        sig { params(version: String).void }
        attr_writer :version

        # Specification for a skill to be loaded in a container (request model).
        sig do
          params(
            skill_id: String,
            type: Anthropic::Beta::BetaSkillParams::Type::OrSymbol,
            version: String
          ).returns(T.attached_class)
        end
        def self.new(
          # Skill ID
          skill_id:,
          # Type of skill - either 'anthropic' (built-in) or 'custom' (user-defined)
          type:,
          # Skill version or 'latest' for most recent version
          version: nil
        )
        end

        sig do
          override.returns(
            {
              skill_id: String,
              type: Anthropic::Beta::BetaSkillParams::Type::OrSymbol,
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
              T.all(Symbol, Anthropic::Beta::BetaSkillParams::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ANTHROPIC =
            T.let(
              :anthropic,
              Anthropic::Beta::BetaSkillParams::Type::TaggedSymbol
            )
          CUSTOM =
            T.let(:custom, Anthropic::Beta::BetaSkillParams::Type::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaSkillParams::Type::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
