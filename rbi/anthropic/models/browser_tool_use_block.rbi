# typed: strong

module Anthropic
  module Models
    module BrowserToolUseBlock
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(
            Anthropic::BrowserNavigateToolUseBlock,
            Anthropic::BrowserListTabsToolUseBlock,
            Anthropic::BrowserNewTabToolUseBlock,
            Anthropic::BrowserSwitchTabToolUseBlock,
            Anthropic::BrowserCloseTabToolUseBlock,
            Anthropic::BrowserReadPageToolUseBlock,
            Anthropic::BrowserGetPageTextToolUseBlock,
            Anthropic::BrowserReadConsoleToolUseBlock,
            Anthropic::BrowserReadNetworkToolUseBlock,
            Anthropic::BrowserFindToolUseBlock,
            Anthropic::BrowserFormInputToolUseBlock,
            Anthropic::BrowserFileUploadToolUseBlock,
            Anthropic::BrowserScrollToToolUseBlock,
            Anthropic::BrowserScreenshotToolUseBlock,
            Anthropic::BrowserZoomToolUseBlock,
            Anthropic::BrowserLeftClickToolUseBlock,
            Anthropic::BrowserRightClickToolUseBlock,
            Anthropic::BrowserMiddleClickToolUseBlock,
            Anthropic::BrowserDoubleClickToolUseBlock,
            Anthropic::BrowserTripleClickToolUseBlock,
            Anthropic::BrowserHoverToolUseBlock,
            Anthropic::BrowserLeftClickDragToolUseBlock,
            Anthropic::BrowserLeftMouseDownToolUseBlock,
            Anthropic::BrowserLeftMouseUpToolUseBlock,
            Anthropic::BrowserMouseMoveToolUseBlock,
            Anthropic::BrowserScrollToolUseBlock,
            Anthropic::BrowserTypeToolUseBlock,
            Anthropic::BrowserKeyToolUseBlock,
            Anthropic::BrowserHoldKeyToolUseBlock,
            Anthropic::BrowserWaitToolUseBlock,
            Anthropic::BrowserJavascriptExecToolUseBlock
          )
        end

      module Name
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::BrowserToolUseBlock::Name) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        NAVIGATE =
          T.let(:navigate, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        LIST_TABS =
          T.let(:list_tabs, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        NEW_TAB =
          T.let(:new_tab, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        SWITCH_TAB =
          T.let(:switch_tab, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        CLOSE_TAB =
          T.let(:close_tab, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        READ_PAGE =
          T.let(:read_page, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        GET_PAGE_TEXT =
          T.let(
            :get_page_text,
            Anthropic::BrowserToolUseBlock::Name::TaggedSymbol
          )
        READ_CONSOLE =
          T.let(
            :read_console,
            Anthropic::BrowserToolUseBlock::Name::TaggedSymbol
          )
        READ_NETWORK =
          T.let(
            :read_network,
            Anthropic::BrowserToolUseBlock::Name::TaggedSymbol
          )
        FIND = T.let(:find, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        FORM_INPUT =
          T.let(:form_input, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        FILE_UPLOAD =
          T.let(
            :file_upload,
            Anthropic::BrowserToolUseBlock::Name::TaggedSymbol
          )
        SCROLL_TO =
          T.let(:scroll_to, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        SCREENSHOT =
          T.let(:screenshot, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        ZOOM = T.let(:zoom, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        LEFT_CLICK =
          T.let(:left_click, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        RIGHT_CLICK =
          T.let(
            :right_click,
            Anthropic::BrowserToolUseBlock::Name::TaggedSymbol
          )
        MIDDLE_CLICK =
          T.let(
            :middle_click,
            Anthropic::BrowserToolUseBlock::Name::TaggedSymbol
          )
        DOUBLE_CLICK =
          T.let(
            :double_click,
            Anthropic::BrowserToolUseBlock::Name::TaggedSymbol
          )
        TRIPLE_CLICK =
          T.let(
            :triple_click,
            Anthropic::BrowserToolUseBlock::Name::TaggedSymbol
          )
        HOVER =
          T.let(:hover, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        LEFT_CLICK_DRAG =
          T.let(
            :left_click_drag,
            Anthropic::BrowserToolUseBlock::Name::TaggedSymbol
          )
        LEFT_MOUSE_DOWN =
          T.let(
            :left_mouse_down,
            Anthropic::BrowserToolUseBlock::Name::TaggedSymbol
          )
        LEFT_MOUSE_UP =
          T.let(
            :left_mouse_up,
            Anthropic::BrowserToolUseBlock::Name::TaggedSymbol
          )
        MOUSE_MOVE =
          T.let(:mouse_move, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        SCROLL =
          T.let(:scroll, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        TYPE = T.let(:type, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        KEY = T.let(:key, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        HOLD_KEY =
          T.let(:hold_key, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        WAIT = T.let(:wait, Anthropic::BrowserToolUseBlock::Name::TaggedSymbol)
        JAVASCRIPT_EXEC =
          T.let(
            :javascript_exec,
            Anthropic::BrowserToolUseBlock::Name::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::BrowserToolUseBlock::Name::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      sig do
        override.returns(T::Array[Anthropic::BrowserToolUseBlock::Variants])
      end
      def self.variants
      end

      # Creates a new instance of the variant class whose `name` matches the given
      # value, passing the remaining arguments to its constructor.
      sig do
        params(
          name: Anthropic::BrowserToolUseBlock::Name::OrSymbol,
          id: String,
          caller_:
            T.any(
              Anthropic::DirectCaller::OrHash,
              Anthropic::ServerToolCaller::OrHash,
              Anthropic::ServerToolCaller20260120::OrHash
            ),
          input:
            T.any(
              Anthropic::BrowserNavigateInput::OrHash,
              Anthropic::BrowserListTabsInput::OrHash,
              Anthropic::BrowserNewTabInput::OrHash,
              Anthropic::BrowserSwitchTabInput::OrHash,
              Anthropic::BrowserCloseTabInput::OrHash,
              Anthropic::BrowserReadPageInput::OrHash,
              Anthropic::BrowserGetPageTextInput::OrHash,
              Anthropic::BrowserReadConsoleInput::OrHash,
              Anthropic::BrowserReadNetworkInput::OrHash,
              Anthropic::BrowserFindInput::OrHash,
              Anthropic::BrowserFormInputInput::OrHash,
              Anthropic::BrowserFileUploadInput::OrHash,
              Anthropic::BrowserScrollToInput::OrHash,
              Anthropic::BrowserScreenshotInput::OrHash,
              Anthropic::BrowserZoomInput::OrHash,
              Anthropic::BrowserLeftClickInput::OrHash,
              Anthropic::BrowserRightClickInput::OrHash,
              Anthropic::BrowserMiddleClickInput::OrHash,
              Anthropic::BrowserDoubleClickInput::OrHash,
              Anthropic::BrowserTripleClickInput::OrHash,
              Anthropic::BrowserHoverInput::OrHash,
              Anthropic::BrowserLeftClickDragInput::OrHash,
              Anthropic::BrowserLeftMouseDownInput::OrHash,
              Anthropic::BrowserLeftMouseUpInput::OrHash,
              Anthropic::BrowserMouseMoveInput::OrHash,
              Anthropic::BrowserScrollInput::OrHash,
              Anthropic::BrowserTypeInput::OrHash,
              Anthropic::BrowserKeyInput::OrHash,
              Anthropic::BrowserHoldKeyInput::OrHash,
              Anthropic::BrowserWaitInput::OrHash,
              Anthropic::BrowserJavascriptExecInput::OrHash
            ),
          toolset_name: Symbol,
          type: Symbol
        ).returns(Anthropic::BrowserToolUseBlock::Variants)
      end
      def self.new(
        name:,
        id:,
        # Which party invoked the tool call: the model directly, or a server tool on its
        # behalf.
        caller_:,
        # Navigate to a URL, or go back/forward/reload in history. The protocol may be
        # omitted (defaults to https://).
        input:,
        toolset_name: :browser,
        type: :tool_use
      )
      end
    end
  end
end
