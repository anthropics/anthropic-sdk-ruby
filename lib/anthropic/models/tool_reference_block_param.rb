# frozen_string_literal: true

module Anthropic
  module Models
    class ToolReferenceBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute tool_name
      #
      #   @return [String]
      required :tool_name, String

      # @!attribute type
      #
      #   @return [Symbol, :tool_reference]
      required :type, const: :tool_reference

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!method initialize(tool_name:, cache_control: nil, type: :tool_reference)
      #   Tool reference block that can be included in tool_result content.
      #
      #   @param tool_name [String]
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param type [Symbol, :tool_reference]
    end
  end
end
