# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunCreatedEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunCreatedEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Description that the agent gave the run, passed on as written, or `null` if it
          # gave none.
          sig { returns(T.nilable(String)) }
          attr_accessor :description

          # Name that the agent gave the run, passed on as written, or a name that the
          # server assigned.
          sig { returns(String) }
          attr_accessor :name

          # The phases that the run's plan declares, in the plan's order. Can be empty.
          sig do
            returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunPhase
              ]
            )
          end
          attr_accessor :phases

          # Timestamp when this event was processed.
          sig { returns(Time) }
          attr_accessor :processed_at

          sig { returns(Symbol) }
          attr_accessor :type

          # Identifier of the run. The same value is on all of the run's `workflow_run.*`
          # events.
          sig { returns(String) }
          attr_accessor :workflow_run_id

          # A workflow run was created. A workflow run is background work that the session's
          # agent starts. Emitted once per run, before the run's other `workflow_run.*`
          # events.
          sig do
            params(
              id: String,
              description: T.nilable(String),
              name: String,
              phases:
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunPhase::OrHash
                ],
              processed_at: Time,
              workflow_run_id: String,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Description that the agent gave the run, passed on as written, or `null` if it
            # gave none.
            description:,
            # Name that the agent gave the run, passed on as written, or a name that the
            # server assigned.
            name:,
            # The phases that the run's plan declares, in the plan's order. Can be empty.
            phases:,
            # Timestamp when this event was processed.
            processed_at:,
            # Identifier of the run. The same value is on all of the run's `workflow_run.*`
            # events.
            workflow_run_id:,
            type: :"workflow_run.created"
          )
          end

          sig do
            override.returns(
              {
                id: String,
                description: T.nilable(String),
                name: String,
                phases:
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunPhase
                  ],
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
