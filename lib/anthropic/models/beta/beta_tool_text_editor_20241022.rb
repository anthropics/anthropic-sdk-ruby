# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolTextEditor20241022 < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        #   This is how the tool will be called by the model and in `tool_use` blocks.
        #
        #   @return [Symbol, :str_replace_editor]
        required :name, const: :str_replace_editor

        # @!attribute type
        #
        #   @return [Symbol, :text_editor_20241022]
        required :type, const: :text_editor_20241022

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!method initialize(cache_control: nil, name: :str_replace_editor, type: :text_editor_20241022)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaToolTextEditor20241022} for more details.
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param name [Symbol, :str_replace_editor] Name of the tool.
        #
        #   @param type [Symbol, :text_editor_20241022]
      end
    end

    BetaToolTextEditor20241022 = Beta::BetaToolTextEditor20241022
  end
end
