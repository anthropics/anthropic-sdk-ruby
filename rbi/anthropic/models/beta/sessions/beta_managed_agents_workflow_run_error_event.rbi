# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunErrorEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunErrorEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Why the run did not finish, or was not created.
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunError::Variants
            )
          end
          attr_accessor :error

          # Timestamp when this event was processed.
          sig { returns(Time) }
          attr_accessor :processed_at

          sig { returns(Symbol) }
          attr_accessor :type

          # Identifier of the run that met the error, or `null` when the error kept a run
          # from being created.
          sig { returns(T.nilable(String)) }
          attr_accessor :workflow_run_id

          # A workflow run met an error, or an error kept a run from being created. A run
          # that ends with a `result.type` of `error` emits this event before its
          # `workflow_run.status_ended`, with the same `error`.
          sig do
            params(
              id: String,
              error:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsTimeoutWorkflowRunError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsProgramWorkflowRunError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUnknownWorkflowRunError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsThreadLimitWorkflowRunError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsMaxWorkflowRunsWorkflowRunError::OrHash
                ),
              processed_at: Time,
              workflow_run_id: T.nilable(String),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Why the run did not finish, or was not created.
            error:,
            # Timestamp when this event was processed.
            processed_at:,
            # Identifier of the run that met the error, or `null` when the error kept a run
            # from being created.
            workflow_run_id:,
            type: :"workflow_run.error"
          )
          end

          sig do
            override.returns(
              {
                id: String,
                error:
                  Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunError::Variants,
                processed_at: Time,
                type: Symbol,
                workflow_run_id: T.nilable(String)
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
