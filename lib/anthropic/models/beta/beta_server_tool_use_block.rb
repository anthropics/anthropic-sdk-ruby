# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaServerToolUseBlock < Anthropic::Internal::Type::BaseModel
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
        #   @return [Symbol, Anthropic::Models::Beta::BetaServerToolUseBlock::Name]
        required :name, enum: -> { Anthropic::Beta::BetaServerToolUseBlock::Name }

        # @!attribute type
        #
        #   @return [Symbol, :server_tool_use]
        required :type, const: :server_tool_use

        # @!method initialize(id:, input:, name:, type: :server_tool_use)
        #   @param id [String]
        #   @param input [Object]
        #   @param name [Symbol, Anthropic::Models::Beta::BetaServerToolUseBlock::Name]
        #   @param type [Symbol, :server_tool_use]

        # @see Anthropic::Models::Beta::BetaServerToolUseBlock#name
        module Name
          extend Anthropic::Internal::Type::Enum

          WEB_SEARCH = :web_search
          CODE_EXECUTION = :code_execution

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaServerToolUseBlock = Beta::BetaServerToolUseBlock
  end
end
