# typed: strong

module Anthropic
  module Models
    BetaContainerParams = Beta::BetaContainerParams

    module Beta
      class BetaContainerParams < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaContainerParams,
              Anthropic::Internal::AnyHash
            )
          end

        # Container id
        sig { returns(T.nilable(String)) }
        attr_accessor :id

        # List of skills to load in the container
        sig { returns(T.nilable(T::Array[Anthropic::Beta::BetaSkillParams])) }
        attr_accessor :skills

        # Container parameters with skills to be loaded.
        sig do
          params(
            id: T.nilable(String),
            skills:
              T.nilable(T::Array[Anthropic::Beta::BetaSkillParams::OrHash])
          ).returns(T.attached_class)
        end
        def self.new(
          # Container id
          id: nil,
          # List of skills to load in the container
          skills: nil
        )
        end

        sig do
          override.returns(
            {
              id: T.nilable(String),
              skills: T.nilable(T::Array[Anthropic::Beta::BetaSkillParams])
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
