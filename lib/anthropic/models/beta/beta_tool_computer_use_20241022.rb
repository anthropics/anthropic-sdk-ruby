# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolComputerUse20241022 < Anthropic::Internal::Type::BaseModel
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
        #     This is how the tool will be called by the model and in tool_use blocks.
        #
        #   @return [Symbol, :computer]
        required :name, const: :computer

        # @!attribute type
        #
        #   @return [Symbol, :computer_20241022]
        required :type, const: :computer_20241022

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute display_number
        #   The X11 display number (e.g. 0, 1) for the display.
        #
        #   @return [Integer, nil]
        optional :display_number, Integer, nil?: true

        # @!parse
        #   # @param display_height_px [Integer]
        #   # @param display_width_px [Integer]
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   # @param display_number [Integer, nil]
        #   # @param name [Symbol, :computer]
        #   # @param type [Symbol, :computer_20241022]
        #   #
        #   def initialize(
        #     display_height_px:,
        #     display_width_px:,
        #     cache_control: nil,
        #     display_number: nil,
        #     name: :computer,
        #     type: :computer_20241022,
        #     **
        #   )
        #     super
        #   end

        # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
      end
    end

    BetaToolComputerUse20241022 = Beta::BetaToolComputerUse20241022
  end
end
