# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsFileNotFoundDeploymentPausedReasonError =
      Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError

    module Beta
      class BetaManagedAgentsFileNotFoundDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsFileNotFoundDeploymentPausedReasonError,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Symbol) }
        attr_accessor :type

        # A file resource referenced by the deployment no longer exists.
        sig { params(type: Symbol).returns(T.attached_class) }
        def self.new(type: :file_not_found_error)
        end

        sig { override.returns({ type: Symbol }) }
        def to_hash
        end
      end
    end
  end
end
