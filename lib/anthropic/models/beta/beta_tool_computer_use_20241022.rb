# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolComputerUse20241022 < Anthropic::BaseModel
        # @!attribute display_height_px
        #   The height of the display in pixels.
        #
        #   @return [Integer]
        required :display_height_px, Integer

        # @!attribute display_width_px
        #   The width of the display in pixels.
        #
        #   @return [Integer]
        required :display_width_px, Integer

        # @!attribute name
        #   Name of the tool.
        #
        # This is how the tool will be called by the model and in tool_use blocks.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolComputerUse20241022::Name]
        required :name, enum: -> { Anthropic::Models::Beta::BetaToolComputerUse20241022::Name }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaToolComputerUse20241022::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaToolComputerUse20241022::Type }

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

        # @!attribute display_number
        #   The X11 display number (e.g. 0, 1) for the display.
        #
        #   @return [Integer, nil]
        optional :display_number, Integer

        # @!parse
        #   # @param display_height_px [Integer] The height of the display in pixels.
        #   #
        #   # @param display_width_px [Integer] The width of the display in pixels.
        #   #
        #   # @param name [String] Name of the tool.
        #   #
        #   #   This is how the tool will be called by the model and in tool_use blocks.
        #   #
        #   # @param type [String]
        #   #
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   #
        #   # @param display_number [Integer, nil] The X11 display number (e.g. 0, 1) for the display.
        #   #
        #   def initialize(display_height_px:, display_width_px:, name:, type:, cache_control: nil, display_number: nil, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # Name of the tool.
        #
        # This is how the tool will be called by the model and in tool_use blocks.
        #
        # @example
        #
        # ```ruby
        # case enum
        # in :computer
        #   # ...
        # end
        # ```
        class Name < Anthropic::Enum
          COMPUTER = :computer

          finalize!
        end

        # @example
        #
        # ```ruby
        # case enum
        # in :computer_20241022
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          COMPUTER_20241022 = :computer_20241022

          finalize!
        end
      end
    end

    BetaToolComputerUse20241022 = Beta::BetaToolComputerUse20241022
  end
end
