# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsUnknownDeploymentPausedReasonError =
      Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError

    module Beta
      class BetaManagedAgentsUnknownDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsUnknownDeploymentPausedReasonError,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # An unrecognized error auto-paused the deployment. A fallback variant; matches a
        # run whose `error.type` is `unknown_error`.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :unknown_error)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
