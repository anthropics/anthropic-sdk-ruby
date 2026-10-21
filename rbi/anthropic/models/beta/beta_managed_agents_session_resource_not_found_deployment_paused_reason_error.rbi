# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError =
      Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError

    module Beta
      class BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # A referenced resource no longer exists and its kind was not reported.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :session_resource_not_found_error)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
