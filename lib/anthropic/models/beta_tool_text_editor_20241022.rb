# frozen_string_literal: true

module Anthropic
  module Models
    class BetaToolTextEditor20241022 < Anthropic::BaseModel
      # @!attribute [rw] name_
      #   Name of the tool.
      #
      # This is how the tool will be called by the model and in tool_use blocks.
      #   @return [Symbol, Anthropic::Models::BetaToolTextEditor20241022::Name]
      required :name_, api_name: :name, enum: -> { Anthropic::Models::BetaToolTextEditor20241022::Name }

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaToolTextEditor20241022::Type]
      required :type, enum: -> { Anthropic::Models::BetaToolTextEditor20241022::Type }

      # @!attribute [rw] cache_control
      #   @return [Anthropic::Models::BetaCacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::BetaCacheControlEphemeral }

      # Name of the tool.
      #
      # This is how the tool will be called by the model and in tool_use blocks.
      class Name < Anthropic::Enum
        STR_REPLACE_EDITOR = :str_replace_editor
      end

      class Type < Anthropic::Enum
        TEXT_EDITOR_20241022 = :text_editor_20241022
      end

      # @!parse
      #   # Create a new instance of BetaToolTextEditor20241022 from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :name Name of the tool.
      #   #
      #   #     This is how the tool will be called by the model and in tool_use blocks.
      #   #   @option data [String] :type
      #   #   @option data [Object, nil] :cache_control
      #   def initialize(data = {}) = super
    end
  end
end
