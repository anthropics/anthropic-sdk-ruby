# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_tool_text_editor20241022 => {
      #   name: enum: Anthropic::Models::Beta::BetaToolTextEditor20241022::Name,
      #   type: enum: Anthropic::Models::Beta::BetaToolTextEditor20241022::Type,
      #   cache_control: Anthropic::Models::Beta::BetaCacheControlEphemeral
      # }
      # ```
      class BetaToolTextEditor20241022 < Anthropic::BaseModel
        # @!attribute name
        #   Name of the tool.
        #
        # This is how the tool will be called by the model and in tool_use blocks.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolTextEditor20241022::Name]
        required :name, enum: -> { Anthropic::Models::Beta::BetaToolTextEditor20241022::Name }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolTextEditor20241022::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaToolTextEditor20241022::Type }

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!parse
        #   # @param name [String] Name of the tool.
        #   #
        #   #   This is how the tool will be called by the model and in tool_use blocks.
        #   #
        #   # @param type [String]
        #   #
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   #
        #   def initialize(name:, type:, cache_control: nil, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # Name of the tool.
        #
        # This is how the tool will be called by the model and in tool_use blocks.
        #
        # @example
        # ```ruby
        # case name
        # in :str_replace_editor
        #   # ...
        # end
        # ```
        class Name < Anthropic::Enum
          STR_REPLACE_EDITOR = :str_replace_editor

          finalize!
        end

        # @example
        # ```ruby
        # case type
        # in :text_editor_20241022
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          TEXT_EDITOR_20241022 = :text_editor_20241022

          finalize!
        end
      end
    end

    BetaToolTextEditor20241022 = Beta::BetaToolTextEditor20241022
  end
end
