# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError

    module Beta
      class BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The deployment's workspace was archived.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          WORKSPACE_ARCHIVED_ERROR =
            T.let(
              :workspace_archived_error,
              Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsWorkspaceArchivedDeploymentPausedReasonError::Type::TaggedSymbol
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
