# typed: strong

module Anthropic
  module Models
    BetaContainer = Beta::BetaContainer

    module Beta
      class BetaContainer < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Anthropic::Beta::BetaContainer, Anthropic::Internal::AnyHash)
          end

        # Identifier for the container used in this request
        sig { returns(String) }
        attr_accessor :id

        # The time at which the container will expire.
        sig { returns(Time) }
        attr_accessor :expires_at

        # Skills loaded in the container
        sig { returns(T.nilable(T::Array[Anthropic::Beta::BetaSkill])) }
        attr_accessor :skills

        # Information about the container used in the request (for the code execution
        # tool)
        sig do
          params(
            id: String,
            expires_at: Time,
            skills: T.nilable(T::Array[Anthropic::Beta::BetaSkill::OrHash])
          ).returns(T.attached_class)
        end
        def self.new(
          # Identifier for the container used in this request
          id:,
          # The time at which the container will expire.
          expires_at:,
          # Skills loaded in the container
          skills:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              expires_at: Time,
              skills: T.nilable(T::Array[Anthropic::Beta::BetaSkill])
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
