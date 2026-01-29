# frozen_string_literal: true

module Anthropic
  module Models
    class JSONOutputFormat < Anthropic::Internal::Type::BaseModel
      # @!attribute schema
      #   The JSON schema of the format
      #
      #   @return [Hash{Symbol=>Object}]
      required :schema, Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown]

      # @!attribute type
      #
      #   @return [Symbol, :json_schema]
      required :type, const: :json_schema

      # @!method initialize(schema:, type: :json_schema)
      #   @param schema [Hash{Symbol=>Object}] The JSON schema of the format
      #
      #   @param type [Symbol, :json_schema]
    end
  end
end
