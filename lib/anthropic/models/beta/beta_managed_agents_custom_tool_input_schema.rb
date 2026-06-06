# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsCustomToolInputSchema < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :object]
        required :type, const: :object

        # @!attribute properties
        #
        #   @return [Hash{Symbol=>Object}, nil]
        optional :properties,
                 Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown],
                 nil?: true

        # @!attribute required
        #
        #   @return [Array<String>, nil]
        optional :required, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!method initialize(properties: nil, required: nil, type: :object)
        #   JSON Schema for custom tool input parameters.
        #
        #   @param properties [Hash{Symbol=>Object}, nil]
        #   @param required [Array<String>, nil]
        #   @param type [Symbol, :object]
      end
    end

    BetaManagedAgentsCustomToolInputSchema = Beta::BetaManagedAgentsCustomToolInputSchema
  end
end
