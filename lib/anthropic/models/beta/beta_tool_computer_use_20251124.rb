# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaToolComputerUse20251124 < Anthropic::Internal::Type::BaseModel
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
        #   @return [Symbol, :computer_20251124]
        required :type, const: :computer_20251124

        # @!attribute allowed_callers
        #
        #   @return [Array<Symbol, Anthropic::Models::Beta::BetaToolComputerUse20251124::AllowedCaller>, nil]
        optional :allowed_callers,
                 -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::BetaToolComputerUse20251124::AllowedCaller] }

        # @!attribute cache_control
        #   Create a cache control breakpoint at this content block.
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Beta::BetaCacheControlEphemeral }, nil?: true

        # @!attribute defer_loading
        #   If true, tool will not be included in initial system prompt. Only loaded when
        #   returned via tool_reference from tool search.
        #
        #   @return [Boolean, nil]
        optional :defer_loading, Anthropic::Internal::Type::Boolean

        # @!attribute display_number
        #   The X11 display number (e.g. 0, 1) for the display.
        #
        #   @return [Integer, nil]
        optional :display_number, Integer, nil?: true

        # @!attribute enable_zoom
        #   Whether to enable an action to take a zoomed-in screenshot of the screen.
        #
        #   @return [Boolean, nil]
        optional :enable_zoom, Anthropic::Internal::Type::Boolean

        # @!attribute input_examples
        #
        #   @return [Array<Hash{Symbol=>Object}>, nil]
        optional :input_examples,
                 Anthropic::Internal::Type::ArrayOf[Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown]]

        # @!attribute strict
        #   When true, guarantees schema validation on tool names and inputs
        #
        #   @return [Boolean, nil]
        optional :strict, Anthropic::Internal::Type::Boolean

        # @!method initialize(display_height_px:, display_width_px:, allowed_callers: nil, cache_control: nil, defer_loading: nil, display_number: nil, enable_zoom: nil, input_examples: nil, strict: nil, name: :computer, type: :computer_20251124)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaToolComputerUse20251124} for more details.
        #
        #   @param display_height_px [Integer] The height of the display in pixels.
        #
        #   @param display_width_px [Integer] The width of the display in pixels.
        #
        #   @param allowed_callers [Array<Symbol, Anthropic::Models::Beta::BetaToolComputerUse20251124::AllowedCaller>]
        #
        #   @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil] Create a cache control breakpoint at this content block.
        #
        #   @param defer_loading [Boolean] If true, tool will not be included in initial system prompt. Only loaded when re
        #
        #   @param display_number [Integer, nil] The X11 display number (e.g. 0, 1) for the display.
        #
        #   @param enable_zoom [Boolean] Whether to enable an action to take a zoomed-in screenshot of the screen.
        #
        #   @param input_examples [Array<Hash{Symbol=>Object}>]
        #
        #   @param strict [Boolean] When true, guarantees schema validation on tool names and inputs
        #
        #   @param name [Symbol, :computer] Name of the tool.
        #
        #   @param type [Symbol, :computer_20251124]

        module AllowedCaller
          extend Anthropic::Internal::Type::Enum

          DIRECT = :direct
          CODE_EXECUTION_20250825 = :code_execution_20250825
          CODE_EXECUTION_20260120 = :code_execution_20260120

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaToolComputerUse20251124 = Beta::BetaToolComputerUse20251124
  end
end
