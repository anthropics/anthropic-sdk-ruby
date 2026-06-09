# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError

    module Beta
      class BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The deployment's environment was archived.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ENVIRONMENT_ARCHIVED_ERROR =
            T.let(
              :environment_archived_error,
              Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsEnvironmentArchivedDeploymentPausedReasonError::Type::TaggedSymbol
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
