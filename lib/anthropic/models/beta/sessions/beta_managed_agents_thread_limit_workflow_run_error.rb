# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsThreadLimitWorkflowRunError < Anthropic::Internal::Type::BaseModel
          # @!attribute message
          #   Short explanation written by the server. It never contains content from the run
          #   or its agents.
          #
          #   @return [String]
          required :message, String

          # @!attribute type
          #
          #   @return [Symbol, :thread_limit_error]
          required :type, const: :thread_limit_error

          # @!method initialize(message:, type: :thread_limit_error)
          #   The run exceeded the limit on the number of threads that a run can create.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsThreadLimitWorkflowRunError}
          #   for more details.
          #
          #   @param message [String] Short explanation written by the server. It never contains content from the run
          #
          #   @param type [Symbol, :thread_limit_error]
        end
      end
    end
  end
end
