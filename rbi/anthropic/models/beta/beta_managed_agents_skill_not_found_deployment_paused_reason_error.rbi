# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError =
      Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError

    module Beta
      class BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # A skill referenced by the deployment's agent no longer exists.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SKILL_NOT_FOUND_ERROR =
            T.let(
              :skill_not_found_error,
              Anthropic::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSkillNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
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
