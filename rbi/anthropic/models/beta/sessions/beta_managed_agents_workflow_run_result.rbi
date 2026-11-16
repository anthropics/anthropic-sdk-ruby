# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        # How a workflow run ended.
        module BetaManagedAgentsWorkflowRunResult
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResultCompleted,
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResultErrorObject,
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResultStopped
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResult::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            COMPLETED =
              T.let(
                :completed,
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResult::Type::TaggedSymbol
              )
            ERROR =
              T.let(
                :error,
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResult::Type::TaggedSymbol
              )
            STOPPED =
              T.let(
                :stopped,
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResult::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResult::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResult::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResult::Type::OrSymbol,
              error:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsTimeoutWorkflowRunErrorObject::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsProgramWorkflowRunErrorObject::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsUnknownWorkflowRunErrorObject::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsThreadLimitWorkflowRunErrorObject::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsMaxWorkflowRunsWorkflowRunErrorObject::OrHash
                )
            ).returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResult::Variants
            )
          end
          def self.new(
            type:,
            # Why the run did not finish.
            error: nil
          )
          end
        end
      end
    end
  end
end
