# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolTextEditor20241022 < Anthropic::Internal::Type::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        #   This is how the tool will be called by the model and in tool_use blocks.
        #
        #   @return [Symbol, :str_replace_editor]
        required :name, const: :str_replace_editor

        # @!attribute type
        #
        #   @return [Symbol, :text_editor_20241022]
        required :type, const: :text_editor_20241022

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!parse
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   # @param name [Symbol, :str_replace_editor]
        #   # @param type [Symbol, :text_editor_20241022]
        #   #
        #   def initialize(cache_control: nil, name: :str_replace_editor, type: :text_editor_20241022, **) = super

        # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
      end
    end

    BetaToolTextEditor20241022 = Beta::BetaToolTextEditor20241022
  end
end
