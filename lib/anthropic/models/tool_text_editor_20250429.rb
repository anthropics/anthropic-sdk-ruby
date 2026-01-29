# frozen_string_literal: true

module Anthropic
  module Models
    class ToolTextEditor20250429 < Anthropic::Internal::Type::BaseModel
      # @!attribute name
      #   Name of the tool.
      #
      #   This is how the tool will be called by the model and in `tool_use` blocks.
      #
      #   @return [Symbol, :str_replace_based_edit_tool]
      required :name, const: :str_replace_based_edit_tool

      # @!attribute type
      #
      #   @return [Symbol, :text_editor_20250429]
      required :type, const: :text_editor_20250429

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!attribute strict
      #   When true, guarantees schema validation on tool names and inputs
      #
      #   @return [Boolean, nil]
      optional :strict, Anthropic::Internal::Type::Boolean

      # @!method initialize(cache_control: nil, strict: nil, name: :str_replace_based_edit_tool, type: :text_editor_20250429)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ToolTextEditor20250429} for more details.
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param strict [Boolean] When true, guarantees schema validation on tool names and inputs
      #
      #   @param name [Symbol, :str_replace_based_edit_tool] Name of the tool.
      #
      #   @param type [Symbol, :text_editor_20250429]
    end
  end
end
