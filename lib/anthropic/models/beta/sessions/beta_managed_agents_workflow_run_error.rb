# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # Why a workflow run did not finish, or was not created. More types may be added.
        # On `workflow_run.status_ended`, for a `type` you do not recognize, rely on the
        # event's `result.type`.
        module BetaManagedAgentsWorkflowRunError
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # The run reached its time limit.
          variant :timeout_error, -> { Anthropic::Beta::Sessions::BetaManagedAgentsTimeoutWorkflowRunError }

          # The plan, a program that the agent wrote, failed, or the server refused it.
          variant :program_error, -> { Anthropic::Beta::Sessions::BetaManagedAgentsProgramWorkflowRunError }

          # A failure that has no type of its own.
          variant :unknown_error, -> { Anthropic::Beta::Sessions::BetaManagedAgentsUnknownWorkflowRunError }

          # The run exceeded the limit on the number of threads that a run can create.
          variant :thread_limit_error,
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsThreadLimitWorkflowRunError }

          # No run was created, because the session was at its limit of open workflow runs, which are runs that have not ended. Only `workflow_run.error` carries this type.
          variant :max_workflow_runs_error,
                  -> { Anthropic::Beta::Sessions::BetaManagedAgentsMaxWorkflowRunsWorkflowRunError }

          module Type
            extend Anthropic::Internal::Type::Enum

            TIMEOUT_ERROR = :timeout_error
            PROGRAM_ERROR = :program_error
            UNKNOWN_ERROR = :unknown_error
            THREAD_LIMIT_ERROR = :thread_limit_error
            MAX_WORKFLOW_RUNS_ERROR = :max_workflow_runs_error

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsTimeoutWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsProgramWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsThreadLimitWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMaxWorkflowRunsWorkflowRunError)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunError} for more
          # details.
          #
          # @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunError::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :message Short explanation written by the server. It never contains content from the run
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsTimeoutWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsProgramWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsThreadLimitWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMaxWorkflowRunsWorkflowRunError]
          def self.new(type:, **args)
            case type.to_sym
            when :timeout_error
              Anthropic::Beta::Sessions::BetaManagedAgentsTimeoutWorkflowRunError.new(**args)
            when :program_error
              Anthropic::Beta::Sessions::BetaManagedAgentsProgramWorkflowRunError.new(**args)
            when :unknown_error
              Anthropic::Beta::Sessions::BetaManagedAgentsUnknownWorkflowRunError.new(**args)
            when :thread_limit_error
              Anthropic::Beta::Sessions::BetaManagedAgentsThreadLimitWorkflowRunError.new(**args)
            when :max_workflow_runs_error
              Anthropic::Beta::Sessions::BetaManagedAgentsMaxWorkflowRunsWorkflowRunError.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
