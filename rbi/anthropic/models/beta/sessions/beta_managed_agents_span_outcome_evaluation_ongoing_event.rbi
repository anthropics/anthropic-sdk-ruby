# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # 0-indexed revision cycle, matching the corresponding
          # `span.outcome_evaluation_start`.
          sig { returns(Integer) }
          attr_accessor :iteration

          # The `outc_` ID of the outcome being evaluated.
          sig { returns(String) }
          attr_accessor :outcome_id

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :processed_at

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Periodic heartbeat emitted while an outcome evaluation cycle is in progress.
          # Distinguishes 'evaluation is actively running' from 'evaluation is stuck'
          # between the corresponding `span.outcome_evaluation_start` and
          # `span.outcome_evaluation_end` events.
          sig do
            params(
              id: String,
              iteration: Integer,
              outcome_id: String,
              processed_at: Time,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # 0-indexed revision cycle, matching the corresponding
            # `span.outcome_evaluation_start`.
            iteration:,
            # The `outc_` ID of the outcome being evaluated.
            outcome_id:,
            # A timestamp in RFC 3339 format
            processed_at:,
            type:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                iteration: Integer,
                outcome_id: String,
                processed_at: Time,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent::Type::TaggedSymbol
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            SPAN_OUTCOME_EVALUATION_ONGOING =
              T.let(
                :"span.outcome_evaluation_ongoing",
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationOngoingEvent::Type::TaggedSymbol
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
