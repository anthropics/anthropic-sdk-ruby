# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserToolsetConfigs < Anthropic::Internal::Type::BaseModel
      # @!attribute close_tab
      #   `close_tab`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserCloseTabConfig, nil]
      optional :close_tab, -> { Anthropic::BrowserCloseTabConfig }, nil?: true

      # @!attribute double_click
      #   `double_click`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserDoubleClickConfig, nil]
      optional :double_click, -> { Anthropic::BrowserDoubleClickConfig }, nil?: true

      # @!attribute file_upload
      #   `file_upload`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserFileUploadConfig, nil]
      optional :file_upload, -> { Anthropic::BrowserFileUploadConfig }, nil?: true

      # @!attribute find
      #   `find`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserFindConfig, nil]
      optional :find, -> { Anthropic::BrowserFindConfig }, nil?: true

      # @!attribute form_input
      #   `form_input`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserFormInputConfig, nil]
      optional :form_input, -> { Anthropic::BrowserFormInputConfig }, nil?: true

      # @!attribute get_page_text
      #   `get_page_text`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserGetPageTextConfig, nil]
      optional :get_page_text, -> { Anthropic::BrowserGetPageTextConfig }, nil?: true

      # @!attribute hold_key
      #   `hold_key`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserHoldKeyConfig, nil]
      optional :hold_key, -> { Anthropic::BrowserHoldKeyConfig }, nil?: true

      # @!attribute hover
      #   `hover`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserHoverConfig, nil]
      optional :hover, -> { Anthropic::BrowserHoverConfig }, nil?: true

      # @!attribute javascript_exec
      #   `javascript_exec`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserJavascriptExecConfig, nil]
      optional :javascript_exec, -> { Anthropic::BrowserJavascriptExecConfig }, nil?: true

      # @!attribute key
      #   `key`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserKeyConfig, nil]
      optional :key, -> { Anthropic::BrowserKeyConfig }, nil?: true

      # @!attribute left_click
      #   `left_click`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserLeftClickConfig, nil]
      optional :left_click, -> { Anthropic::BrowserLeftClickConfig }, nil?: true

      # @!attribute left_click_drag
      #   `left_click_drag`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserLeftClickDragConfig, nil]
      optional :left_click_drag, -> { Anthropic::BrowserLeftClickDragConfig }, nil?: true

      # @!attribute left_mouse_down
      #   `left_mouse_down`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserLeftMouseDownConfig, nil]
      optional :left_mouse_down, -> { Anthropic::BrowserLeftMouseDownConfig }, nil?: true

      # @!attribute left_mouse_up
      #   `left_mouse_up`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserLeftMouseUpConfig, nil]
      optional :left_mouse_up, -> { Anthropic::BrowserLeftMouseUpConfig }, nil?: true

      # @!attribute list_tabs
      #   `list_tabs`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserListTabsConfig, nil]
      optional :list_tabs, -> { Anthropic::BrowserListTabsConfig }, nil?: true

      # @!attribute middle_click
      #   `middle_click`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserMiddleClickConfig, nil]
      optional :middle_click, -> { Anthropic::BrowserMiddleClickConfig }, nil?: true

      # @!attribute mouse_move
      #   `mouse_move`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserMouseMoveConfig, nil]
      optional :mouse_move, -> { Anthropic::BrowserMouseMoveConfig }, nil?: true

      # @!attribute navigate
      #   `navigate`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserNavigateConfig, nil]
      optional :navigate, -> { Anthropic::BrowserNavigateConfig }, nil?: true

      # @!attribute new_tab
      #   `new_tab`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserNewTabConfig, nil]
      optional :new_tab, -> { Anthropic::BrowserNewTabConfig }, nil?: true

      # @!attribute read_console
      #   `read_console`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserReadConsoleConfig, nil]
      optional :read_console, -> { Anthropic::BrowserReadConsoleConfig }, nil?: true

      # @!attribute read_network
      #   `read_network`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserReadNetworkConfig, nil]
      optional :read_network, -> { Anthropic::BrowserReadNetworkConfig }, nil?: true

      # @!attribute read_page
      #   `read_page`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserReadPageConfig, nil]
      optional :read_page, -> { Anthropic::BrowserReadPageConfig }, nil?: true

      # @!attribute right_click
      #   `right_click`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserRightClickConfig, nil]
      optional :right_click, -> { Anthropic::BrowserRightClickConfig }, nil?: true

      # @!attribute screenshot
      #   `screenshot`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserScreenshotConfig, nil]
      optional :screenshot, -> { Anthropic::BrowserScreenshotConfig }, nil?: true

      # @!attribute scroll
      #   `scroll`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserScrollConfig, nil]
      optional :scroll, -> { Anthropic::BrowserScrollConfig }, nil?: true

      # @!attribute scroll_to
      #   `scroll_to`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserScrollToConfig, nil]
      optional :scroll_to, -> { Anthropic::BrowserScrollToConfig }, nil?: true

      # @!attribute switch_tab
      #   `switch_tab`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserSwitchTabConfig, nil]
      optional :switch_tab, -> { Anthropic::BrowserSwitchTabConfig }, nil?: true

      # @!attribute triple_click
      #   `triple_click`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserTripleClickConfig, nil]
      optional :triple_click, -> { Anthropic::BrowserTripleClickConfig }, nil?: true

      # @!attribute type
      #   `type`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserTypeConfig, nil]
      optional :type, -> { Anthropic::BrowserTypeConfig }, nil?: true

      # @!attribute wait
      #   `wait`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserWaitConfig, nil]
      optional :wait, -> { Anthropic::BrowserWaitConfig }, nil?: true

      # @!attribute zoom
      #   `zoom`'s config overrides.
      #
      #   @return [Anthropic::Models::BrowserZoomConfig, nil]
      optional :zoom, -> { Anthropic::BrowserZoomConfig }, nil?: true

      # @!method initialize(close_tab: nil, double_click: nil, file_upload: nil, find: nil, form_input: nil, get_page_text: nil, hold_key: nil, hover: nil, javascript_exec: nil, key: nil, left_click: nil, left_click_drag: nil, left_mouse_down: nil, left_mouse_up: nil, list_tabs: nil, middle_click: nil, mouse_move: nil, navigate: nil, new_tab: nil, read_console: nil, read_network: nil, read_page: nil, right_click: nil, screenshot: nil, scroll: nil, scroll_to: nil, switch_tab: nil, triple_click: nil, type: nil, wait: nil, zoom: nil)
      #   Per-member configuration for `browser_toolset_20260801`: one optional field per
      #   member tool, keyed by the member name — the same name the member's `tool_use`
      #   blocks carry. Every member is an accepted key, and a member's defaults apply
      #   wherever its key is absent. Unknown keys are rejected: the field set is this
      #   toolset version's complete member set.
      #
      #   @param close_tab [Anthropic::Models::BrowserCloseTabConfig, nil] `close_tab`'s config overrides.
      #
      #   @param double_click [Anthropic::Models::BrowserDoubleClickConfig, nil] `double_click`'s config overrides.
      #
      #   @param file_upload [Anthropic::Models::BrowserFileUploadConfig, nil] `file_upload`'s config overrides.
      #
      #   @param find [Anthropic::Models::BrowserFindConfig, nil] `find`'s config overrides.
      #
      #   @param form_input [Anthropic::Models::BrowserFormInputConfig, nil] `form_input`'s config overrides.
      #
      #   @param get_page_text [Anthropic::Models::BrowserGetPageTextConfig, nil] `get_page_text`'s config overrides.
      #
      #   @param hold_key [Anthropic::Models::BrowserHoldKeyConfig, nil] `hold_key`'s config overrides.
      #
      #   @param hover [Anthropic::Models::BrowserHoverConfig, nil] `hover`'s config overrides.
      #
      #   @param javascript_exec [Anthropic::Models::BrowserJavascriptExecConfig, nil] `javascript_exec`'s config overrides.
      #
      #   @param key [Anthropic::Models::BrowserKeyConfig, nil] `key`'s config overrides.
      #
      #   @param left_click [Anthropic::Models::BrowserLeftClickConfig, nil] `left_click`'s config overrides.
      #
      #   @param left_click_drag [Anthropic::Models::BrowserLeftClickDragConfig, nil] `left_click_drag`'s config overrides.
      #
      #   @param left_mouse_down [Anthropic::Models::BrowserLeftMouseDownConfig, nil] `left_mouse_down`'s config overrides.
      #
      #   @param left_mouse_up [Anthropic::Models::BrowserLeftMouseUpConfig, nil] `left_mouse_up`'s config overrides.
      #
      #   @param list_tabs [Anthropic::Models::BrowserListTabsConfig, nil] `list_tabs`'s config overrides.
      #
      #   @param middle_click [Anthropic::Models::BrowserMiddleClickConfig, nil] `middle_click`'s config overrides.
      #
      #   @param mouse_move [Anthropic::Models::BrowserMouseMoveConfig, nil] `mouse_move`'s config overrides.
      #
      #   @param navigate [Anthropic::Models::BrowserNavigateConfig, nil] `navigate`'s config overrides.
      #
      #   @param new_tab [Anthropic::Models::BrowserNewTabConfig, nil] `new_tab`'s config overrides.
      #
      #   @param read_console [Anthropic::Models::BrowserReadConsoleConfig, nil] `read_console`'s config overrides.
      #
      #   @param read_network [Anthropic::Models::BrowserReadNetworkConfig, nil] `read_network`'s config overrides.
      #
      #   @param read_page [Anthropic::Models::BrowserReadPageConfig, nil] `read_page`'s config overrides.
      #
      #   @param right_click [Anthropic::Models::BrowserRightClickConfig, nil] `right_click`'s config overrides.
      #
      #   @param screenshot [Anthropic::Models::BrowserScreenshotConfig, nil] `screenshot`'s config overrides.
      #
      #   @param scroll [Anthropic::Models::BrowserScrollConfig, nil] `scroll`'s config overrides.
      #
      #   @param scroll_to [Anthropic::Models::BrowserScrollToConfig, nil] `scroll_to`'s config overrides.
      #
      #   @param switch_tab [Anthropic::Models::BrowserSwitchTabConfig, nil] `switch_tab`'s config overrides.
      #
      #   @param triple_click [Anthropic::Models::BrowserTripleClickConfig, nil] `triple_click`'s config overrides.
      #
      #   @param type [Anthropic::Models::BrowserTypeConfig, nil] `type`'s config overrides.
      #
      #   @param wait [Anthropic::Models::BrowserWaitConfig, nil] `wait`'s config overrides.
      #
      #   @param zoom [Anthropic::Models::BrowserZoomConfig, nil] `zoom`'s config overrides.
    end
  end
end
