# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserToolsetConfigs < Anthropic::Internal::Type::BaseModel
        # @!attribute close_tab
        #   `close_tab`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserCloseTabConfig, nil]
        optional :close_tab, -> { Anthropic::Beta::BetaBrowserCloseTabConfig }, nil?: true

        # @!attribute double_click
        #   `double_click`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserDoubleClickConfig, nil]
        optional :double_click, -> { Anthropic::Beta::BetaBrowserDoubleClickConfig }, nil?: true

        # @!attribute file_upload
        #   `file_upload`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserFileUploadConfig, nil]
        optional :file_upload, -> { Anthropic::Beta::BetaBrowserFileUploadConfig }, nil?: true

        # @!attribute find
        #   `find`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserFindConfig, nil]
        optional :find, -> { Anthropic::Beta::BetaBrowserFindConfig }, nil?: true

        # @!attribute form_input
        #   `form_input`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserFormInputConfig, nil]
        optional :form_input, -> { Anthropic::Beta::BetaBrowserFormInputConfig }, nil?: true

        # @!attribute get_page_text
        #   `get_page_text`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserGetPageTextConfig, nil]
        optional :get_page_text, -> { Anthropic::Beta::BetaBrowserGetPageTextConfig }, nil?: true

        # @!attribute hold_key
        #   `hold_key`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserHoldKeyConfig, nil]
        optional :hold_key, -> { Anthropic::Beta::BetaBrowserHoldKeyConfig }, nil?: true

        # @!attribute hover
        #   `hover`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserHoverConfig, nil]
        optional :hover, -> { Anthropic::Beta::BetaBrowserHoverConfig }, nil?: true

        # @!attribute javascript_exec
        #   `javascript_exec`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserJavascriptExecConfig, nil]
        optional :javascript_exec, -> { Anthropic::Beta::BetaBrowserJavascriptExecConfig }, nil?: true

        # @!attribute key
        #   `key`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserKeyConfig, nil]
        optional :key, -> { Anthropic::Beta::BetaBrowserKeyConfig }, nil?: true

        # @!attribute left_click
        #   `left_click`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserLeftClickConfig, nil]
        optional :left_click, -> { Anthropic::Beta::BetaBrowserLeftClickConfig }, nil?: true

        # @!attribute left_click_drag
        #   `left_click_drag`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserLeftClickDragConfig, nil]
        optional :left_click_drag, -> { Anthropic::Beta::BetaBrowserLeftClickDragConfig }, nil?: true

        # @!attribute left_mouse_down
        #   `left_mouse_down`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserLeftMouseDownConfig, nil]
        optional :left_mouse_down, -> { Anthropic::Beta::BetaBrowserLeftMouseDownConfig }, nil?: true

        # @!attribute left_mouse_up
        #   `left_mouse_up`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserLeftMouseUpConfig, nil]
        optional :left_mouse_up, -> { Anthropic::Beta::BetaBrowserLeftMouseUpConfig }, nil?: true

        # @!attribute list_tabs
        #   `list_tabs`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserListTabsConfig, nil]
        optional :list_tabs, -> { Anthropic::Beta::BetaBrowserListTabsConfig }, nil?: true

        # @!attribute middle_click
        #   `middle_click`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserMiddleClickConfig, nil]
        optional :middle_click, -> { Anthropic::Beta::BetaBrowserMiddleClickConfig }, nil?: true

        # @!attribute mouse_move
        #   `mouse_move`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserMouseMoveConfig, nil]
        optional :mouse_move, -> { Anthropic::Beta::BetaBrowserMouseMoveConfig }, nil?: true

        # @!attribute navigate
        #   `navigate`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserNavigateConfig, nil]
        optional :navigate, -> { Anthropic::Beta::BetaBrowserNavigateConfig }, nil?: true

        # @!attribute new_tab
        #   `new_tab`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserNewTabConfig, nil]
        optional :new_tab, -> { Anthropic::Beta::BetaBrowserNewTabConfig }, nil?: true

        # @!attribute read_console
        #   `read_console`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserReadConsoleConfig, nil]
        optional :read_console, -> { Anthropic::Beta::BetaBrowserReadConsoleConfig }, nil?: true

        # @!attribute read_network
        #   `read_network`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserReadNetworkConfig, nil]
        optional :read_network, -> { Anthropic::Beta::BetaBrowserReadNetworkConfig }, nil?: true

        # @!attribute read_page
        #   `read_page`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserReadPageConfig, nil]
        optional :read_page, -> { Anthropic::Beta::BetaBrowserReadPageConfig }, nil?: true

        # @!attribute right_click
        #   `right_click`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserRightClickConfig, nil]
        optional :right_click, -> { Anthropic::Beta::BetaBrowserRightClickConfig }, nil?: true

        # @!attribute screenshot
        #   `screenshot`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserScreenshotConfig, nil]
        optional :screenshot, -> { Anthropic::Beta::BetaBrowserScreenshotConfig }, nil?: true

        # @!attribute scroll
        #   `scroll`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserScrollConfig, nil]
        optional :scroll, -> { Anthropic::Beta::BetaBrowserScrollConfig }, nil?: true

        # @!attribute scroll_to
        #   `scroll_to`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserScrollToConfig, nil]
        optional :scroll_to, -> { Anthropic::Beta::BetaBrowserScrollToConfig }, nil?: true

        # @!attribute switch_tab
        #   `switch_tab`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserSwitchTabConfig, nil]
        optional :switch_tab, -> { Anthropic::Beta::BetaBrowserSwitchTabConfig }, nil?: true

        # @!attribute triple_click
        #   `triple_click`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserTripleClickConfig, nil]
        optional :triple_click, -> { Anthropic::Beta::BetaBrowserTripleClickConfig }, nil?: true

        # @!attribute type
        #   `type`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserTypeConfig, nil]
        optional :type, -> { Anthropic::Beta::BetaBrowserTypeConfig }, nil?: true

        # @!attribute wait
        #   `wait`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserWaitConfig, nil]
        optional :wait, -> { Anthropic::Beta::BetaBrowserWaitConfig }, nil?: true

        # @!attribute zoom
        #   `zoom`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserZoomConfig, nil]
        optional :zoom, -> { Anthropic::Beta::BetaBrowserZoomConfig }, nil?: true

        # @!method initialize(close_tab: nil, double_click: nil, file_upload: nil, find: nil, form_input: nil, get_page_text: nil, hold_key: nil, hover: nil, javascript_exec: nil, key: nil, left_click: nil, left_click_drag: nil, left_mouse_down: nil, left_mouse_up: nil, list_tabs: nil, middle_click: nil, mouse_move: nil, navigate: nil, new_tab: nil, read_console: nil, read_network: nil, read_page: nil, right_click: nil, screenshot: nil, scroll: nil, scroll_to: nil, switch_tab: nil, triple_click: nil, type: nil, wait: nil, zoom: nil)
        #   Per-member configuration for `browser_toolset_20260801`: one optional field per
        #   member tool, keyed by the member name — the same name the member's `tool_use`
        #   blocks carry. Every member is an accepted key, and a member's defaults apply
        #   wherever its key is absent. Unknown keys are rejected: the field set is this
        #   toolset version's complete member set.
        #
        #   @param close_tab [Anthropic::Models::Beta::BetaBrowserCloseTabConfig, nil] `close_tab`'s config overrides.
        #
        #   @param double_click [Anthropic::Models::Beta::BetaBrowserDoubleClickConfig, nil] `double_click`'s config overrides.
        #
        #   @param file_upload [Anthropic::Models::Beta::BetaBrowserFileUploadConfig, nil] `file_upload`'s config overrides.
        #
        #   @param find [Anthropic::Models::Beta::BetaBrowserFindConfig, nil] `find`'s config overrides.
        #
        #   @param form_input [Anthropic::Models::Beta::BetaBrowserFormInputConfig, nil] `form_input`'s config overrides.
        #
        #   @param get_page_text [Anthropic::Models::Beta::BetaBrowserGetPageTextConfig, nil] `get_page_text`'s config overrides.
        #
        #   @param hold_key [Anthropic::Models::Beta::BetaBrowserHoldKeyConfig, nil] `hold_key`'s config overrides.
        #
        #   @param hover [Anthropic::Models::Beta::BetaBrowserHoverConfig, nil] `hover`'s config overrides.
        #
        #   @param javascript_exec [Anthropic::Models::Beta::BetaBrowserJavascriptExecConfig, nil] `javascript_exec`'s config overrides.
        #
        #   @param key [Anthropic::Models::Beta::BetaBrowserKeyConfig, nil] `key`'s config overrides.
        #
        #   @param left_click [Anthropic::Models::Beta::BetaBrowserLeftClickConfig, nil] `left_click`'s config overrides.
        #
        #   @param left_click_drag [Anthropic::Models::Beta::BetaBrowserLeftClickDragConfig, nil] `left_click_drag`'s config overrides.
        #
        #   @param left_mouse_down [Anthropic::Models::Beta::BetaBrowserLeftMouseDownConfig, nil] `left_mouse_down`'s config overrides.
        #
        #   @param left_mouse_up [Anthropic::Models::Beta::BetaBrowserLeftMouseUpConfig, nil] `left_mouse_up`'s config overrides.
        #
        #   @param list_tabs [Anthropic::Models::Beta::BetaBrowserListTabsConfig, nil] `list_tabs`'s config overrides.
        #
        #   @param middle_click [Anthropic::Models::Beta::BetaBrowserMiddleClickConfig, nil] `middle_click`'s config overrides.
        #
        #   @param mouse_move [Anthropic::Models::Beta::BetaBrowserMouseMoveConfig, nil] `mouse_move`'s config overrides.
        #
        #   @param navigate [Anthropic::Models::Beta::BetaBrowserNavigateConfig, nil] `navigate`'s config overrides.
        #
        #   @param new_tab [Anthropic::Models::Beta::BetaBrowserNewTabConfig, nil] `new_tab`'s config overrides.
        #
        #   @param read_console [Anthropic::Models::Beta::BetaBrowserReadConsoleConfig, nil] `read_console`'s config overrides.
        #
        #   @param read_network [Anthropic::Models::Beta::BetaBrowserReadNetworkConfig, nil] `read_network`'s config overrides.
        #
        #   @param read_page [Anthropic::Models::Beta::BetaBrowserReadPageConfig, nil] `read_page`'s config overrides.
        #
        #   @param right_click [Anthropic::Models::Beta::BetaBrowserRightClickConfig, nil] `right_click`'s config overrides.
        #
        #   @param screenshot [Anthropic::Models::Beta::BetaBrowserScreenshotConfig, nil] `screenshot`'s config overrides.
        #
        #   @param scroll [Anthropic::Models::Beta::BetaBrowserScrollConfig, nil] `scroll`'s config overrides.
        #
        #   @param scroll_to [Anthropic::Models::Beta::BetaBrowserScrollToConfig, nil] `scroll_to`'s config overrides.
        #
        #   @param switch_tab [Anthropic::Models::Beta::BetaBrowserSwitchTabConfig, nil] `switch_tab`'s config overrides.
        #
        #   @param triple_click [Anthropic::Models::Beta::BetaBrowserTripleClickConfig, nil] `triple_click`'s config overrides.
        #
        #   @param type [Anthropic::Models::Beta::BetaBrowserTypeConfig, nil] `type`'s config overrides.
        #
        #   @param wait [Anthropic::Models::Beta::BetaBrowserWaitConfig, nil] `wait`'s config overrides.
        #
        #   @param zoom [Anthropic::Models::Beta::BetaBrowserZoomConfig, nil] `zoom`'s config overrides.
      end
    end

    BetaBrowserToolsetConfigs = Beta::BetaBrowserToolsetConfigs
  end
end
