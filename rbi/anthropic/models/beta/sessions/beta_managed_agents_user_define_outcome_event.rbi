# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserDefineOutcomeEvent < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent,
                Anthropic::Internal::AnyHash
              )
            end

          # Unique identifier for this event.
          sig { returns(String) }
          attr_accessor :id

          # What the agent should produce. Copied from the input event.
          sig { returns(String) }
          attr_accessor :description

          # Evaluate-then-revise cycles before giving up. Default 3, max 20.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :max_iterations

          # Server-generated `outc_` ID for this outcome. Referenced by
          # `span.outcome_evaluation_*` events and the session's `outcome_evaluations` list.
          sig { returns(String) }
          attr_accessor :outcome_id

          # A timestamp in RFC 3339 format
          sig { returns(Time) }
          attr_accessor :processed_at

          # Rubric for grading the quality of an outcome.
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent::Rubric::Variants
            )
          end
          attr_accessor :rubric

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # Echo of a `user.define_outcome` input event. Carries the server-generated
          # `outcome_id` that subsequent `span.outcome_evaluation_*` events reference.
          sig do
            params(
              id: String,
              description: String,
              max_iterations: T.nilable(Integer),
              outcome_id: String,
              processed_at: Time,
              rubric:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileRubric::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsTextRubric::OrHash
                ),
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Unique identifier for this event.
            id:,
            # What the agent should produce. Copied from the input event.
            description:,
            # Evaluate-then-revise cycles before giving up. Default 3, max 20.
            max_iterations:,
            # Server-generated `outc_` ID for this outcome. Referenced by
            # `span.outcome_evaluation_*` events and the session's `outcome_evaluations` list.
            outcome_id:,
            # A timestamp in RFC 3339 format
            processed_at:,
            # Rubric for grading the quality of an outcome.
            rubric:,
            type:
          )
          end

          sig do
            override.returns(
              {
                id: String,
                description: String,
                max_iterations: T.nilable(Integer),
                outcome_id: String,
                processed_at: Time,
                rubric:
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent::Rubric::Variants,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent::Type::TaggedSymbol
              }
            )
          end
          def to_hash
          end

          # Rubric for grading the quality of an outcome.
          module Rubric
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileRubric,
                  Anthropic::Beta::Sessions::BetaManagedAgentsTextRubric
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent::Rubric::Variants
                ]
              )
            end
            def self.variants
            end
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_DEFINE_OUTCOME =
              T.let(
                :"user.define_outcome",
                Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEvent::Type::TaggedSymbol
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
