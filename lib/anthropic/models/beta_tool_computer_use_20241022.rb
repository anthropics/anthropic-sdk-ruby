# frozen_string_literal: true

module Anthropic
  module Models
    class BetaToolComputerUse20241022 < Anthropic::BaseModel
      # @!attribute [rw] display_height_px
      #   The height of the display in pixels.
      #   @return [Integer]
      required :display_height_px, Integer

      # @!attribute [rw] display_width_px
      #   The width of the display in pixels.
      #   @return [Integer]
      required :display_width_px, Integer

      # @!attribute [rw] name_
      #   Name of the tool.
      #
      # This is how the tool will be called by the model and in tool_use blocks.
      #   @return [Symbol, Anthropic::Models::BetaToolComputerUse20241022::Name]
      required :name_, api_name: :name, enum: -> { Anthropic::Models::BetaToolComputerUse20241022::Name }

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaToolComputerUse20241022::Type]
      required :type, enum: -> { Anthropic::Models::BetaToolComputerUse20241022::Type }

      # @!attribute [rw] cache_control
      #   @return [Anthropic::Models::BetaCacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::BetaCacheControlEphemeral }

      # @!attribute [rw] display_number
      #   The X11 display number (e.g. 0, 1) for the display.
      #   @return [Integer]
      optional :display_number, Integer

      # Name of the tool.
      #
      # This is how the tool will be called by the model and in tool_use blocks.
      class Name < Anthropic::Enum
        COMPUTER = :computer
      end

      class Type < Anthropic::Enum
        COMPUTER_20241022 = :computer_20241022
      end

      # @!parse
      #   # Create a new instance of BetaToolComputerUse20241022 from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Integer] :display_height_px The height of the display in pixels.
      #   #   @option data [Integer] :display_width_px The width of the display in pixels.
      #   #   @option data [String] :name Name of the tool.
      #   #
      #   #     This is how the tool will be called by the model and in tool_use blocks.
      #   #   @option data [String] :type
      #   #   @option data [Object, nil] :cache_control
      #   #   @option data [Integer, nil] :display_number The X11 display number (e.g. 0, 1) for the display.
      #   def initialize(data = {}) = super
    end
  end
end
