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
        #   @return [Symbol, :web_search]
        required :name, const: :web_search

        # @!attribute type
        #
        #   @return [Symbol, :server_tool_use]
        required :type, const: :server_tool_use

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(id:, input:, cache_control: nil, name: :web_search, type: :server_tool_use)
        #   @param id [String]
        #
        #   @param input [Object]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param name [Symbol, :web_search]
        #
        #   @param type [Symbol, :server_tool_use]
      end
    end

    BetaServerToolUseBlockParam = Beta::BetaServerToolUseBlockParam
  end
end
