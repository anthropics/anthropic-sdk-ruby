# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeploymentUserDefineOutcomeEvent =
      Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent

    module Beta
      class BetaManagedAgentsDeploymentUserDefineOutcomeEvent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent,
              Anthropic::Internal::AnyHash
            )
          end

        # What the agent should produce. This is the task specification.
        sig { returns(String) }
        attr_accessor :description

        # Rubric for grading the quality of an outcome.
        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent::Rubric::Variants
          )
        end
        attr_accessor :rubric

        sig do
          returns(
            Anthropic::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent::Type::TaggedSymbol
          )
        end
        attr_accessor :type

        # Eval→revision cycles before giving up. Default 3, max 20.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :max_iterations

        # An outcome the agent should work toward. The agent begins work on receipt.
        sig do
          params(
            description: String,
            rubric:
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsFileRubric::OrHash,
                Anthropic::Beta::Sessions::BetaManagedAgentsTextRubric::OrHash
              ),
            type:
              Anthropic::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent::Type::OrSymbol,
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
                Anthropic::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent::Rubric::Variants,
              type:
                Anthropic::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent::Type::TaggedSymbol,
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
                Anthropic::Beta::Sessions::BetaManagedAgentsFileRubric,
                Anthropic::Beta::Sessions::BetaManagedAgentsTextRubric
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent::Rubric::Variants
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
                Anthropic::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          USER_DEFINE_OUTCOME =
            T.let(
              :"user.define_outcome",
              Anthropic::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent::Type::TaggedSymbol
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
