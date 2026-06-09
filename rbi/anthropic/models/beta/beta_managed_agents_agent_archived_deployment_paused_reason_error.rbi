# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsAgentArchivedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError

    module Beta
      class BetaManagedAgentsAgentArchivedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # The deployment's agent was archived.
        sig do
          params(
            type:
              Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(type:)
        end

        sig do
          override.returns(
            {
              type:
                Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          AGENT_ARCHIVED_ERROR =
            T.let(
              :agent_archived_error,
              Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsAgentArchivedDeploymentPausedReasonError::Type::TaggedSymbol
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
