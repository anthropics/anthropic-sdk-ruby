# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaComputerToolUseBlock
        extend Anthropic::Internal::Type::Union

        discriminator :name

        variant :key, -> { Anthropic::Beta::BetaComputerKeyToolUseBlock }

        variant :hold_key, -> { Anthropic::Beta::BetaComputerHoldKeyToolUseBlock }

        variant :type, -> { Anthropic::Beta::BetaComputerTypeToolUseBlock }

        variant :cursor_position, -> { Anthropic::Beta::BetaComputerCursorPositionToolUseBlock }

        variant :mouse_move, -> { Anthropic::Beta::BetaComputerMouseMoveToolUseBlock }

        variant :left_mouse_down, -> { Anthropic::Beta::BetaComputerLeftMouseDownToolUseBlock }

        variant :left_mouse_up, -> { Anthropic::Beta::BetaComputerLeftMouseUpToolUseBlock }

        variant :left_click, -> { Anthropic::Beta::BetaComputerLeftClickToolUseBlock }

        variant :left_click_drag, -> { Anthropic::Beta::BetaComputerLeftClickDragToolUseBlock }

        variant :right_click, -> { Anthropic::Beta::BetaComputerRightClickToolUseBlock }

        variant :middle_click, -> { Anthropic::Beta::BetaComputerMiddleClickToolUseBlock }

        variant :double_click, -> { Anthropic::Beta::BetaComputerDoubleClickToolUseBlock }

        variant :triple_click, -> { Anthropic::Beta::BetaComputerTripleClickToolUseBlock }

        variant :scroll, -> { Anthropic::Beta::BetaComputerScrollToolUseBlock }

        variant :wait, -> { Anthropic::Beta::BetaComputerWaitToolUseBlock }

        variant :screenshot, -> { Anthropic::Beta::BetaComputerScreenshotToolUseBlock }

        variant :zoom, -> { Anthropic::Beta::BetaComputerZoomToolUseBlock }

        module Name
          extend Anthropic::Internal::Type::Enum

          KEY = :key
          HOLD_KEY = :hold_key
          TYPE = :type
          CURSOR_POSITION = :cursor_position
          MOUSE_MOVE = :mouse_move
          LEFT_MOUSE_DOWN = :left_mouse_down
          LEFT_MOUSE_UP = :left_mouse_up
          LEFT_CLICK = :left_click
          LEFT_CLICK_DRAG = :left_click_drag
          RIGHT_CLICK = :right_click
          MIDDLE_CLICK = :middle_click
          DOUBLE_CLICK = :double_click
          TRIPLE_CLICK = :triple_click
          SCROLL = :scroll
          WAIT = :wait
          SCREENSHOT = :screenshot
          ZOOM = :zoom

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaComputerKeyToolUseBlock, Anthropic::Models::Beta::BetaComputerHoldKeyToolUseBlock, Anthropic::Models::Beta::BetaComputerTypeToolUseBlock, Anthropic::Models::Beta::BetaComputerCursorPositionToolUseBlock, Anthropic::Models::Beta::BetaComputerMouseMoveToolUseBlock, Anthropic::Models::Beta::BetaComputerLeftMouseDownToolUseBlock, Anthropic::Models::Beta::BetaComputerLeftMouseUpToolUseBlock, Anthropic::Models::Beta::BetaComputerLeftClickToolUseBlock, Anthropic::Models::Beta::BetaComputerLeftClickDragToolUseBlock, Anthropic::Models::Beta::BetaComputerRightClickToolUseBlock, Anthropic::Models::Beta::BetaComputerMiddleClickToolUseBlock, Anthropic::Models::Beta::BetaComputerDoubleClickToolUseBlock, Anthropic::Models::Beta::BetaComputerTripleClickToolUseBlock, Anthropic::Models::Beta::BetaComputerScrollToolUseBlock, Anthropic::Models::Beta::BetaComputerWaitToolUseBlock, Anthropic::Models::Beta::BetaComputerScreenshotToolUseBlock, Anthropic::Models::Beta::BetaComputerZoomToolUseBlock)]

        # Creates a new instance of the variant class whose `name` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaComputerToolUseBlock} for more details.
        #
        # @param name [Symbol, Anthropic::Models::Beta::BetaComputerToolUseBlock::Name, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :id
        #
        #   @option args [Anthropic::Models::Beta::BetaComputerKeyInput, Anthropic::Models::Beta::BetaComputerHoldKeyInput, Anthropic::Models::Beta::BetaComputerTypeInput, Anthropic::Models::Beta::BetaComputerCursorPositionInput, Anthropic::Models::Beta::BetaComputerMouseMoveInput, Anthropic::Models::Beta::BetaComputerLeftMouseDownInput, Anthropic::Models::Beta::BetaComputerLeftMouseUpInput, Anthropic::Models::Beta::BetaComputerLeftClickInput, Anthropic::Models::Beta::BetaComputerLeftClickDragInput, Anthropic::Models::Beta::BetaComputerRightClickInput, Anthropic::Models::Beta::BetaComputerMiddleClickInput, Anthropic::Models::Beta::BetaComputerDoubleClickInput, Anthropic::Models::Beta::BetaComputerTripleClickInput, Anthropic::Models::Beta::BetaComputerScrollInput, Anthropic::Models::Beta::BetaComputerWaitInput, Anthropic::Models::Beta::BetaComputerScreenshotInput, Anthropic::Models::Beta::BetaComputerZoomInput] :input Press a key or key-combination on the keyboard. Use "+" to combine modifiers wit
        #
        #   @option args [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] :caller_ Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @option args [Symbol, :computer] :toolset_name
        #
        #   @option args [Symbol, :tool_use] :type
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaComputerKeyToolUseBlock, Anthropic::Models::Beta::BetaComputerHoldKeyToolUseBlock, Anthropic::Models::Beta::BetaComputerTypeToolUseBlock, Anthropic::Models::Beta::BetaComputerCursorPositionToolUseBlock, Anthropic::Models::Beta::BetaComputerMouseMoveToolUseBlock, Anthropic::Models::Beta::BetaComputerLeftMouseDownToolUseBlock, Anthropic::Models::Beta::BetaComputerLeftMouseUpToolUseBlock, Anthropic::Models::Beta::BetaComputerLeftClickToolUseBlock, Anthropic::Models::Beta::BetaComputerLeftClickDragToolUseBlock, Anthropic::Models::Beta::BetaComputerRightClickToolUseBlock, Anthropic::Models::Beta::BetaComputerMiddleClickToolUseBlock, Anthropic::Models::Beta::BetaComputerDoubleClickToolUseBlock, Anthropic::Models::Beta::BetaComputerTripleClickToolUseBlock, Anthropic::Models::Beta::BetaComputerScrollToolUseBlock, Anthropic::Models::Beta::BetaComputerWaitToolUseBlock, Anthropic::Models::Beta::BetaComputerScreenshotToolUseBlock, Anthropic::Models::Beta::BetaComputerZoomToolUseBlock]
        def self.new(name:, **args)
          case name.to_sym
          when :key
            Anthropic::Beta::BetaComputerKeyToolUseBlock.new(**args)
          when :hold_key
            Anthropic::Beta::BetaComputerHoldKeyToolUseBlock.new(**args)
          when :type
            Anthropic::Beta::BetaComputerTypeToolUseBlock.new(**args)
          when :cursor_position
            Anthropic::Beta::BetaComputerCursorPositionToolUseBlock.new(**args)
          when :mouse_move
            Anthropic::Beta::BetaComputerMouseMoveToolUseBlock.new(**args)
          when :left_mouse_down
            Anthropic::Beta::BetaComputerLeftMouseDownToolUseBlock.new(**args)
          when :left_mouse_up
            Anthropic::Beta::BetaComputerLeftMouseUpToolUseBlock.new(**args)
          when :left_click
            Anthropic::Beta::BetaComputerLeftClickToolUseBlock.new(**args)
          when :left_click_drag
            Anthropic::Beta::BetaComputerLeftClickDragToolUseBlock.new(**args)
          when :right_click
            Anthropic::Beta::BetaComputerRightClickToolUseBlock.new(**args)
          when :middle_click
            Anthropic::Beta::BetaComputerMiddleClickToolUseBlock.new(**args)
          when :double_click
            Anthropic::Beta::BetaComputerDoubleClickToolUseBlock.new(**args)
          when :triple_click
            Anthropic::Beta::BetaComputerTripleClickToolUseBlock.new(**args)
          when :scroll
            Anthropic::Beta::BetaComputerScrollToolUseBlock.new(**args)
          when :wait
            Anthropic::Beta::BetaComputerWaitToolUseBlock.new(**args)
          when :screenshot
            Anthropic::Beta::BetaComputerScreenshotToolUseBlock.new(**args)
          when :zoom
            Anthropic::Beta::BetaComputerZoomToolUseBlock.new(**args)
          else
            raise ArgumentError, "unknown name: #{name}"
          end
        end
      end
    end

    BetaComputerToolUseBlock = Beta::BetaComputerToolUseBlock
  end
end
