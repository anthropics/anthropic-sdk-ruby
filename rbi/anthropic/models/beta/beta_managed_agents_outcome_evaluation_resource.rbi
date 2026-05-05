# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsOutcomeEvaluationResource =
      Beta::BetaManagedAgentsOutcomeEvaluationResource

    module Beta
      class BetaManagedAgentsOutcomeEvaluationResource < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsOutcomeEvaluationResource,
              Anthropic::Internal::AnyHash
            )
          end

        # A timestamp in RFC 3339 format
        sig { returns(T.nilable(Time)) }
        attr_accessor :completed_at

        # What the agent should produce.
        sig { returns(String) }
        attr_accessor :description

        # Grader's verdict text from the most recent evaluation. For satisfied, explains
        # why criteria are met; for needs_revision (intermediate), what's missing; for
        # failed, why unrecoverable.
        sig { returns(T.nilable(String)) }
        attr_accessor :explanation

        # 0-indexed revision cycle the outcome is currently on.
        sig { returns(Integer) }
        attr_accessor :iteration

        # Server-generated outc\_ ID for this outcome.
        sig { returns(String) }
        attr_accessor :outcome_id

        # Current evaluation state. 'pending' before the agent begins work; 'running'
        # while producing or revising; 'evaluating' while the grader scores;
        # 'satisfied'/'max_iterations_reached'/'failed'/'interrupted' are terminal.
        sig { returns(String) }
        attr_accessor :result

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsOutcomeEvaluationResource::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Evaluation state for a single outcome defined via a define_outcome event.
        sig do
          params(
            completed_at: T.nilable(Time),
            description: String,
            explanation: T.nilable(String),
            iteration: Integer,
            outcome_id: String,
            result: String,
            type:
              Anthropic::Beta::BetaManagedAgentsOutcomeEvaluationResource::Type::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # A timestamp in RFC 3339 format
          completed_at:,
          # What the agent should produce.
          description:,
          # Grader's verdict text from the most recent evaluation. For satisfied, explains
          # why criteria are met; for needs_revision (intermediate), what's missing; for
          # failed, why unrecoverable.
          explanation:,
          # 0-indexed revision cycle the outcome is currently on.
          iteration:,
          # Server-generated outc\_ ID for this outcome.
          outcome_id:,
          # Current evaluation state. 'pending' before the agent begins work; 'running'
          # while producing or revising; 'evaluating' while the grader scores;
          # 'satisfied'/'max_iterations_reached'/'failed'/'interrupted' are terminal.
          result:,
          type:
        )
        end

        sig do
          override.returns(
            {
              completed_at: T.nilable(Time),
              description: String,
              explanation: T.nilable(String),
              iteration: Integer,
              outcome_id: String,
              result: String,
              type:
                Anthropic::Beta::BetaManagedAgentsOutcomeEvaluationResource::Type::TaggedSymbol
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
                Anthropic::Beta::BetaManagedAgentsOutcomeEvaluationResource::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          OUTCOME_EVALUATION =
            T.let(
              :outcome_evaluation,
              Anthropic::Beta::BetaManagedAgentsOutcomeEvaluationResource::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsOutcomeEvaluationResource::Type::TaggedSymbol
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
