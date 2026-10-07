# frozen_string_literal: true

module Anthropic
  module Models
    module ComputerToolUseBlock
      extend Anthropic::Internal::Type::Union

      discriminator :name

      variant :key, -> { Anthropic::ComputerKeyToolUseBlock }

      variant :hold_key, -> { Anthropic::ComputerHoldKeyToolUseBlock }

      variant :type, -> { Anthropic::ComputerTypeToolUseBlock }

      variant :cursor_position, -> { Anthropic::ComputerCursorPositionToolUseBlock }

      variant :mouse_move, -> { Anthropic::ComputerMouseMoveToolUseBlock }

      variant :left_mouse_down, -> { Anthropic::ComputerLeftMouseDownToolUseBlock }

      variant :left_mouse_up, -> { Anthropic::ComputerLeftMouseUpToolUseBlock }

      variant :left_click, -> { Anthropic::ComputerLeftClickToolUseBlock }

      variant :left_click_drag, -> { Anthropic::ComputerLeftClickDragToolUseBlock }

      variant :right_click, -> { Anthropic::ComputerRightClickToolUseBlock }

      variant :middle_click, -> { Anthropic::ComputerMiddleClickToolUseBlock }

      variant :double_click, -> { Anthropic::ComputerDoubleClickToolUseBlock }

      variant :triple_click, -> { Anthropic::ComputerTripleClickToolUseBlock }

      variant :scroll, -> { Anthropic::ComputerScrollToolUseBlock }

      variant :wait, -> { Anthropic::ComputerWaitToolUseBlock }

      variant :screenshot, -> { Anthropic::ComputerScreenshotToolUseBlock }

      variant :zoom, -> { Anthropic::ComputerZoomToolUseBlock }

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
      #   @return [Array(Anthropic::Models::ComputerKeyToolUseBlock, Anthropic::Models::ComputerHoldKeyToolUseBlock, Anthropic::Models::ComputerTypeToolUseBlock, Anthropic::Models::ComputerCursorPositionToolUseBlock, Anthropic::Models::ComputerMouseMoveToolUseBlock, Anthropic::Models::ComputerLeftMouseDownToolUseBlock, Anthropic::Models::ComputerLeftMouseUpToolUseBlock, Anthropic::Models::ComputerLeftClickToolUseBlock, Anthropic::Models::ComputerLeftClickDragToolUseBlock, Anthropic::Models::ComputerRightClickToolUseBlock, Anthropic::Models::ComputerMiddleClickToolUseBlock, Anthropic::Models::ComputerDoubleClickToolUseBlock, Anthropic::Models::ComputerTripleClickToolUseBlock, Anthropic::Models::ComputerScrollToolUseBlock, Anthropic::Models::ComputerWaitToolUseBlock, Anthropic::Models::ComputerScreenshotToolUseBlock, Anthropic::Models::ComputerZoomToolUseBlock)]

      # Creates a new instance of the variant class whose `name` matches the given
      # value, passing the remaining arguments to its constructor.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::ComputerToolUseBlock} for more details.
      #
      # @param name [Symbol, Anthropic::Models::ComputerToolUseBlock::Name, String]
      #
      # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
      #
      #   @option args [String] :id
      #
      #   @option args [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120] :caller_ Which party invoked the tool call: the model directly, or a server tool on its b
      #
      #   @option args [Anthropic::Models::ComputerKeyInput, Anthropic::Models::ComputerHoldKeyInput, Anthropic::Models::ComputerTypeInput, Anthropic::Models::ComputerCursorPositionInput, Anthropic::Models::ComputerMouseMoveInput, Anthropic::Models::ComputerLeftMouseDownInput, Anthropic::Models::ComputerLeftMouseUpInput, Anthropic::Models::ComputerLeftClickInput, Anthropic::Models::ComputerLeftClickDragInput, Anthropic::Models::ComputerRightClickInput, Anthropic::Models::ComputerMiddleClickInput, Anthropic::Models::ComputerDoubleClickInput, Anthropic::Models::ComputerTripleClickInput, Anthropic::Models::ComputerScrollInput, Anthropic::Models::ComputerWaitInput, Anthropic::Models::ComputerScreenshotInput, Anthropic::Models::ComputerZoomInput] :input Press a key or key-combination on the keyboard. Use "+" to combine modifiers wit
      #
      #   @option args [Symbol, :computer] :toolset_name
      #
      #   @option args [Symbol, :tool_use] :type
      #
      # @raise [ArgumentError]
      # @return [Anthropic::Models::ComputerKeyToolUseBlock, Anthropic::Models::ComputerHoldKeyToolUseBlock, Anthropic::Models::ComputerTypeToolUseBlock, Anthropic::Models::ComputerCursorPositionToolUseBlock, Anthropic::Models::ComputerMouseMoveToolUseBlock, Anthropic::Models::ComputerLeftMouseDownToolUseBlock, Anthropic::Models::ComputerLeftMouseUpToolUseBlock, Anthropic::Models::ComputerLeftClickToolUseBlock, Anthropic::Models::ComputerLeftClickDragToolUseBlock, Anthropic::Models::ComputerRightClickToolUseBlock, Anthropic::Models::ComputerMiddleClickToolUseBlock, Anthropic::Models::ComputerDoubleClickToolUseBlock, Anthropic::Models::ComputerTripleClickToolUseBlock, Anthropic::Models::ComputerScrollToolUseBlock, Anthropic::Models::ComputerWaitToolUseBlock, Anthropic::Models::ComputerScreenshotToolUseBlock, Anthropic::Models::ComputerZoomToolUseBlock]
      def self.new(name:, **args)
        case name.to_sym
        when :key
          Anthropic::ComputerKeyToolUseBlock.new(**args)
        when :hold_key
          Anthropic::ComputerHoldKeyToolUseBlock.new(**args)
        when :type
          Anthropic::ComputerTypeToolUseBlock.new(**args)
        when :cursor_position
          Anthropic::ComputerCursorPositionToolUseBlock.new(**args)
        when :mouse_move
          Anthropic::ComputerMouseMoveToolUseBlock.new(**args)
        when :left_mouse_down
          Anthropic::ComputerLeftMouseDownToolUseBlock.new(**args)
        when :left_mouse_up
          Anthropic::ComputerLeftMouseUpToolUseBlock.new(**args)
        when :left_click
          Anthropic::ComputerLeftClickToolUseBlock.new(**args)
        when :left_click_drag
          Anthropic::ComputerLeftClickDragToolUseBlock.new(**args)
        when :right_click
          Anthropic::ComputerRightClickToolUseBlock.new(**args)
        when :middle_click
          Anthropic::ComputerMiddleClickToolUseBlock.new(**args)
        when :double_click
          Anthropic::ComputerDoubleClickToolUseBlock.new(**args)
        when :triple_click
          Anthropic::ComputerTripleClickToolUseBlock.new(**args)
        when :scroll
          Anthropic::ComputerScrollToolUseBlock.new(**args)
        when :wait
          Anthropic::ComputerWaitToolUseBlock.new(**args)
        when :screenshot
          Anthropic::ComputerScreenshotToolUseBlock.new(**args)
        when :zoom
          Anthropic::ComputerZoomToolUseBlock.new(**args)
        else
          raise ArgumentError, "unknown name: #{name}"
        end
      end
    end
  end
end
