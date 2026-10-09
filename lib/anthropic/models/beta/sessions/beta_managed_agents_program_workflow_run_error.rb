# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsProgramWorkflowRunError < Anthropic::Internal::Type::BaseModel
          # @!attribute message
          #   Short explanation written by the server. It never contains content from the run
          #   or its agents.
          #
          #   @return [String]
          required :message, String

          # @!attribute type
          #
          #   @return [Symbol, :program_error]
          required :type, const: :program_error

          # @!method initialize(message:, type: :program_error)
          #   The plan, a program that the agent wrote, failed, or the server refused it.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsProgramWorkflowRunError}
          #   for more details.
          #
          #   @param message [String] Short explanation written by the server. It never contains content from the run
          #
          #   @param type [Symbol, :program_error]
        end
      end
    end
  end
end
