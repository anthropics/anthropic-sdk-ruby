# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunPhase < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunPhase,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for the phase.
          sig { returns(String) }
          attr_accessor :id

          # Description that the agent gave the phase, passed on as written, or `null` if it
          # gave none.
          sig { returns(T.nilable(String)) }
          attr_accessor :description

          # Name that the agent gave the phase, passed on as written.
          sig { returns(String) }
          attr_accessor :name

          # A phase that a workflow run's plan declares.
          sig do
            params(
              id: String,
              description: T.nilable(String),
              name: String
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for the phase.
            id:,
            # Description that the agent gave the phase, passed on as written, or `null` if it
            # gave none.
            description:,
            # Name that the agent gave the phase, passed on as written.
            name:
          )
          end

          sig do
            override.returns(
              { id: String, description: T.nilable(String), name: String }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
