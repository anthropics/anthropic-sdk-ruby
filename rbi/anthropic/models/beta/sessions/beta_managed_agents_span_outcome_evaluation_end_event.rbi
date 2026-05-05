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

          # A timestamp in RFC 3339 format
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

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Token usage for a single model request.
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
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent::Type::OrSymbol,
              usage:
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelUsage::OrHash
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
            # A timestamp in RFC 3339 format
            processed_at:,
            # Evaluation verdict. 'satisfied': criteria met, session goes idle.
            # 'needs_revision': criteria not met, another revision cycle follows.
            # 'max_iterations_reached': evaluation budget exhausted with criteria still unmet
            # — one final acknowledgment turn follows before the session goes idle, but no
            # further evaluation runs. 'failed': grader determined the rubric does not apply
            # to the deliverables. 'interrupted': user sent an interrupt while evaluation was
            # in progress.
            result:,
            type:,
            # Token usage for a single model request.
            usage:
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
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent::Type::TaggedSymbol,
                usage:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSpanModelUsage
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SPAN_OUTCOME_EVALUATION_END =
              T.let(
                :"span.outcome_evaluation_end",
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationEndEvent::Type::TaggedSymbol
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
end
