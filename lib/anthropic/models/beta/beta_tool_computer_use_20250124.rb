# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolComputerUse20250124 < Anthropic::Internal::Type::BaseModel
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
        #   This is how the tool will be called by the model and in `tool_use` blocks.
        #
        #   @return [Symbol, :computer]
        required :name, const: :computer

        # @!attribute type
        #
        #   @return [Symbol, :computer_20250124]
        required :type, const: :computer_20250124

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute display_number
        #   The X11 display number (e.g. 0, 1) for the display.
        #
        #   @return [Integer, nil]
        optional :display_number, Integer, nil?: true

        # @!method initialize(display_height_px:, display_width_px:, cache_control: nil, display_number: nil, name: :computer, type: :computer_20250124)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaToolComputerUse20250124} for more details.
        #
        #   @param display_height_px [Integer] The height of the display in pixels.
        #
        #   @param display_width_px [Integer] The width of the display in pixels.
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param display_number [Integer, nil] The X11 display number (e.g. 0, 1) for the display.
        #
        #   @param name [Symbol, :computer] Name of the tool.
        #
        #   @param type [Symbol, :computer_20250124]
      end
    end

    BetaToolComputerUse20250124 = Beta::BetaToolComputerUse20250124
  end
end
