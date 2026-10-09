# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        # Why a workflow run did not finish, or was not created. More types may be added.
        # On `workflow_run.status_ended`, for a `type` you do not recognize, rely on the
        # event's `result.type`.
        module BetaManagedAgentsWorkflowRunError
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsTimeoutWorkflowRunError,
                Anthropic::Beta::Sessions::BetaManagedAgentsProgramWorkflowRunError,
                Anthropic::Beta::Sessions::BetaManagedAgentsUnknownWorkflowRunError,
                Anthropic::Beta::Sessions::BetaManagedAgentsThreadLimitWorkflowRunError,
                Anthropic::Beta::Sessions::BetaManagedAgentsMaxWorkflowRunsWorkflowRunError
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunError::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TIMEOUT_ERROR =
              T.let(
                :timeout_error,
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunError::Type::TaggedSymbol
              )
            PROGRAM_ERROR =
              T.let(
                :program_error,
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunError::Type::TaggedSymbol
              )
            UNKNOWN_ERROR =
              T.let(
                :unknown_error,
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunError::Type::TaggedSymbol
              )
            THREAD_LIMIT_ERROR =
              T.let(
                :thread_limit_error,
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunError::Type::TaggedSymbol
              )
            MAX_WORKFLOW_RUNS_ERROR =
              T.let(
                :max_workflow_runs_error,
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunError::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunError::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunError::Variants
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
                Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunError::Type::OrSymbol,
              message: String
            ).returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunError::Variants
            )
          end
          def self.new(
            type:,
            # Short explanation written by the server. It never contains content from the run
            # or its agents.
            message:
          )
          end
        end
      end
    end
  end
end
