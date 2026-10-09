# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsTimeoutWorkflowRunError < Anthropic::Internal::Type::BaseModel
          # @!attribute message
          #   Short explanation written by the server. It never contains content from the run
          #   or its agents.
          #
          #   @return [String]
          required :message, String

          # @!attribute type
          #
          #   @return [Symbol, :timeout_error]
          required :type, const: :timeout_error

          # @!method initialize(message:, type: :timeout_error)
          #   The run reached its time limit.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsTimeoutWorkflowRunError}
          #   for more details.
          #
          #   @param message [String] Short explanation written by the server. It never contains content from the run
          #
          #   @param type [Symbol, :timeout_error]
        end
      end
    end
  end
end
