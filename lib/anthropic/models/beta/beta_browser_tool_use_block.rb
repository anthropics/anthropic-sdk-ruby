# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaBrowserToolUseBlock
        extend Anthropic::Internal::Type::Union

        discriminator :name

        variant :navigate, -> { Anthropic::Beta::BetaBrowserNavigateToolUseBlock }

        variant :list_tabs, -> { Anthropic::Beta::BetaBrowserListTabsToolUseBlock }

        variant :new_tab, -> { Anthropic::Beta::BetaBrowserNewTabToolUseBlock }

        variant :switch_tab, -> { Anthropic::Beta::BetaBrowserSwitchTabToolUseBlock }

        variant :close_tab, -> { Anthropic::Beta::BetaBrowserCloseTabToolUseBlock }

        variant :read_page, -> { Anthropic::Beta::BetaBrowserReadPageToolUseBlock }

        variant :get_page_text, -> { Anthropic::Beta::BetaBrowserGetPageTextToolUseBlock }

        variant :read_console, -> { Anthropic::Beta::BetaBrowserReadConsoleToolUseBlock }

        variant :read_network, -> { Anthropic::Beta::BetaBrowserReadNetworkToolUseBlock }

        variant :find, -> { Anthropic::Beta::BetaBrowserFindToolUseBlock }

        variant :form_input, -> { Anthropic::Beta::BetaBrowserFormInputToolUseBlock }

        variant :file_upload, -> { Anthropic::Beta::BetaBrowserFileUploadToolUseBlock }

        variant :scroll_to, -> { Anthropic::Beta::BetaBrowserScrollToToolUseBlock }

        variant :screenshot, -> { Anthropic::Beta::BetaBrowserScreenshotToolUseBlock }

        variant :zoom, -> { Anthropic::Beta::BetaBrowserZoomToolUseBlock }

        variant :left_click, -> { Anthropic::Beta::BetaBrowserLeftClickToolUseBlock }

        variant :right_click, -> { Anthropic::Beta::BetaBrowserRightClickToolUseBlock }

        variant :middle_click, -> { Anthropic::Beta::BetaBrowserMiddleClickToolUseBlock }

        variant :double_click, -> { Anthropic::Beta::BetaBrowserDoubleClickToolUseBlock }

        variant :triple_click, -> { Anthropic::Beta::BetaBrowserTripleClickToolUseBlock }

        variant :hover, -> { Anthropic::Beta::BetaBrowserHoverToolUseBlock }

        variant :left_click_drag, -> { Anthropic::Beta::BetaBrowserLeftClickDragToolUseBlock }

        variant :left_mouse_down, -> { Anthropic::Beta::BetaBrowserLeftMouseDownToolUseBlock }

        variant :left_mouse_up, -> { Anthropic::Beta::BetaBrowserLeftMouseUpToolUseBlock }

        variant :mouse_move, -> { Anthropic::Beta::BetaBrowserMouseMoveToolUseBlock }

        variant :scroll, -> { Anthropic::Beta::BetaBrowserScrollToolUseBlock }

        variant :type, -> { Anthropic::Beta::BetaBrowserTypeToolUseBlock }

        variant :key, -> { Anthropic::Beta::BetaBrowserKeyToolUseBlock }

        variant :hold_key, -> { Anthropic::Beta::BetaBrowserHoldKeyToolUseBlock }

        variant :wait, -> { Anthropic::Beta::BetaBrowserWaitToolUseBlock }

        variant :javascript_exec, -> { Anthropic::Beta::BetaBrowserJavascriptExecToolUseBlock }

        module Name
          extend Anthropic::Internal::Type::Enum

          NAVIGATE = :navigate
          LIST_TABS = :list_tabs
          NEW_TAB = :new_tab
          SWITCH_TAB = :switch_tab
          CLOSE_TAB = :close_tab
          READ_PAGE = :read_page
          GET_PAGE_TEXT = :get_page_text
          READ_CONSOLE = :read_console
          READ_NETWORK = :read_network
          FIND = :find
          FORM_INPUT = :form_input
          FILE_UPLOAD = :file_upload
          SCROLL_TO = :scroll_to
          SCREENSHOT = :screenshot
          ZOOM = :zoom
          LEFT_CLICK = :left_click
          RIGHT_CLICK = :right_click
          MIDDLE_CLICK = :middle_click
          DOUBLE_CLICK = :double_click
          TRIPLE_CLICK = :triple_click
          HOVER = :hover
          LEFT_CLICK_DRAG = :left_click_drag
          LEFT_MOUSE_DOWN = :left_mouse_down
          LEFT_MOUSE_UP = :left_mouse_up
          MOUSE_MOVE = :mouse_move
          SCROLL = :scroll
          TYPE = :type
          KEY = :key
          HOLD_KEY = :hold_key
          WAIT = :wait
          JAVASCRIPT_EXEC = :javascript_exec

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaBrowserNavigateToolUseBlock, Anthropic::Models::Beta::BetaBrowserListTabsToolUseBlock, Anthropic::Models::Beta::BetaBrowserNewTabToolUseBlock, Anthropic::Models::Beta::BetaBrowserSwitchTabToolUseBlock, Anthropic::Models::Beta::BetaBrowserCloseTabToolUseBlock, Anthropic::Models::Beta::BetaBrowserReadPageToolUseBlock, Anthropic::Models::Beta::BetaBrowserGetPageTextToolUseBlock, Anthropic::Models::Beta::BetaBrowserReadConsoleToolUseBlock, Anthropic::Models::Beta::BetaBrowserReadNetworkToolUseBlock, Anthropic::Models::Beta::BetaBrowserFindToolUseBlock, Anthropic::Models::Beta::BetaBrowserFormInputToolUseBlock, Anthropic::Models::Beta::BetaBrowserFileUploadToolUseBlock, Anthropic::Models::Beta::BetaBrowserScrollToToolUseBlock, Anthropic::Models::Beta::BetaBrowserScreenshotToolUseBlock, Anthropic::Models::Beta::BetaBrowserZoomToolUseBlock, Anthropic::Models::Beta::BetaBrowserLeftClickToolUseBlock, Anthropic::Models::Beta::BetaBrowserRightClickToolUseBlock, Anthropic::Models::Beta::BetaBrowserMiddleClickToolUseBlock, Anthropic::Models::Beta::BetaBrowserDoubleClickToolUseBlock, Anthropic::Models::Beta::BetaBrowserTripleClickToolUseBlock, Anthropic::Models::Beta::BetaBrowserHoverToolUseBlock, Anthropic::Models::Beta::BetaBrowserLeftClickDragToolUseBlock, Anthropic::Models::Beta::BetaBrowserLeftMouseDownToolUseBlock, Anthropic::Models::Beta::BetaBrowserLeftMouseUpToolUseBlock, Anthropic::Models::Beta::BetaBrowserMouseMoveToolUseBlock, Anthropic::Models::Beta::BetaBrowserScrollToolUseBlock, Anthropic::Models::Beta::BetaBrowserTypeToolUseBlock, Anthropic::Models::Beta::BetaBrowserKeyToolUseBlock, Anthropic::Models::Beta::BetaBrowserHoldKeyToolUseBlock, Anthropic::Models::Beta::BetaBrowserWaitToolUseBlock, Anthropic::Models::Beta::BetaBrowserJavascriptExecToolUseBlock)]

        # Creates a new instance of the variant class whose `name` matches the given
        # value, passing the remaining arguments to its constructor.
        #
        # Some parameter documentations has been truncated, see
        # {Anthropic::Models::Beta::BetaBrowserToolUseBlock} for more details.
        #
        # @param name [Symbol, Anthropic::Models::Beta::BetaBrowserToolUseBlock::Name, String]
        #
        # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
        #
        #   @option args [String] :id
        #
        #   @option args [Anthropic::Models::Beta::BetaBrowserNavigateInput, Anthropic::Models::Beta::BetaBrowserListTabsInput, Anthropic::Models::Beta::BetaBrowserNewTabInput, Anthropic::Models::Beta::BetaBrowserSwitchTabInput, Anthropic::Models::Beta::BetaBrowserCloseTabInput, Anthropic::Models::Beta::BetaBrowserReadPageInput, Anthropic::Models::Beta::BetaBrowserGetPageTextInput, Anthropic::Models::Beta::BetaBrowserReadConsoleInput, Anthropic::Models::Beta::BetaBrowserReadNetworkInput, Anthropic::Models::Beta::BetaBrowserFindInput, Anthropic::Models::Beta::BetaBrowserFormInputInput, Anthropic::Models::Beta::BetaBrowserFileUploadInput, Anthropic::Models::Beta::BetaBrowserScrollToInput, Anthropic::Models::Beta::BetaBrowserScreenshotInput, Anthropic::Models::Beta::BetaBrowserZoomInput, Anthropic::Models::Beta::BetaBrowserLeftClickInput, Anthropic::Models::Beta::BetaBrowserRightClickInput, Anthropic::Models::Beta::BetaBrowserMiddleClickInput, Anthropic::Models::Beta::BetaBrowserDoubleClickInput, Anthropic::Models::Beta::BetaBrowserTripleClickInput, Anthropic::Models::Beta::BetaBrowserHoverInput, Anthropic::Models::Beta::BetaBrowserLeftClickDragInput, Anthropic::Models::Beta::BetaBrowserLeftMouseDownInput, Anthropic::Models::Beta::BetaBrowserLeftMouseUpInput, Anthropic::Models::Beta::BetaBrowserMouseMoveInput, Anthropic::Models::Beta::BetaBrowserScrollInput, Anthropic::Models::Beta::BetaBrowserTypeInput, Anthropic::Models::Beta::BetaBrowserKeyInput, Anthropic::Models::Beta::BetaBrowserHoldKeyInput, Anthropic::Models::Beta::BetaBrowserWaitInput, Anthropic::Models::Beta::BetaBrowserJavascriptExecInput] :input Navigate to a URL, or go back/forward/reload in history. The protocol may be
        #
        #   @option args [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] :caller_ Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @option args [Symbol, :browser] :toolset_name
        #
        #   @option args [Symbol, :tool_use] :type
        #
        # @raise [ArgumentError]
        # @return [Anthropic::Models::Beta::BetaBrowserNavigateToolUseBlock, Anthropic::Models::Beta::BetaBrowserListTabsToolUseBlock, Anthropic::Models::Beta::BetaBrowserNewTabToolUseBlock, Anthropic::Models::Beta::BetaBrowserSwitchTabToolUseBlock, Anthropic::Models::Beta::BetaBrowserCloseTabToolUseBlock, Anthropic::Models::Beta::BetaBrowserReadPageToolUseBlock, Anthropic::Models::Beta::BetaBrowserGetPageTextToolUseBlock, Anthropic::Models::Beta::BetaBrowserReadConsoleToolUseBlock, Anthropic::Models::Beta::BetaBrowserReadNetworkToolUseBlock, Anthropic::Models::Beta::BetaBrowserFindToolUseBlock, Anthropic::Models::Beta::BetaBrowserFormInputToolUseBlock, Anthropic::Models::Beta::BetaBrowserFileUploadToolUseBlock, Anthropic::Models::Beta::BetaBrowserScrollToToolUseBlock, Anthropic::Models::Beta::BetaBrowserScreenshotToolUseBlock, Anthropic::Models::Beta::BetaBrowserZoomToolUseBlock, Anthropic::Models::Beta::BetaBrowserLeftClickToolUseBlock, Anthropic::Models::Beta::BetaBrowserRightClickToolUseBlock, Anthropic::Models::Beta::BetaBrowserMiddleClickToolUseBlock, Anthropic::Models::Beta::BetaBrowserDoubleClickToolUseBlock, Anthropic::Models::Beta::BetaBrowserTripleClickToolUseBlock, Anthropic::Models::Beta::BetaBrowserHoverToolUseBlock, Anthropic::Models::Beta::BetaBrowserLeftClickDragToolUseBlock, Anthropic::Models::Beta::BetaBrowserLeftMouseDownToolUseBlock, Anthropic::Models::Beta::BetaBrowserLeftMouseUpToolUseBlock, Anthropic::Models::Beta::BetaBrowserMouseMoveToolUseBlock, Anthropic::Models::Beta::BetaBrowserScrollToolUseBlock, Anthropic::Models::Beta::BetaBrowserTypeToolUseBlock, Anthropic::Models::Beta::BetaBrowserKeyToolUseBlock, Anthropic::Models::Beta::BetaBrowserHoldKeyToolUseBlock, Anthropic::Models::Beta::BetaBrowserWaitToolUseBlock, Anthropic::Models::Beta::BetaBrowserJavascriptExecToolUseBlock]
        def self.new(name:, **args)
          case name.to_sym
          when :navigate
            Anthropic::Beta::BetaBrowserNavigateToolUseBlock.new(**args)
          when :list_tabs
            Anthropic::Beta::BetaBrowserListTabsToolUseBlock.new(**args)
          when :new_tab
            Anthropic::Beta::BetaBrowserNewTabToolUseBlock.new(**args)
          when :switch_tab
            Anthropic::Beta::BetaBrowserSwitchTabToolUseBlock.new(**args)
          when :close_tab
            Anthropic::Beta::BetaBrowserCloseTabToolUseBlock.new(**args)
          when :read_page
            Anthropic::Beta::BetaBrowserReadPageToolUseBlock.new(**args)
          when :get_page_text
            Anthropic::Beta::BetaBrowserGetPageTextToolUseBlock.new(**args)
          when :read_console
            Anthropic::Beta::BetaBrowserReadConsoleToolUseBlock.new(**args)
          when :read_network
            Anthropic::Beta::BetaBrowserReadNetworkToolUseBlock.new(**args)
          when :find
            Anthropic::Beta::BetaBrowserFindToolUseBlock.new(**args)
          when :form_input
            Anthropic::Beta::BetaBrowserFormInputToolUseBlock.new(**args)
          when :file_upload
            Anthropic::Beta::BetaBrowserFileUploadToolUseBlock.new(**args)
          when :scroll_to
            Anthropic::Beta::BetaBrowserScrollToToolUseBlock.new(**args)
          when :screenshot
            Anthropic::Beta::BetaBrowserScreenshotToolUseBlock.new(**args)
          when :zoom
            Anthropic::Beta::BetaBrowserZoomToolUseBlock.new(**args)
          when :left_click
            Anthropic::Beta::BetaBrowserLeftClickToolUseBlock.new(**args)
          when :right_click
            Anthropic::Beta::BetaBrowserRightClickToolUseBlock.new(**args)
          when :middle_click
            Anthropic::Beta::BetaBrowserMiddleClickToolUseBlock.new(**args)
          when :double_click
            Anthropic::Beta::BetaBrowserDoubleClickToolUseBlock.new(**args)
          when :triple_click
            Anthropic::Beta::BetaBrowserTripleClickToolUseBlock.new(**args)
          when :hover
            Anthropic::Beta::BetaBrowserHoverToolUseBlock.new(**args)
          when :left_click_drag
            Anthropic::Beta::BetaBrowserLeftClickDragToolUseBlock.new(**args)
          when :left_mouse_down
            Anthropic::Beta::BetaBrowserLeftMouseDownToolUseBlock.new(**args)
          when :left_mouse_up
            Anthropic::Beta::BetaBrowserLeftMouseUpToolUseBlock.new(**args)
          when :mouse_move
            Anthropic::Beta::BetaBrowserMouseMoveToolUseBlock.new(**args)
          when :scroll
            Anthropic::Beta::BetaBrowserScrollToolUseBlock.new(**args)
          when :type
            Anthropic::Beta::BetaBrowserTypeToolUseBlock.new(**args)
          when :key
            Anthropic::Beta::BetaBrowserKeyToolUseBlock.new(**args)
          when :hold_key
            Anthropic::Beta::BetaBrowserHoldKeyToolUseBlock.new(**args)
          when :wait
            Anthropic::Beta::BetaBrowserWaitToolUseBlock.new(**args)
          when :javascript_exec
            Anthropic::Beta::BetaBrowserJavascriptExecToolUseBlock.new(**args)
          else
            raise ArgumentError, "unknown name: #{name}"
          end
        end
      end
    end

    BetaBrowserToolUseBlock = Beta::BetaBrowserToolUseBlock
  end
end
