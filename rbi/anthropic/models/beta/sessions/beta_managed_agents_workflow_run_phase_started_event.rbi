# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunPhaseStartedEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunPhaseStartedEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Timestamp when this event was processed.
          sig { returns(Time) }
          attr_accessor :processed_at

          sig { returns(Symbol) }
          attr_accessor :type

          # Identifier of the run. The same value is on all of the run's `workflow_run.*`
          # events.
          sig { returns(String) }
          attr_accessor :workflow_run_id

          # Identifier of the phase, as in `phases` on the run's `workflow_run.created`
          # event.
          sig { returns(String) }
          attr_accessor :workflow_run_phase_id

          # A workflow run's plan entered a phase.
          sig do
            params(
              id: String,
              processed_at: Time,
              workflow_run_id: String,
              workflow_run_phase_id: String,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Timestamp when this event was processed.
            processed_at:,
            # Identifier of the run. The same value is on all of the run's `workflow_run.*`
            # events.
            workflow_run_id:,
            # Identifier of the phase, as in `phases` on the run's `workflow_run.created`
            # event.
            workflow_run_phase_id:,
            type: :"workflow_run.phase_started"
          )
          end

          sig do
            override.returns(
              {
                id: String,
                processed_at: Time,
                type: Symbol,
                workflow_run_id: String,
                workflow_run_phase_id: String
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
