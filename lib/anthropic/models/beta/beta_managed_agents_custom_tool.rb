# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsCustomTool < Anthropic::Internal::Type::BaseModel
        # @!attribute description
        #
        #   @return [String]
        required :description, String

        # @!attribute input_schema
        #   JSON Schema for custom tool input parameters.
        #
        #   @return [Anthropic::Models::Beta::BetaManagedAgentsCustomToolInputSchema]
        required :input_schema, -> { Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema }

        # @!attribute name
        #
        #   @return [String]
        required :name, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsCustomTool::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsCustomTool::Type }

        # @!method initialize(description:, input_schema:, name:, type:)
        #   A custom tool as returned in API responses.
        #
        #   @param description [String]
        #
        #   @param input_schema [Anthropic::Models::Beta::BetaManagedAgentsCustomToolInputSchema] JSON Schema for custom tool input parameters.
        #
        #   @param name [String]
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsCustomTool::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsCustomTool#type
        module Type
          extend Anthropic::Internal::Type::Enum

          CUSTOM = :custom

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsCustomTool = Beta::BetaManagedAgentsCustomTool
  end
end
