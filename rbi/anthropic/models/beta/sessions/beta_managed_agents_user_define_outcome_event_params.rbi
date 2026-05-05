# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUserDefineOutcomeEventParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams,
                Anthropic::Internal::AnyHash
              )
            end

          # What the agent should produce. This is the task specification.
          sig { returns(String) }
          attr_accessor :description

          # Rubric for grading the quality of an outcome.
          sig do
            returns(
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsFileRubricParams,
                Anthropic::Beta::Sessions::BetaManagedAgentsTextRubricParams
              )
            )
          end
          attr_accessor :rubric

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Eval→revision cycles before giving up. Default 3, max 20.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :max_iterations

          # Parameters for defining an outcome the agent should work toward. The agent
          # begins work on receipt.
          sig do
            params(
              description: String,
              rubric:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileRubricParams::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsTextRubricParams::OrHash
                ),
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams::Type::OrSymbol,
              max_iterations: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(
            # What the agent should produce. This is the task specification.
            description:,
            # Rubric for grading the quality of an outcome.
            rubric:,
            type:,
            # Eval→revision cycles before giving up. Default 3, max 20.
            max_iterations: nil
          )
          end

          sig do
            override.returns(
              {
                description: String,
                rubric:
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsFileRubricParams,
                    Anthropic::Beta::Sessions::BetaManagedAgentsTextRubricParams
                  ),
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams::Type::OrSymbol,
                max_iterations: T.nilable(Integer)
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileRubricParams,
                  Anthropic::Beta::Sessions::BetaManagedAgentsTextRubricParams
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams::Rubric::Variants
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
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_DEFINE_OUTCOME =
              T.let(
                :"user.define_outcome",
                Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams::Type::TaggedSymbol
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
