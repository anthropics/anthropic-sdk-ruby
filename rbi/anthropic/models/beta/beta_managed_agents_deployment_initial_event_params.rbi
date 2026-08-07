# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeploymentInitialEventParams =
      Beta::BetaManagedAgentsDeploymentInitialEventParams

    module Beta
      # An event sent to a session immediately after it is created. Supports
      # `user.message`, `user.define_outcome`, and `system.message`.
      module BetaManagedAgentsDeploymentInitialEventParams
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::Sessions::BetaManagedAgentsUserMessageEventParams,
              Anthropic::Beta::Sessions::BetaManagedAgentsUserDefineOutcomeEventParams,
              Anthropic::Beta::Sessions::BetaManagedAgentsSystemMessageEventParams
            )
          end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsDeploymentInitialEventParams::Variants
            ]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: T.any(Symbol, String),
            content:
              T.any(
                T::Array[
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsImageBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::OrHash,
                    Anthropic::Beta::Sessions::BetaManagedAgentsRedactedBlock::OrHash
                  )
                ],
                T::Array[
                  Anthropic::Beta::BetaManagedAgentsSystemContentBlock::OrHash
                ]
              ),
            description: String,
            rubric:
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsFileRubricParams::OrHash,
                Anthropic::Beta::Sessions::BetaManagedAgentsTextRubricParams::OrHash
              ),
            max_iterations: T.nilable(Integer)
          ).returns(
            Anthropic::Beta::BetaManagedAgentsDeploymentInitialEventParams::Variants
          )
        end
        def self.new(
          type:,
          # Array of content blocks for the user message.
          content: nil,
          # What the agent should produce. This is the task specification.
          description: nil,
          # Rubric for grading the quality of an outcome.
          rubric: nil,
          # Eval→revision cycles before giving up. Default 3, max 20.
          max_iterations: nil
        )
        end
      end
    end
  end
end
