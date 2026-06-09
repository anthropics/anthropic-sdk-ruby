# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError =
      Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError

    module Beta
      class BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The deployment's environment no longer exists.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENVIRONMENT_NOT_FOUND_ERROR =
            T.let(
              :environment_not_found_error,
              Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsEnvironmentNotFoundDeploymentPausedReasonError::Type::TaggedSymbol
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
