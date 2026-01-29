# frozen_string_literal: true

module Anthropic
  module Models
    class ToolTextEditor20250728 < Anthropic::Internal::Type::BaseModel
      # @!attribute name
      #   Name of the tool.
      #
      #   This is how the tool will be called by the model and in `tool_use` blocks.
      #
      #   @return [Symbol, :str_replace_based_edit_tool]
      required :name, const: :str_replace_based_edit_tool

      # @!attribute type
      #
      #   @return [Symbol, :text_editor_20250728]
      required :type, const: :text_editor_20250728

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!attribute max_characters
      #   Maximum number of characters to display when viewing a file. If not specified,
      #   defaults to displaying the full file.
      #
      #   @return [Integer, nil]
      optional :max_characters, Integer, nil?: true

      # @!attribute strict
      #   When true, guarantees schema validation on tool names and inputs
      #
      #   @return [Boolean, nil]
      optional :strict, Anthropic::Internal::Type::Boolean

      # @!method initialize(cache_control: nil, max_characters: nil, strict: nil, name: :str_replace_based_edit_tool, type: :text_editor_20250728)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ToolTextEditor20250728} for more details.
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param max_characters [Integer, nil] Maximum number of characters to display when viewing a file. If not specified, d
      #
      #   @param strict [Boolean] When true, guarantees schema validation on tool names and inputs
      #
      #   @param name [Symbol, :str_replace_based_edit_tool] Name of the tool.
      #
      #   @param type [Symbol, :text_editor_20250728]
    end
  end
end
