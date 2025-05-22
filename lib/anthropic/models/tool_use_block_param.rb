# frozen_string_literal: true

module Anthropic
  module Models
    class ToolUseBlockParam < Anthropic::Internal::Type::BaseModel
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
      #   @return [String]
      required :name, String

      # @!attribute type
      #
      #   @return [Symbol, :tool_use]
      required :type, const: :tool_use

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!method initialize(id:, input:, name:, cache_control: nil, type: :tool_use)
      #   @param id [String]
      #
      #   @param input [Object]
      #
      #   @param name [String]
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param type [Symbol, :tool_use]
    end
  end
end
