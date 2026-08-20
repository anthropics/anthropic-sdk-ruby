# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsDeploymentInitialEvent =
      Beta::BetaManagedAgentsDeploymentInitialEvent

    module Beta
      # An event sent to a session immediately after it is created. Supports
      # `user.message`, `user.define_outcome`, and `system.message`.
      module BetaManagedAgentsDeploymentInitialEvent
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsDeploymentUserMessageEvent,
              Anthropic::Beta::BetaManagedAgentsDeploymentUserDefineOutcomeEvent,
              Anthropic::Beta::BetaManagedAgentsDeploymentSystemMessageEvent
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaManagedAgentsDeploymentInitialEvent::Type
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          USER_MESSAGE =
            T.let(
              :"user.message",
              Anthropic::Beta::BetaManagedAgentsDeploymentInitialEvent::Type::TaggedSymbol
            )
          USER_DEFINE_OUTCOME =
            T.let(
              :"user.define_outcome",
              Anthropic::Beta::BetaManagedAgentsDeploymentInitialEvent::Type::TaggedSymbol
            )
          SYSTEM_MESSAGE =
            T.let(
              :"system.message",
              Anthropic::Beta::BetaManagedAgentsDeploymentInitialEvent::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaManagedAgentsDeploymentInitialEvent::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaManagedAgentsDeploymentInitialEvent::Variants
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
                Anthropic::Beta::Sessions::BetaManagedAgentsFileRubric::OrHash,
                Anthropic::Beta::Sessions::BetaManagedAgentsTextRubric::OrHash
              ),
            max_iterations: T.nilable(Integer)
          ).returns(
            Anthropic::Beta::BetaManagedAgentsDeploymentInitialEvent::Variants
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
