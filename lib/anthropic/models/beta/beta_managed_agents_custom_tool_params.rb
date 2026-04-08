# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsCustomToolParams < Anthropic::Internal::Type::BaseModel
        # @!attribute description
        #   Description of what the tool does, shown to the agent to help it decide when to
        #   use the tool. 1-1024 characters.
        #
        #   @return [String]
        required :description, String

        # @!attribute input_schema
        #   JSON Schema for custom tool input parameters.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsCustomToolInputSchema]
        required :input_schema, -> { Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema }

        # @!attribute name
        #   Unique name for the tool. 1-128 characters; letters, digits, underscores, and
        #   hyphens.
        #
        #   @return [String]
        required :name, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsCustomToolParams::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsCustomToolParams::Type }

        # @!method initialize(description:, input_schema:, name:, type:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaManagedAgentsCustomToolParams} for more details.
        #
        #   A custom tool that is executed by the API client rather than the agent. When the
        #   agent calls this tool, an `agent.custom_tool_use` event is emitted and the
        #   session goes idle, waiting for the client to provide the result via a
        #   `user.custom_tool_result` event.
        #
        #   @param description [String] Description of what the tool does, shown to the agent to help it decide when to
        #
        #   @param input_schema [Anthropic::Models::Beta::BetaManagedAgentsCustomToolInputSchema] JSON Schema for custom tool input parameters.
        #
        #   @param name [String] Unique name for the tool. 1-128 characters; letters, digits, underscores, and hy
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsCustomToolParams::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsCustomToolParams#type
        module Type
          extend Anthropic::Internal::Type::Enum

          CUSTOM = :custom

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsCustomToolParams = Beta::BetaManagedAgentsCustomToolParams
  end
end
