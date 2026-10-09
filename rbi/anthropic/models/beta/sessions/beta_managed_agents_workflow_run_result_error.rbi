# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunResultError < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResultError,
                Anthropic::Internal::AnyHash
              )
            end

          # Why the run did not finish.
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunError::Variants
            )
          end
          attr_accessor :error

          sig { returns(Symbol) }
          attr_accessor :type

          # The run failed or reached its time limit.
          sig do
            params(
              error:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsTimeoutWorkflowRunError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsProgramWorkflowRunError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUnknownWorkflowRunError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsThreadLimitWorkflowRunError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsMaxWorkflowRunsWorkflowRunError::OrHash
                ),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Why the run did not finish.
            error:,
            type: :error
          )
          end

          sig do
            override.returns(
              {
                error:
                  Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunError::Variants,
                type: Symbol
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
