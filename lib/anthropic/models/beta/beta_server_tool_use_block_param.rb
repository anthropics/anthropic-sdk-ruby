# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaServerToolUseBlockParam < Anthropic::Internal::Type::BaseModel
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
        #   @return [Symbol, Anthropic::Models::Beta::BetaServerToolUseBlockParam::Name]
        required :name, enum: -> { Anthropic::Beta::BetaServerToolUseBlockParam::Name }

        # @!attribute type
        #
        #   @return [Symbol, :server_tool_use]
        required :type, const: :server_tool_use

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(id:, input:, name:, cache_control: nil, type: :server_tool_use)
        #   @param id [String]
        #
        #   @param input [Object]
        #
        #   @param name [Symbol, Anthropic::Models::Beta::BetaServerToolUseBlockParam::Name]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param type [Symbol, :server_tool_use]

        # @see Anthropic::Models::Beta::BetaServerToolUseBlockParam#name
        module Name
          extend Anthropic::Internal::Type::Enum

          WEB_SEARCH = :web_search
          CODE_EXECUTION = :code_execution

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaServerToolUseBlockParam = Beta::BetaServerToolUseBlockParam
  end
end
