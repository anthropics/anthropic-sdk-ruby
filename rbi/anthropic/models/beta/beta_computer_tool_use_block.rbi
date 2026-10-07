# typed: strong

module Anthropic
  module Models
    BetaComputerToolUseBlock = Beta::BetaComputerToolUseBlock

    module Beta
      module BetaComputerToolUseBlock
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaComputerKeyToolUseBlock,
              Anthropic::Beta::BetaComputerHoldKeyToolUseBlock,
              Anthropic::Beta::BetaComputerTypeToolUseBlock,
              Anthropic::Beta::BetaComputerCursorPositionToolUseBlock,
              Anthropic::Beta::BetaComputerMouseMoveToolUseBlock,
              Anthropic::Beta::BetaComputerLeftMouseDownToolUseBlock,
              Anthropic::Beta::BetaComputerLeftMouseUpToolUseBlock,
              Anthropic::Beta::BetaComputerLeftClickToolUseBlock,
              Anthropic::Beta::BetaComputerLeftClickDragToolUseBlock,
              Anthropic::Beta::BetaComputerRightClickToolUseBlock,
              Anthropic::Beta::BetaComputerMiddleClickToolUseBlock,
              Anthropic::Beta::BetaComputerDoubleClickToolUseBlock,
              Anthropic::Beta::BetaComputerTripleClickToolUseBlock,
              Anthropic::Beta::BetaComputerScrollToolUseBlock,
              Anthropic::Beta::BetaComputerWaitToolUseBlock,
              Anthropic::Beta::BetaComputerScreenshotToolUseBlock,
              Anthropic::Beta::BetaComputerZoomToolUseBlock
            )
          end

        module Name
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaComputerToolUseBlock::Name)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          KEY =
            T.let(
              :key,
              Anthropic::Beta::BetaComputerToolUseBlock::Name::TaggedSymbol
            )
          HOLD_KEY =
            T.let(
              :hold_key,
              Anthropic::Beta::BetaComputerToolUseBlock::Name::TaggedSymbol
            )
          TYPE =
            T.let(
              :type,
              Anthropic::Beta::BetaComputerToolUseBlock::Name::TaggedSymbol
            )
          CURSOR_POSITION =
            T.let(
              :cursor_position,
              Anthropic::Beta::BetaComputerToolUseBlock::Name::TaggedSymbol
            )
          MOUSE_MOVE =
            T.let(
              :mouse_move,
              Anthropic::Beta::BetaComputerToolUseBlock::Name::TaggedSymbol
            )
          LEFT_MOUSE_DOWN =
            T.let(
              :left_mouse_down,
              Anthropic::Beta::BetaComputerToolUseBlock::Name::TaggedSymbol
            )
          LEFT_MOUSE_UP =
            T.let(
              :left_mouse_up,
              Anthropic::Beta::BetaComputerToolUseBlock::Name::TaggedSymbol
            )
          LEFT_CLICK =
            T.let(
              :left_click,
              Anthropic::Beta::BetaComputerToolUseBlock::Name::TaggedSymbol
            )
          LEFT_CLICK_DRAG =
            T.let(
              :left_click_drag,
              Anthropic::Beta::BetaComputerToolUseBlock::Name::TaggedSymbol
            )
          RIGHT_CLICK =
            T.let(
              :right_click,
              Anthropic::Beta::BetaComputerToolUseBlock::Name::TaggedSymbol
            )
          MIDDLE_CLICK =
            T.let(
              :middle_click,
              Anthropic::Beta::BetaComputerToolUseBlock::Name::TaggedSymbol
            )
          DOUBLE_CLICK =
            T.let(
              :double_click,
              Anthropic::Beta::BetaComputerToolUseBlock::Name::TaggedSymbol
            )
          TRIPLE_CLICK =
            T.let(
              :triple_click,
              Anthropic::Beta::BetaComputerToolUseBlock::Name::TaggedSymbol
            )
          SCROLL =
            T.let(
              :scroll,
              Anthropic::Beta::BetaComputerToolUseBlock::Name::TaggedSymbol
            )
          WAIT =
            T.let(
              :wait,
              Anthropic::Beta::BetaComputerToolUseBlock::Name::TaggedSymbol
            )
          SCREENSHOT =
            T.let(
              :screenshot,
              Anthropic::Beta::BetaComputerToolUseBlock::Name::TaggedSymbol
            )
          ZOOM =
            T.let(
              :zoom,
              Anthropic::Beta::BetaComputerToolUseBlock::Name::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaComputerToolUseBlock::Name::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaComputerToolUseBlock::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `name` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            name: Anthropic::Beta::BetaComputerToolUseBlock::Name::OrSymbol,
            id: String,
            input:
              T.any(
                Anthropic::Beta::BetaComputerKeyInput::OrHash,
                Anthropic::Beta::BetaComputerHoldKeyInput::OrHash,
                Anthropic::Beta::BetaComputerTypeInput::OrHash,
                Anthropic::Beta::BetaComputerCursorPositionInput::OrHash,
                Anthropic::Beta::BetaComputerMouseMoveInput::OrHash,
                Anthropic::Beta::BetaComputerLeftMouseDownInput::OrHash,
                Anthropic::Beta::BetaComputerLeftMouseUpInput::OrHash,
                Anthropic::Beta::BetaComputerLeftClickInput::OrHash,
                Anthropic::Beta::BetaComputerLeftClickDragInput::OrHash,
                Anthropic::Beta::BetaComputerRightClickInput::OrHash,
                Anthropic::Beta::BetaComputerMiddleClickInput::OrHash,
                Anthropic::Beta::BetaComputerDoubleClickInput::OrHash,
                Anthropic::Beta::BetaComputerTripleClickInput::OrHash,
                Anthropic::Beta::BetaComputerScrollInput::OrHash,
                Anthropic::Beta::BetaComputerWaitInput::OrHash,
                Anthropic::Beta::BetaComputerScreenshotInput::OrHash,
                Anthropic::Beta::BetaComputerZoomInput::OrHash
              ),
            caller_:
              T.any(
                Anthropic::Beta::BetaDirectCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller20260120::OrHash
              ),
            toolset_name: Symbol,
            type: Symbol
          ).returns(Anthropic::Beta::BetaComputerToolUseBlock::Variants)
        end
        def self.new(
          name:,
          id:,
          # Press a key or key-combination on the keyboard. Use "+" to combine modifiers
          # with a key (e.g. "ctrl+s", "alt+Tab", "ctrl+shift+Escape"). Key names are
          # case-insensitive; common names like "Return", "Tab", "Escape", "Up", "Down",
          # "Left", "Right", "Home", "End", "Page_Up", "Page_Down", "Delete", "BackSpace"
          # are supported.
          input:,
          # Which party invoked the tool call: the model directly, or a server tool on its
          # behalf.
          caller_: nil,
          toolset_name: :computer,
          type: :tool_use
        )
        end
      end
    end
  end
end
