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

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # A referenced resource no longer exists and its kind was not reported.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          SESSION_RESOURCE_NOT_FOUND_ERROR =
            T.let(
              :session_resource_not_found_error,
              Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsSessionResourceNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
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
