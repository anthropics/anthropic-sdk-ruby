# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsCustomSkill = Beta::BetaManagedAgentsCustomSkill

    module Beta
      class BetaManagedAgentsCustomSkill < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsCustomSkill,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(String) }
        attr_accessor :skill_id

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsCustomSkill::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        sig { returns(String) }
        attr_accessor :version

        # A resolved user-created custom skill.
        sig do
          params(
            skill_id: String,
            type: Anthropic::Beta::BetaManagedAgentsCustomSkill::Type::OrSymbol,
            version: String
          ).returns(T.attached_class)
        end
        def self.new(skill_id:, type:, version:)
        end

        sig do
          override.returns(
            {
              skill_id: String,
              type:
                Anthropic::Beta::BetaManagedAgentsCustomSkill::Type::TaggedSymbol,
              version: String
            }
          )
        end
        def to_hash
        end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaManagedAgentsCustomSkill::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          CUSTOM =
            T.let(
              :custom,
              Anthropic::Beta::BetaManagedAgentsCustomSkill::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsCustomSkill::Type::TaggedSymbol
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
