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

        sig { returns(Symbol) }
        attr_accessor :type

        # A skill referenced by the deployment's agent no longer exists.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :skill_not_found_error)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
