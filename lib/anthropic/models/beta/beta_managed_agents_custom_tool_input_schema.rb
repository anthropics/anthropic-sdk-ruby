# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsCustomToolInputSchema < Anthropic::Internal::Type::BaseModel
        # @!attribute properties
        #   JSON Schema properties defining the tool's input parameters.
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :properties,
                 Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown],
                 nil?: true

        # @!attribute required
        #   List of required property names.
        #
        #   @return [Array<String>, nil]
        optional :required, Anthropic::Internal::Type::ArrayOf[String]

        # @!attribute type
        #   Must be 'object' for tool input schemas.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsCustomToolInputSchema::Type, nil]
        optional :type, enum: -> { Anthropic::Beta::BetaManagedAgentsCustomToolInputSchema::Type }

        # @!method initialize(properties: nil, required: nil, type: nil)
        #   JSON Schema for custom tool input parameters.
        #
        #   @param properties [Hash{Symbol=>Object}, nil] JSON Schema properties defining the tool's input parameters.
        #
        #   @param required [Array<String>] List of required property names.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsCustomToolInputSchema::Type] Must be 'object' for tool input schemas.

        # Must be 'object' for tool input schemas.
        #
        # @see Anthropic::Models::Beta::BetaManagedAgentsCustomToolInputSchema#type
        module Type
          extend Anthropic::Internal::Type::Enum

          OBJECT = :object

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsCustomToolInputSchema = Beta::BetaManagedAgentsCustomToolInputSchema
  end
end
