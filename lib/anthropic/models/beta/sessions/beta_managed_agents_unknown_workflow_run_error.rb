# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsUnknownWorkflowRunError < Anthropic::Internal::Type::BaseModel
          # @!attribute message
          #   Short explanation written by the server. It never contains content from the run
          #   or its agents.
          #
          #   @return [String]
          required :message, String

          # @!attribute type
          #
          #   @return [Symbol, :unknown_error]
          required :type, const: :unknown_error

          # @!method initialize(message:, type: :unknown_error)
          #   A failure that has no type of its own.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsUnknownWorkflowRunError}
          #   for more details.
          #
          #   @param message [String] Short explanation written by the server. It never contains content from the run
          #
          #   @param type [Symbol, :unknown_error]
        end
      end
    end
  end
end
