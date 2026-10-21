# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSpanOutcomeEvaluationEndEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # Human-readable explanation of the verdict. For `needs_revision`, describes which
          # criteria failed and why.
          sig { returns(String) }
          attr_accessor :explanation

          # 0-indexed revision cycle, matching the corresponding
          # `span.outcome_evaluation_start`.
          sig { returns(Integer) }
          attr_accessor :iteration

          # The id of the corresponding `span.outcome_evaluation_start` event.
          sig { returns(String) }
          attr_accessor :outcome_evaluation_start_id

          # The `outc_` ID of the outcome being evaluated.
          sig { returns(String) }
          attr_accessor :outcome_id

          # Timestamp when outcome evaluation ended.
          sig { returns(Time) }
          attr_accessor :processed_at

          # Evaluation verdict. 'satisfied': criteria met, session goes idle.
          # 'needs_revision': criteria not met, another revision cycle follows.
          # 'max_iterations_reached': evaluation budget exhausted with criteria still unmet
          # — one final acknowledgment turn follows before the session goes idle, but no
          # further evaluation runs. 'failed': grader determined the rubric does not apply
          # to the deliverables. 'interrupted': user sent an interrupt while evaluation was
          # in progress.
          sig { returns(String) }
          attr_accessor :result

          sig { returns(Symbol) }
          attr_accessor :type

          # Aggregate token usage for this evaluation cycle. Sums across all grader model
          # requests within the cycle.
          sig do
            returns(Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelUsage)
          end
          attr_reader :usage

          sig do
            params(
              usage:
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelUsage::OrHash
            ).void
          end
          attr_writer :usage

          # Emitted when an outcome evaluation cycle completes. Carries the verdict and
          # aggregate token usage. A verdict of `needs_revision` means another evaluation
          # cycle follows; `satisfied`, `max_iterations_reached`, `failed`, or `interrupted`
          # are terminal — no further evaluation cycles follow.
          sig do
            params(
              id: String,
              explanation: String,
              iteration: Integer,
              outcome_evaluation_start_id: String,
              outcome_id: String,
              processed_at: Time,
              result: String,
              usage:
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelUsage::OrHash,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # Human-readable explanation of the verdict. For `needs_revision`, describes which
            # criteria failed and why.
            explanation:,
            # 0-indexed revision cycle, matching the corresponding
            # `span.outcome_evaluation_start`.
            iteration:,
            # The id of the corresponding `span.outcome_evaluation_start` event.
            outcome_evaluation_start_id:,
            # The `outc_` ID of the outcome being evaluated.
            outcome_id:,
            # Timestamp when outcome evaluation ended.
            processed_at:,
            # Evaluation verdict. 'satisfied': criteria met, session goes idle.
            # 'needs_revision': criteria not met, another revision cycle follows.
            # 'max_iterations_reached': evaluation budget exhausted with criteria still unmet
            # — one final acknowledgment turn follows before the session goes idle, but no
            # further evaluation runs. 'failed': grader determined the rubric does not apply
            # to the deliverables. 'interrupted': user sent an interrupt while evaluation was
            # in progress.
            result:,
            # Aggregate token usage for this evaluation cycle. Sums across all grader model
            # requests within the cycle.
            usage:,
            type: :"span.outcome_evaluation_end"
          )
          end

          sig do
            override.returns(
              {
                id: String,
                explanation: String,
                iteration: Integer,
                outcome_evaluation_start_id: String,
                outcome_id: String,
                processed_at: Time,
                result: String,
                type: Symbol,
                usage:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelUsage
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
