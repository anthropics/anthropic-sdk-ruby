# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        # How a workflow run ended.
        module BetaManagedAgentsWorkflowRunResult
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # The run's plan, a program that the agent wrote, finished. This does not say whether the work succeeded.
          variant :completed, -> { Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResultCompleted }

          # The run failed or reached its time limit.
          variant :error, -> { Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResultError }

          # The agent stopped the run.
          variant :stopped, -> { Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResultStopped }

          module Type
            extend Anthropic::Internal::Type::Enum

            COMPLETED = :completed
            ERROR = :error
            STOPPED = :stopped

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunResultCompleted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunResultError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunResultStopped)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunResult::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Anthropic::Models::Beta::Sessions::BetaManagedAgentsTimeoutWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsProgramWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsThreadLimitWorkflowRunError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsMaxWorkflowRunsWorkflowRunError] :error Why the run did not finish.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunResultCompleted, Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunResultError, Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunResultStopped]
          def self.new(type:, **args)
            case type.to_sym
            when :completed
              Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResultCompleted.new(**args)
            when :error
              Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResultError.new(**args)
            when :stopped
              Anthropic::Beta::Sessions::BetaManagedAgentsWorkflowRunResultStopped.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
