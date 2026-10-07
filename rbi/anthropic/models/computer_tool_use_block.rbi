# typed: strong

module Anthropic
  module Models
    module ComputerToolUseBlock
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::ComputerKeyToolUseBlock,
            Anthropic::ComputerHoldKeyToolUseBlock,
            Anthropic::ComputerTypeToolUseBlock,
            Anthropic::ComputerCursorPositionToolUseBlock,
            Anthropic::ComputerMouseMoveToolUseBlock,
            Anthropic::ComputerLeftMouseDownToolUseBlock,
            Anthropic::ComputerLeftMouseUpToolUseBlock,
            Anthropic::ComputerLeftClickToolUseBlock,
            Anthropic::ComputerLeftClickDragToolUseBlock,
            Anthropic::ComputerRightClickToolUseBlock,
            Anthropic::ComputerMiddleClickToolUseBlock,
            Anthropic::ComputerDoubleClickToolUseBlock,
            Anthropic::ComputerTripleClickToolUseBlock,
            Anthropic::ComputerScrollToolUseBlock,
            Anthropic::ComputerWaitToolUseBlock,
            Anthropic::ComputerScreenshotToolUseBlock,
            Anthropic::ComputerZoomToolUseBlock
          )
        end

      module Name
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::ComputerToolUseBlock::Name) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        KEY = T.let(:key, Anthropic::ComputerToolUseBlock::Name::TaggedSymbol)
        HOLD_KEY =
          T.let(:hold_key, Anthropic::ComputerToolUseBlock::Name::TaggedSymbol)
        TYPE = T.let(:type, Anthropic::ComputerToolUseBlock::Name::TaggedSymbol)
        CURSOR_POSITION =
          T.let(
            :cursor_position,
            Anthropic::ComputerToolUseBlock::Name::TaggedSymbol
          )
        MOUSE_MOVE =
          T.let(
            :mouse_move,
            Anthropic::ComputerToolUseBlock::Name::TaggedSymbol
          )
        LEFT_MOUSE_DOWN =
          T.let(
            :left_mouse_down,
            Anthropic::ComputerToolUseBlock::Name::TaggedSymbol
          )
        LEFT_MOUSE_UP =
          T.let(
            :left_mouse_up,
            Anthropic::ComputerToolUseBlock::Name::TaggedSymbol
          )
        LEFT_CLICK =
          T.let(
            :left_click,
            Anthropic::ComputerToolUseBlock::Name::TaggedSymbol
          )
        LEFT_CLICK_DRAG =
          T.let(
            :left_click_drag,
            Anthropic::ComputerToolUseBlock::Name::TaggedSymbol
          )
        RIGHT_CLICK =
          T.let(
            :right_click,
            Anthropic::ComputerToolUseBlock::Name::TaggedSymbol
          )
        MIDDLE_CLICK =
          T.let(
            :middle_click,
            Anthropic::ComputerToolUseBlock::Name::TaggedSymbol
          )
        DOUBLE_CLICK =
          T.let(
            :double_click,
            Anthropic::ComputerToolUseBlock::Name::TaggedSymbol
          )
        TRIPLE_CLICK =
          T.let(
            :triple_click,
            Anthropic::ComputerToolUseBlock::Name::TaggedSymbol
          )
        SCROLL =
          T.let(:scroll, Anthropic::ComputerToolUseBlock::Name::TaggedSymbol)
        WAIT = T.let(:wait, Anthropic::ComputerToolUseBlock::Name::TaggedSymbol)
        SCREENSHOT =
          T.let(
            :screenshot,
            Anthropic::ComputerToolUseBlock::Name::TaggedSymbol
          )
        ZOOM = T.let(:zoom, Anthropic::ComputerToolUseBlock::Name::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Anthropic::ComputerToolUseBlock::Name::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      sig do
        override.returns(T::Array[Anthropic::ComputerToolUseBlock::Variants])
      end
      def self.variants
      end

      # Creates a new instance of the variant class whose `name` matches the given
      # value, passing the remaining arguments to its constructor.
      sig do
        params(
          name: Anthropic::ComputerToolUseBlock::Name::OrSymbol,
          id: String,
          caller_:
            T.any(
              Anthropic::DirectCaller::OrHash,
              Anthropic::ServerToolCaller::OrHash,
              Anthropic::ServerToolCaller20260120::OrHash
            ),
          input:
            T.any(
              Anthropic::ComputerKeyInput::OrHash,
              Anthropic::ComputerHoldKeyInput::OrHash,
              Anthropic::ComputerTypeInput::OrHash,
              Anthropic::ComputerCursorPositionInput::OrHash,
              Anthropic::ComputerMouseMoveInput::OrHash,
              Anthropic::ComputerLeftMouseDownInput::OrHash,
              Anthropic::ComputerLeftMouseUpInput::OrHash,
              Anthropic::ComputerLeftClickInput::OrHash,
              Anthropic::ComputerLeftClickDragInput::OrHash,
              Anthropic::ComputerRightClickInput::OrHash,
              Anthropic::ComputerMiddleClickInput::OrHash,
              Anthropic::ComputerDoubleClickInput::OrHash,
              Anthropic::ComputerTripleClickInput::OrHash,
              Anthropic::ComputerScrollInput::OrHash,
              Anthropic::ComputerWaitInput::OrHash,
              Anthropic::ComputerScreenshotInput::OrHash,
              Anthropic::ComputerZoomInput::OrHash
            ),
          toolset_name: Symbol,
          type: Symbol
        ).returns(Anthropic::ComputerToolUseBlock::Variants)
      end
      def self.new(
        name:,
        id:,
        # Which party invoked the tool call: the model directly, or a server tool on its
        # behalf.
        caller_:,
        # Press a key or key-combination on the keyboard. Use "+" to combine modifiers
        # with a key (e.g. "ctrl+s", "alt+Tab", "ctrl+shift+Escape"). Key names are
        # case-insensitive; common names like "Return", "Tab", "Escape", "Up", "Down",
        # "Left", "Right", "Home", "End", "Page_Up", "Page_Down", "Delete", "BackSpace"
        # are supported.
        input:,
        toolset_name: :computer,
        type: :tool_use
      )
      end
    end
  end
end
