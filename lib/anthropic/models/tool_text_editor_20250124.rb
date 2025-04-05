# frozen_string_literal: true

module Anthropic
  module Models
    class ToolTextEditor20250124 < Anthropic::Internal::Type::BaseModel
      # @!attribute name
      #   Name of the tool.
      #
      #   This is how the tool will be called by the model and in tool_use blocks.
      #
      #   @return [Symbol, :str_replace_editor]
      required :name, const: :str_replace_editor

      # @!attribute type
      #
      #   @return [Symbol, :text_editor_20250124]
      required :type, const: :text_editor_20250124

      # @!attribute cache_control
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::Models::CacheControlEphemeral }, nil?: true

      # @!parse
      #   # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil]
      #   # @param name [Symbol, :str_replace_editor]
      #   # @param type [Symbol, :text_editor_20250124]
      #   #
      #   def initialize(cache_control: nil, name: :str_replace_editor, type: :text_editor_20250124, **) = super

      # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
    end
  end
end
