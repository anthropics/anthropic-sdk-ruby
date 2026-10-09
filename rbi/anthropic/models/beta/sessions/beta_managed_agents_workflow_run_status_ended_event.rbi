# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunStatusEndedEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunStatusEndedEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Timestamp when this event was processed.
          sig { returns(Time) }
          attr_accessor :processed_at

          # How the run ended.
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResult::Variants
            )
          end
          attr_accessor :result

          sig { returns(Symbol) }
          attr_accessor :type

          # Identifier of the run. The same value is on all of the run's `workflow_run.*`
          # events.
          sig { returns(String) }
          attr_accessor :workflow_run_id

          # A workflow run ended. Emitted once per run, as the last of the run's
          # `workflow_run.*` events.
          sig do
            params(
              id: String,
              processed_at: Time,
              result:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResultCompleted::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResultError::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResultStopped::OrHash
                ),
              workflow_run_id: String,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Timestamp when this event was processed.
            processed_at:,
            # How the run ended.
            result:,
            # Identifier of the run. The same value is on all of the run's `workflow_run.*`
            # events.
            workflow_run_id:,
            type: :"workflow_run.status_ended"
          )
          end

          sig do
            override.returns(
              {
                id: String,
                processed_at: Time,
                result:
                  Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResult::Variants,
                type: Symbol,
                workflow_run_id: String
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
