# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunStatusIdleEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunStatusIdleEvent,
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

          # A workflow run is idle. Emitted each time the run goes idle, whatever the cause.
          # If the run ends while idle, no `workflow_run.status_running` comes between this
          # event and its `workflow_run.status_ended`.
          sig do
            params(
              id: String,
              processed_at: Time,
              workflow_run_id: String,
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
            type: :"workflow_run.status_idle"
          )
          end

          sig do
            override.returns(
              {
                id: String,
                processed_at: Time,
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
