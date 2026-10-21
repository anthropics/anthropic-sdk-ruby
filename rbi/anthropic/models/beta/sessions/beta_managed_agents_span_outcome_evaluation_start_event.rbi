# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSpanOutcomeEvaluationStartEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSpanOutcomeEvaluationStartEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # 0-indexed revision cycle. 0 is the first evaluation; 1 is the re-evaluation
          # after the first revision; etc.
          sig { returns(Integer) }
          attr_accessor :iteration

          # The `outc_` ID of the outcome being evaluated.
          sig { returns(String) }
          attr_accessor :outcome_id

          # Timestamp when outcome evaluation started.
          sig { returns(Time) }
          attr_accessor :processed_at

          sig { returns(Symbol) }
          attr_accessor :type

          # Emitted when an outcome evaluation cycle begins.
          sig do
            params(
              id: String,
              iteration: Integer,
              outcome_id: String,
              processed_at: Time,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # 0-indexed revision cycle. 0 is the first evaluation; 1 is the re-evaluation
            # after the first revision; etc.
            iteration:,
            # The `outc_` ID of the outcome being evaluated.
            outcome_id:,
            # Timestamp when outcome evaluation started.
            processed_at:,
            type: :"span.outcome_evaluation_start"
          )
          end

          sig do
            override.returns(
              {
                id: String,
                iteration: Integer,
                outcome_id: String,
                processed_at: Time,
                type: Symbol
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
