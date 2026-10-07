# typed: strong

module Anthropic
  module Models
    BetaBrowserToolUseBlock = Beta::BetaBrowserToolUseBlock

    module Beta
      module BetaBrowserToolUseBlock
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserNavigateToolUseBlock,
              Anthropic::Beta::BetaBrowserListTabsToolUseBlock,
              Anthropic::Beta::BetaBrowserNewTabToolUseBlock,
              Anthropic::Beta::BetaBrowserSwitchTabToolUseBlock,
              Anthropic::Beta::BetaBrowserCloseTabToolUseBlock,
              Anthropic::Beta::BetaBrowserReadPageToolUseBlock,
              Anthropic::Beta::BetaBrowserGetPageTextToolUseBlock,
              Anthropic::Beta::BetaBrowserReadConsoleToolUseBlock,
              Anthropic::Beta::BetaBrowserReadNetworkToolUseBlock,
              Anthropic::Beta::BetaBrowserFindToolUseBlock,
              Anthropic::Beta::BetaBrowserFormInputToolUseBlock,
              Anthropic::Beta::BetaBrowserFileUploadToolUseBlock,
              Anthropic::Beta::BetaBrowserScrollToToolUseBlock,
              Anthropic::Beta::BetaBrowserScreenshotToolUseBlock,
              Anthropic::Beta::BetaBrowserZoomToolUseBlock,
              Anthropic::Beta::BetaBrowserLeftClickToolUseBlock,
              Anthropic::Beta::BetaBrowserRightClickToolUseBlock,
              Anthropic::Beta::BetaBrowserMiddleClickToolUseBlock,
              Anthropic::Beta::BetaBrowserDoubleClickToolUseBlock,
              Anthropic::Beta::BetaBrowserTripleClickToolUseBlock,
              Anthropic::Beta::BetaBrowserHoverToolUseBlock,
              Anthropic::Beta::BetaBrowserLeftClickDragToolUseBlock,
              Anthropic::Beta::BetaBrowserLeftMouseDownToolUseBlock,
              Anthropic::Beta::BetaBrowserLeftMouseUpToolUseBlock,
              Anthropic::Beta::BetaBrowserMouseMoveToolUseBlock,
              Anthropic::Beta::BetaBrowserScrollToolUseBlock,
              Anthropic::Beta::BetaBrowserTypeToolUseBlock,
              Anthropic::Beta::BetaBrowserKeyToolUseBlock,
              Anthropic::Beta::BetaBrowserHoldKeyToolUseBlock,
              Anthropic::Beta::BetaBrowserWaitToolUseBlock,
              Anthropic::Beta::BetaBrowserJavascriptExecToolUseBlock
            )
          end

        module Name
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaBrowserToolUseBlock::Name)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          NAVIGATE =
            T.let(
              :navigate,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          LIST_TABS =
            T.let(
              :list_tabs,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          NEW_TAB =
            T.let(
              :new_tab,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          SWITCH_TAB =
            T.let(
              :switch_tab,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          CLOSE_TAB =
            T.let(
              :close_tab,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          READ_PAGE =
            T.let(
              :read_page,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          GET_PAGE_TEXT =
            T.let(
              :get_page_text,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          READ_CONSOLE =
            T.let(
              :read_console,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          READ_NETWORK =
            T.let(
              :read_network,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          FIND =
            T.let(
              :find,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          FORM_INPUT =
            T.let(
              :form_input,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          FILE_UPLOAD =
            T.let(
              :file_upload,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          SCROLL_TO =
            T.let(
              :scroll_to,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          SCREENSHOT =
            T.let(
              :screenshot,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          ZOOM =
            T.let(
              :zoom,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          LEFT_CLICK =
            T.let(
              :left_click,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          RIGHT_CLICK =
            T.let(
              :right_click,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          MIDDLE_CLICK =
            T.let(
              :middle_click,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          DOUBLE_CLICK =
            T.let(
              :double_click,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          TRIPLE_CLICK =
            T.let(
              :triple_click,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          HOVER =
            T.let(
              :hover,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          LEFT_CLICK_DRAG =
            T.let(
              :left_click_drag,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          LEFT_MOUSE_DOWN =
            T.let(
              :left_mouse_down,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          LEFT_MOUSE_UP =
            T.let(
              :left_mouse_up,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          MOUSE_MOVE =
            T.let(
              :mouse_move,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          SCROLL =
            T.let(
              :scroll,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          TYPE =
            T.let(
              :type,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          KEY =
            T.let(
              :key,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          HOLD_KEY =
            T.let(
              :hold_key,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          WAIT =
            T.let(
              :wait,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )
          JAVASCRIPT_EXEC =
            T.let(
              :javascript_exec,
              Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaBrowserToolUseBlock::Name::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaBrowserToolUseBlock::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `name` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            name: Anthropic::Beta::BetaBrowserToolUseBlock::Name::OrSymbol,
            id: String,
            input:
              T.any(
                Anthropic::Beta::BetaBrowserNavigateInput::OrHash,
                Anthropic::Beta::BetaBrowserListTabsInput::OrHash,
                Anthropic::Beta::BetaBrowserNewTabInput::OrHash,
                Anthropic::Beta::BetaBrowserSwitchTabInput::OrHash,
                Anthropic::Beta::BetaBrowserCloseTabInput::OrHash,
                Anthropic::Beta::BetaBrowserReadPageInput::OrHash,
                Anthropic::Beta::BetaBrowserGetPageTextInput::OrHash,
                Anthropic::Beta::BetaBrowserReadConsoleInput::OrHash,
                Anthropic::Beta::BetaBrowserReadNetworkInput::OrHash,
                Anthropic::Beta::BetaBrowserFindInput::OrHash,
                Anthropic::Beta::BetaBrowserFormInputInput::OrHash,
                Anthropic::Beta::BetaBrowserFileUploadInput::OrHash,
                Anthropic::Beta::BetaBrowserScrollToInput::OrHash,
                Anthropic::Beta::BetaBrowserScreenshotInput::OrHash,
                Anthropic::Beta::BetaBrowserZoomInput::OrHash,
                Anthropic::Beta::BetaBrowserLeftClickInput::OrHash,
                Anthropic::Beta::BetaBrowserRightClickInput::OrHash,
                Anthropic::Beta::BetaBrowserMiddleClickInput::OrHash,
                Anthropic::Beta::BetaBrowserDoubleClickInput::OrHash,
                Anthropic::Beta::BetaBrowserTripleClickInput::OrHash,
                Anthropic::Beta::BetaBrowserHoverInput::OrHash,
                Anthropic::Beta::BetaBrowserLeftClickDragInput::OrHash,
                Anthropic::Beta::BetaBrowserLeftMouseDownInput::OrHash,
                Anthropic::Beta::BetaBrowserLeftMouseUpInput::OrHash,
                Anthropic::Beta::BetaBrowserMouseMoveInput::OrHash,
                Anthropic::Beta::BetaBrowserScrollInput::OrHash,
                Anthropic::Beta::BetaBrowserTypeInput::OrHash,
                Anthropic::Beta::BetaBrowserKeyInput::OrHash,
                Anthropic::Beta::BetaBrowserHoldKeyInput::OrHash,
                Anthropic::Beta::BetaBrowserWaitInput::OrHash,
                Anthropic::Beta::BetaBrowserJavascriptExecInput::OrHash
              ),
            caller_:
              T.any(
                Anthropic::Beta::BetaDirectCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller::OrHash,
                Anthropic::Beta::BetaServerToolCaller20260120::OrHash
              ),
            toolset_name: Symbol,
            type: Symbol
          ).returns(Anthropic::Beta::BetaBrowserToolUseBlock::Variants)
        end
        def self.new(
          name:,
          id:,
          # Navigate to a URL, or go back/forward/reload in history. The protocol may be
          # omitted (defaults to https://).
          input:,
          # Which party invoked the tool call: the model directly, or a server tool on its
          # behalf.
          caller_: nil,
          toolset_name: :browser,
          type: :tool_use
        )
        end
      end
    end
  end
end
