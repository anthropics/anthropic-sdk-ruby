# frozen_string_literal: true

module Anthropic
  module Models
    class ServerToolUseBlock < Anthropic::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute input
      #
      #   @return [Object]
      required :input, Anthropic::Internal::Type::Unknown

      # @!attribute name
      #
      #   @return [Symbol, :web_search]
      required :name, const: :web_search

      # @!attribute type
      #
      #   @return [Symbol, :server_tool_use]
      required :type, const: :server_tool_use

      # @!method initialize(id:, input:, name: :web_search, type: :server_tool_use)
      #   @param id [String]
      #   @param input [Object]
      #   @param name [Symbol, :web_search]
      #   @param type [Symbol, :server_tool_use]
    end
  end
end
