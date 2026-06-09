# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSkillNotFoundRunError =
      Beta::BetaManagedAgentsSkillNotFoundRunError

    module Beta
      class BetaManagedAgentsSkillNotFoundRunError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSkillNotFoundRunError,
              Anthropic::Internal::AnyHash
            )
          end

        # Human-readable error description.
        sig { returns(String) }
        attr_accessor :message

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsSkillNotFoundRunError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # A skill referenced by the deployment's agent no longer exists.
        sig do
          params(
            message: String,
            type:
              Anthropic::Beta::BetaManagedAgentsSkillNotFoundRunError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Human-readable error description.
          message:,
          type:
        )
        end

        sig do
          override.returns(
            {
              message: String,
              type:
                Anthropic::Beta::BetaManagedAgentsSkillNotFoundRunError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsSkillNotFoundRunError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SKILL_NOT_FOUND_ERROR =
            T.let(
              :skill_not_found_error,
              Anthropic::Beta::BetaManagedAgentsSkillNotFoundRunError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSkillNotFoundRunError::Type::TaggedSymbol
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
