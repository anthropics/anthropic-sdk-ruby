# frozen_string_literal: true

module Anthropic
  module Models
    class ToolTextEditor20250124 < Anthropic::Internal::Type::BaseModel
      # @!attribute name
      #   Name of the tool.
      #
      #   This is how the tool will be called by the model and in `tool_use` blocks.
      #
      #   @return [Symbol, :str_replace_editor]
      required :name, const: :str_replace_editor

      # @!attribute type
      #
      #   @return [Symbol, :text_editor_20250124]
      required :type, const: :text_editor_20250124

      # @!attribute cache_control
      #   Create a cache control breakpoint at this content block.
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::CacheControlEphemeral }, nil?: true

      # @!method initialize(cache_control: nil, name: :str_replace_editor, type: :text_editor_20250124)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ToolTextEditor20250124} for more details.
      #
      #   @param cache_control [Anthropic::Models::CacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
      #
      #   @param name [Symbol, :str_replace_editor] Name of the tool.
      #
      #   @param type [Symbol, :text_editor_20250124]
    end
  end
end
