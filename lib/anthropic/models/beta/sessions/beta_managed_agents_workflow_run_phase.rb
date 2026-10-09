# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsWorkflowRunPhase < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier for the phase.
          #
          #   @return [String]
          required :id, String

          # @!attribute description
          #   Description that the agent gave the phase, passed on as written, or `null` if it
          #   gave none.
          #
          #   @return [String, nil]
          required :description, String, nil?: true

          # @!attribute name
          #   Name that the agent gave the phase, passed on as written.
          #
          #   @return [String]
          required :name, String

          # @!method initialize(id:, description:, name:)
          #   A phase that a workflow run's plan declares.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsWorkflowRunPhase} for more
          #   details.
          #
          #   @param id [String] Unique identifier for the phase.
          #
          #   @param description [String, nil] Description that the agent gave the phase, passed on as written, or `null` if it
          #
          #   @param name [String] Name that the agent gave the phase, passed on as written.
        end
      end
    end
  end
end
