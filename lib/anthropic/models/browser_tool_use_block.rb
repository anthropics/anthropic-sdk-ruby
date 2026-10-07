# frozen_string_literal: true

module Anthropic
  module Models
    module BrowserToolUseBlock
      extend Anthropic::Internal::Type::Union

      discriminator :name

      variant :navigate, -> { Anthropic::BrowserNavigateToolUseBlock }

      variant :list_tabs, -> { Anthropic::BrowserListTabsToolUseBlock }

      variant :new_tab, -> { Anthropic::BrowserNewTabToolUseBlock }

      variant :switch_tab, -> { Anthropic::BrowserSwitchTabToolUseBlock }

      variant :close_tab, -> { Anthropic::BrowserCloseTabToolUseBlock }

      variant :read_page, -> { Anthropic::BrowserReadPageToolUseBlock }

      variant :get_page_text, -> { Anthropic::BrowserGetPageTextToolUseBlock }

      variant :read_console, -> { Anthropic::BrowserReadConsoleToolUseBlock }

      variant :read_network, -> { Anthropic::BrowserReadNetworkToolUseBlock }

      variant :find, -> { Anthropic::BrowserFindToolUseBlock }

      variant :form_input, -> { Anthropic::BrowserFormInputToolUseBlock }

      variant :file_upload, -> { Anthropic::BrowserFileUploadToolUseBlock }

      variant :scroll_to, -> { Anthropic::BrowserScrollToToolUseBlock }

      variant :screenshot, -> { Anthropic::BrowserScreenshotToolUseBlock }

      variant :zoom, -> { Anthropic::BrowserZoomToolUseBlock }

      variant :left_click, -> { Anthropic::BrowserLeftClickToolUseBlock }

      variant :right_click, -> { Anthropic::BrowserRightClickToolUseBlock }

      variant :middle_click, -> { Anthropic::BrowserMiddleClickToolUseBlock }

      variant :double_click, -> { Anthropic::BrowserDoubleClickToolUseBlock }

      variant :triple_click, -> { Anthropic::BrowserTripleClickToolUseBlock }

      variant :hover, -> { Anthropic::BrowserHoverToolUseBlock }

      variant :left_click_drag, -> { Anthropic::BrowserLeftClickDragToolUseBlock }

      variant :left_mouse_down, -> { Anthropic::BrowserLeftMouseDownToolUseBlock }

      variant :left_mouse_up, -> { Anthropic::BrowserLeftMouseUpToolUseBlock }

      variant :mouse_move, -> { Anthropic::BrowserMouseMoveToolUseBlock }

      variant :scroll, -> { Anthropic::BrowserScrollToolUseBlock }

      variant :type, -> { Anthropic::BrowserTypeToolUseBlock }

      variant :key, -> { Anthropic::BrowserKeyToolUseBlock }

      variant :hold_key, -> { Anthropic::BrowserHoldKeyToolUseBlock }

      variant :wait, -> { Anthropic::BrowserWaitToolUseBlock }

      variant :javascript_exec, -> { Anthropic::BrowserJavascriptExecToolUseBlock }

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
      #   @return [Array(Anthropic::Models::BrowserNavigateToolUseBlock, Anthropic::Models::BrowserListTabsToolUseBlock, Anthropic::Models::BrowserNewTabToolUseBlock, Anthropic::Models::BrowserSwitchTabToolUseBlock, Anthropic::Models::BrowserCloseTabToolUseBlock, Anthropic::Models::BrowserReadPageToolUseBlock, Anthropic::Models::BrowserGetPageTextToolUseBlock, Anthropic::Models::BrowserReadConsoleToolUseBlock, Anthropic::Models::BrowserReadNetworkToolUseBlock, Anthropic::Models::BrowserFindToolUseBlock, Anthropic::Models::BrowserFormInputToolUseBlock, Anthropic::Models::BrowserFileUploadToolUseBlock, Anthropic::Models::BrowserScrollToToolUseBlock, Anthropic::Models::BrowserScreenshotToolUseBlock, Anthropic::Models::BrowserZoomToolUseBlock, Anthropic::Models::BrowserLeftClickToolUseBlock, Anthropic::Models::BrowserRightClickToolUseBlock, Anthropic::Models::BrowserMiddleClickToolUseBlock, Anthropic::Models::BrowserDoubleClickToolUseBlock, Anthropic::Models::BrowserTripleClickToolUseBlock, Anthropic::Models::BrowserHoverToolUseBlock, Anthropic::Models::BrowserLeftClickDragToolUseBlock, Anthropic::Models::BrowserLeftMouseDownToolUseBlock, Anthropic::Models::BrowserLeftMouseUpToolUseBlock, Anthropic::Models::BrowserMouseMoveToolUseBlock, Anthropic::Models::BrowserScrollToolUseBlock, Anthropic::Models::BrowserTypeToolUseBlock, Anthropic::Models::BrowserKeyToolUseBlock, Anthropic::Models::BrowserHoldKeyToolUseBlock, Anthropic::Models::BrowserWaitToolUseBlock, Anthropic::Models::BrowserJavascriptExecToolUseBlock)]

      # Creates a new instance of the variant class whose `name` matches the given
      # value, passing the remaining arguments to its constructor.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::BrowserToolUseBlock} for more details.
      #
      # @param name [Symbol, Anthropic::Models::BrowserToolUseBlock::Name, String]
      #
      # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
      #
      #   @option args [String] :id
      #
      #   @option args [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120] :caller_ Which party invoked the tool call: the model directly, or a server tool on its b
      #
      #   @option args [Anthropic::Models::BrowserNavigateInput, Anthropic::Models::BrowserListTabsInput, Anthropic::Models::BrowserNewTabInput, Anthropic::Models::BrowserSwitchTabInput, Anthropic::Models::BrowserCloseTabInput, Anthropic::Models::BrowserReadPageInput, Anthropic::Models::BrowserGetPageTextInput, Anthropic::Models::BrowserReadConsoleInput, Anthropic::Models::BrowserReadNetworkInput, Anthropic::Models::BrowserFindInput, Anthropic::Models::BrowserFormInputInput, Anthropic::Models::BrowserFileUploadInput, Anthropic::Models::BrowserScrollToInput, Anthropic::Models::BrowserScreenshotInput, Anthropic::Models::BrowserZoomInput, Anthropic::Models::BrowserLeftClickInput, Anthropic::Models::BrowserRightClickInput, Anthropic::Models::BrowserMiddleClickInput, Anthropic::Models::BrowserDoubleClickInput, Anthropic::Models::BrowserTripleClickInput, Anthropic::Models::BrowserHoverInput, Anthropic::Models::BrowserLeftClickDragInput, Anthropic::Models::BrowserLeftMouseDownInput, Anthropic::Models::BrowserLeftMouseUpInput, Anthropic::Models::BrowserMouseMoveInput, Anthropic::Models::BrowserScrollInput, Anthropic::Models::BrowserTypeInput, Anthropic::Models::BrowserKeyInput, Anthropic::Models::BrowserHoldKeyInput, Anthropic::Models::BrowserWaitInput, Anthropic::Models::BrowserJavascriptExecInput] :input Navigate to a URL, or go back/forward/reload in history. The protocol may be
      #
      #   @option args [Symbol, :browser] :toolset_name
      #
      #   @option args [Symbol, :tool_use] :type
      #
      # @raise [ArgumentError]
      # @return [Anthropic::Models::BrowserNavigateToolUseBlock, Anthropic::Models::BrowserListTabsToolUseBlock, Anthropic::Models::BrowserNewTabToolUseBlock, Anthropic::Models::BrowserSwitchTabToolUseBlock, Anthropic::Models::BrowserCloseTabToolUseBlock, Anthropic::Models::BrowserReadPageToolUseBlock, Anthropic::Models::BrowserGetPageTextToolUseBlock, Anthropic::Models::BrowserReadConsoleToolUseBlock, Anthropic::Models::BrowserReadNetworkToolUseBlock, Anthropic::Models::BrowserFindToolUseBlock, Anthropic::Models::BrowserFormInputToolUseBlock, Anthropic::Models::BrowserFileUploadToolUseBlock, Anthropic::Models::BrowserScrollToToolUseBlock, Anthropic::Models::BrowserScreenshotToolUseBlock, Anthropic::Models::BrowserZoomToolUseBlock, Anthropic::Models::BrowserLeftClickToolUseBlock, Anthropic::Models::BrowserRightClickToolUseBlock, Anthropic::Models::BrowserMiddleClickToolUseBlock, Anthropic::Models::BrowserDoubleClickToolUseBlock, Anthropic::Models::BrowserTripleClickToolUseBlock, Anthropic::Models::BrowserHoverToolUseBlock, Anthropic::Models::BrowserLeftClickDragToolUseBlock, Anthropic::Models::BrowserLeftMouseDownToolUseBlock, Anthropic::Models::BrowserLeftMouseUpToolUseBlock, Anthropic::Models::BrowserMouseMoveToolUseBlock, Anthropic::Models::BrowserScrollToolUseBlock, Anthropic::Models::BrowserTypeToolUseBlock, Anthropic::Models::BrowserKeyToolUseBlock, Anthropic::Models::BrowserHoldKeyToolUseBlock, Anthropic::Models::BrowserWaitToolUseBlock, Anthropic::Models::BrowserJavascriptExecToolUseBlock]
      def self.new(name:, **args)
        case name.to_sym
        when :navigate
          Anthropic::BrowserNavigateToolUseBlock.new(**args)
        when :list_tabs
          Anthropic::BrowserListTabsToolUseBlock.new(**args)
        when :new_tab
          Anthropic::BrowserNewTabToolUseBlock.new(**args)
        when :switch_tab
          Anthropic::BrowserSwitchTabToolUseBlock.new(**args)
        when :close_tab
          Anthropic::BrowserCloseTabToolUseBlock.new(**args)
        when :read_page
          Anthropic::BrowserReadPageToolUseBlock.new(**args)
        when :get_page_text
          Anthropic::BrowserGetPageTextToolUseBlock.new(**args)
        when :read_console
          Anthropic::BrowserReadConsoleToolUseBlock.new(**args)
        when :read_network
          Anthropic::BrowserReadNetworkToolUseBlock.new(**args)
        when :find
          Anthropic::BrowserFindToolUseBlock.new(**args)
        when :form_input
          Anthropic::BrowserFormInputToolUseBlock.new(**args)
        when :file_upload
          Anthropic::BrowserFileUploadToolUseBlock.new(**args)
        when :scroll_to
          Anthropic::BrowserScrollToToolUseBlock.new(**args)
        when :screenshot
          Anthropic::BrowserScreenshotToolUseBlock.new(**args)
        when :zoom
          Anthropic::BrowserZoomToolUseBlock.new(**args)
        when :left_click
          Anthropic::BrowserLeftClickToolUseBlock.new(**args)
        when :right_click
          Anthropic::BrowserRightClickToolUseBlock.new(**args)
        when :middle_click
          Anthropic::BrowserMiddleClickToolUseBlock.new(**args)
        when :double_click
          Anthropic::BrowserDoubleClickToolUseBlock.new(**args)
        when :triple_click
          Anthropic::BrowserTripleClickToolUseBlock.new(**args)
        when :hover
          Anthropic::BrowserHoverToolUseBlock.new(**args)
        when :left_click_drag
          Anthropic::BrowserLeftClickDragToolUseBlock.new(**args)
        when :left_mouse_down
          Anthropic::BrowserLeftMouseDownToolUseBlock.new(**args)
        when :left_mouse_up
          Anthropic::BrowserLeftMouseUpToolUseBlock.new(**args)
        when :mouse_move
          Anthropic::BrowserMouseMoveToolUseBlock.new(**args)
        when :scroll
          Anthropic::BrowserScrollToolUseBlock.new(**args)
        when :type
          Anthropic::BrowserTypeToolUseBlock.new(**args)
        when :key
          Anthropic::BrowserKeyToolUseBlock.new(**args)
        when :hold_key
          Anthropic::BrowserHoldKeyToolUseBlock.new(**args)
        when :wait
          Anthropic::BrowserWaitToolUseBlock.new(**args)
        when :javascript_exec
          Anthropic::BrowserJavascriptExecToolUseBlock.new(**args)
        else
          raise ArgumentError, "unknown name: #{name}"
        end
      end
    end
  end
end
