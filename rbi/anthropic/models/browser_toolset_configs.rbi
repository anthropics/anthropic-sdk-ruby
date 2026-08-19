# typed: strong

module Anthropic
  module Models
    class BrowserToolsetConfigs < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::BrowserToolsetConfigs, Anthropic::Internal::AnyHash)
        end

      # `close_tab`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserCloseTabConfig)) }
      attr_reader :close_tab

      sig do
        params(
          close_tab: T.nilable(Anthropic::BrowserCloseTabConfig::OrHash)
        ).void
      end
      attr_writer :close_tab

      # `double_click`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserDoubleClickConfig)) }
      attr_reader :double_click

      sig do
        params(
          double_click: T.nilable(Anthropic::BrowserDoubleClickConfig::OrHash)
        ).void
      end
      attr_writer :double_click

      # `file_upload`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserFileUploadConfig)) }
      attr_reader :file_upload

      sig do
        params(
          file_upload: T.nilable(Anthropic::BrowserFileUploadConfig::OrHash)
        ).void
      end
      attr_writer :file_upload

      # `find`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserFindConfig)) }
      attr_reader :find

      sig { params(find: T.nilable(Anthropic::BrowserFindConfig::OrHash)).void }
      attr_writer :find

      # `form_input`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserFormInputConfig)) }
      attr_reader :form_input

      sig do
        params(
          form_input: T.nilable(Anthropic::BrowserFormInputConfig::OrHash)
        ).void
      end
      attr_writer :form_input

      # `get_page_text`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserGetPageTextConfig)) }
      attr_reader :get_page_text

      sig do
        params(
          get_page_text: T.nilable(Anthropic::BrowserGetPageTextConfig::OrHash)
        ).void
      end
      attr_writer :get_page_text

      # `hold_key`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserHoldKeyConfig)) }
      attr_reader :hold_key

      sig do
        params(
          hold_key: T.nilable(Anthropic::BrowserHoldKeyConfig::OrHash)
        ).void
      end
      attr_writer :hold_key

      # `hover`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserHoverConfig)) }
      attr_reader :hover

      sig do
        params(hover: T.nilable(Anthropic::BrowserHoverConfig::OrHash)).void
      end
      attr_writer :hover

      # `javascript_exec`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserJavascriptExecConfig)) }
      attr_reader :javascript_exec

      sig do
        params(
          javascript_exec:
            T.nilable(Anthropic::BrowserJavascriptExecConfig::OrHash)
        ).void
      end
      attr_writer :javascript_exec

      # `key`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserKeyConfig)) }
      attr_reader :key

      sig { params(key: T.nilable(Anthropic::BrowserKeyConfig::OrHash)).void }
      attr_writer :key

      # `left_click`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserLeftClickConfig)) }
      attr_reader :left_click

      sig do
        params(
          left_click: T.nilable(Anthropic::BrowserLeftClickConfig::OrHash)
        ).void
      end
      attr_writer :left_click

      # `left_click_drag`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserLeftClickDragConfig)) }
      attr_reader :left_click_drag

      sig do
        params(
          left_click_drag:
            T.nilable(Anthropic::BrowserLeftClickDragConfig::OrHash)
        ).void
      end
      attr_writer :left_click_drag

      # `left_mouse_down`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserLeftMouseDownConfig)) }
      attr_reader :left_mouse_down

      sig do
        params(
          left_mouse_down:
            T.nilable(Anthropic::BrowserLeftMouseDownConfig::OrHash)
        ).void
      end
      attr_writer :left_mouse_down

      # `left_mouse_up`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserLeftMouseUpConfig)) }
      attr_reader :left_mouse_up

      sig do
        params(
          left_mouse_up: T.nilable(Anthropic::BrowserLeftMouseUpConfig::OrHash)
        ).void
      end
      attr_writer :left_mouse_up

      # `list_tabs`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserListTabsConfig)) }
      attr_reader :list_tabs

      sig do
        params(
          list_tabs: T.nilable(Anthropic::BrowserListTabsConfig::OrHash)
        ).void
      end
      attr_writer :list_tabs

      # `middle_click`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserMiddleClickConfig)) }
      attr_reader :middle_click

      sig do
        params(
          middle_click: T.nilable(Anthropic::BrowserMiddleClickConfig::OrHash)
        ).void
      end
      attr_writer :middle_click

      # `mouse_move`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserMouseMoveConfig)) }
      attr_reader :mouse_move

      sig do
        params(
          mouse_move: T.nilable(Anthropic::BrowserMouseMoveConfig::OrHash)
        ).void
      end
      attr_writer :mouse_move

      # `navigate`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserNavigateConfig)) }
      attr_reader :navigate

      sig do
        params(
          navigate: T.nilable(Anthropic::BrowserNavigateConfig::OrHash)
        ).void
      end
      attr_writer :navigate

      # `new_tab`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserNewTabConfig)) }
      attr_reader :new_tab

      sig do
        params(new_tab: T.nilable(Anthropic::BrowserNewTabConfig::OrHash)).void
      end
      attr_writer :new_tab

      # `read_console`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserReadConsoleConfig)) }
      attr_reader :read_console

      sig do
        params(
          read_console: T.nilable(Anthropic::BrowserReadConsoleConfig::OrHash)
        ).void
      end
      attr_writer :read_console

      # `read_network`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserReadNetworkConfig)) }
      attr_reader :read_network

      sig do
        params(
          read_network: T.nilable(Anthropic::BrowserReadNetworkConfig::OrHash)
        ).void
      end
      attr_writer :read_network

      # `read_page`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserReadPageConfig)) }
      attr_reader :read_page

      sig do
        params(
          read_page: T.nilable(Anthropic::BrowserReadPageConfig::OrHash)
        ).void
      end
      attr_writer :read_page

      # `right_click`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserRightClickConfig)) }
      attr_reader :right_click

      sig do
        params(
          right_click: T.nilable(Anthropic::BrowserRightClickConfig::OrHash)
        ).void
      end
      attr_writer :right_click

      # `screenshot`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserScreenshotConfig)) }
      attr_reader :screenshot

      sig do
        params(
          screenshot: T.nilable(Anthropic::BrowserScreenshotConfig::OrHash)
        ).void
      end
      attr_writer :screenshot

      # `scroll`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserScrollConfig)) }
      attr_reader :scroll

      sig do
        params(scroll: T.nilable(Anthropic::BrowserScrollConfig::OrHash)).void
      end
      attr_writer :scroll

      # `scroll_to`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserScrollToConfig)) }
      attr_reader :scroll_to

      sig do
        params(
          scroll_to: T.nilable(Anthropic::BrowserScrollToConfig::OrHash)
        ).void
      end
      attr_writer :scroll_to

      # `switch_tab`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserSwitchTabConfig)) }
      attr_reader :switch_tab

      sig do
        params(
          switch_tab: T.nilable(Anthropic::BrowserSwitchTabConfig::OrHash)
        ).void
      end
      attr_writer :switch_tab

      # `triple_click`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserTripleClickConfig)) }
      attr_reader :triple_click

      sig do
        params(
          triple_click: T.nilable(Anthropic::BrowserTripleClickConfig::OrHash)
        ).void
      end
      attr_writer :triple_click

      # `type`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserTypeConfig)) }
      attr_reader :type

      sig { params(type: T.nilable(Anthropic::BrowserTypeConfig::OrHash)).void }
      attr_writer :type

      # `wait`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserWaitConfig)) }
      attr_reader :wait

      sig { params(wait: T.nilable(Anthropic::BrowserWaitConfig::OrHash)).void }
      attr_writer :wait

      # `zoom`'s config overrides.
      sig { returns(T.nilable(Anthropic::BrowserZoomConfig)) }
      attr_reader :zoom

      sig { params(zoom: T.nilable(Anthropic::BrowserZoomConfig::OrHash)).void }
      attr_writer :zoom

      # Per-member configuration for `browser_toolset_20260801`: one optional field per
      # member tool, keyed by the member name — the same name the member's `tool_use`
      # blocks carry. Every member is an accepted key, and a member's defaults apply
      # wherever its key is absent. Unknown keys are rejected: the field set is this
      # toolset version's complete member set.
      sig do
        params(
          close_tab: T.nilable(Anthropic::BrowserCloseTabConfig::OrHash),
          double_click: T.nilable(Anthropic::BrowserDoubleClickConfig::OrHash),
          file_upload: T.nilable(Anthropic::BrowserFileUploadConfig::OrHash),
          find: T.nilable(Anthropic::BrowserFindConfig::OrHash),
          form_input: T.nilable(Anthropic::BrowserFormInputConfig::OrHash),
          get_page_text: T.nilable(Anthropic::BrowserGetPageTextConfig::OrHash),
          hold_key: T.nilable(Anthropic::BrowserHoldKeyConfig::OrHash),
          hover: T.nilable(Anthropic::BrowserHoverConfig::OrHash),
          javascript_exec:
            T.nilable(Anthropic::BrowserJavascriptExecConfig::OrHash),
          key: T.nilable(Anthropic::BrowserKeyConfig::OrHash),
          left_click: T.nilable(Anthropic::BrowserLeftClickConfig::OrHash),
          left_click_drag:
            T.nilable(Anthropic::BrowserLeftClickDragConfig::OrHash),
          left_mouse_down:
            T.nilable(Anthropic::BrowserLeftMouseDownConfig::OrHash),
          left_mouse_up: T.nilable(Anthropic::BrowserLeftMouseUpConfig::OrHash),
          list_tabs: T.nilable(Anthropic::BrowserListTabsConfig::OrHash),
          middle_click: T.nilable(Anthropic::BrowserMiddleClickConfig::OrHash),
          mouse_move: T.nilable(Anthropic::BrowserMouseMoveConfig::OrHash),
          navigate: T.nilable(Anthropic::BrowserNavigateConfig::OrHash),
          new_tab: T.nilable(Anthropic::BrowserNewTabConfig::OrHash),
          read_console: T.nilable(Anthropic::BrowserReadConsoleConfig::OrHash),
          read_network: T.nilable(Anthropic::BrowserReadNetworkConfig::OrHash),
          read_page: T.nilable(Anthropic::BrowserReadPageConfig::OrHash),
          right_click: T.nilable(Anthropic::BrowserRightClickConfig::OrHash),
          screenshot: T.nilable(Anthropic::BrowserScreenshotConfig::OrHash),
          scroll: T.nilable(Anthropic::BrowserScrollConfig::OrHash),
          scroll_to: T.nilable(Anthropic::BrowserScrollToConfig::OrHash),
          switch_tab: T.nilable(Anthropic::BrowserSwitchTabConfig::OrHash),
          triple_click: T.nilable(Anthropic::BrowserTripleClickConfig::OrHash),
          type: T.nilable(Anthropic::BrowserTypeConfig::OrHash),
          wait: T.nilable(Anthropic::BrowserWaitConfig::OrHash),
          zoom: T.nilable(Anthropic::BrowserZoomConfig::OrHash)
        ).returns(T.attached_class)
      end
      def self.new(
        # `close_tab`'s config overrides.
        close_tab: nil,
        # `double_click`'s config overrides.
        double_click: nil,
        # `file_upload`'s config overrides.
        file_upload: nil,
        # `find`'s config overrides.
        find: nil,
        # `form_input`'s config overrides.
        form_input: nil,
        # `get_page_text`'s config overrides.
        get_page_text: nil,
        # `hold_key`'s config overrides.
        hold_key: nil,
        # `hover`'s config overrides.
        hover: nil,
        # `javascript_exec`'s config overrides.
        javascript_exec: nil,
        # `key`'s config overrides.
        key: nil,
        # `left_click`'s config overrides.
        left_click: nil,
        # `left_click_drag`'s config overrides.
        left_click_drag: nil,
        # `left_mouse_down`'s config overrides.
        left_mouse_down: nil,
        # `left_mouse_up`'s config overrides.
        left_mouse_up: nil,
        # `list_tabs`'s config overrides.
        list_tabs: nil,
        # `middle_click`'s config overrides.
        middle_click: nil,
        # `mouse_move`'s config overrides.
        mouse_move: nil,
        # `navigate`'s config overrides.
        navigate: nil,
        # `new_tab`'s config overrides.
        new_tab: nil,
        # `read_console`'s config overrides.
        read_console: nil,
        # `read_network`'s config overrides.
        read_network: nil,
        # `read_page`'s config overrides.
        read_page: nil,
        # `right_click`'s config overrides.
        right_click: nil,
        # `screenshot`'s config overrides.
        screenshot: nil,
        # `scroll`'s config overrides.
        scroll: nil,
        # `scroll_to`'s config overrides.
        scroll_to: nil,
        # `switch_tab`'s config overrides.
        switch_tab: nil,
        # `triple_click`'s config overrides.
        triple_click: nil,
        # `type`'s config overrides.
        type: nil,
        # `wait`'s config overrides.
        wait: nil,
        # `zoom`'s config overrides.
        zoom: nil
      )
      end

      sig do
        override.returns(
          {
            close_tab: T.nilable(Anthropic::BrowserCloseTabConfig),
            double_click: T.nilable(Anthropic::BrowserDoubleClickConfig),
            file_upload: T.nilable(Anthropic::BrowserFileUploadConfig),
            find: T.nilable(Anthropic::BrowserFindConfig),
            form_input: T.nilable(Anthropic::BrowserFormInputConfig),
            get_page_text: T.nilable(Anthropic::BrowserGetPageTextConfig),
            hold_key: T.nilable(Anthropic::BrowserHoldKeyConfig),
            hover: T.nilable(Anthropic::BrowserHoverConfig),
            javascript_exec: T.nilable(Anthropic::BrowserJavascriptExecConfig),
            key: T.nilable(Anthropic::BrowserKeyConfig),
            left_click: T.nilable(Anthropic::BrowserLeftClickConfig),
            left_click_drag: T.nilable(Anthropic::BrowserLeftClickDragConfig),
            left_mouse_down: T.nilable(Anthropic::BrowserLeftMouseDownConfig),
            left_mouse_up: T.nilable(Anthropic::BrowserLeftMouseUpConfig),
            list_tabs: T.nilable(Anthropic::BrowserListTabsConfig),
            middle_click: T.nilable(Anthropic::BrowserMiddleClickConfig),
            mouse_move: T.nilable(Anthropic::BrowserMouseMoveConfig),
            navigate: T.nilable(Anthropic::BrowserNavigateConfig),
            new_tab: T.nilable(Anthropic::BrowserNewTabConfig),
            read_console: T.nilable(Anthropic::BrowserReadConsoleConfig),
            read_network: T.nilable(Anthropic::BrowserReadNetworkConfig),
            read_page: T.nilable(Anthropic::BrowserReadPageConfig),
            right_click: T.nilable(Anthropic::BrowserRightClickConfig),
            screenshot: T.nilable(Anthropic::BrowserScreenshotConfig),
            scroll: T.nilable(Anthropic::BrowserScrollConfig),
            scroll_to: T.nilable(Anthropic::BrowserScrollToConfig),
            switch_tab: T.nilable(Anthropic::BrowserSwitchTabConfig),
            triple_click: T.nilable(Anthropic::BrowserTripleClickConfig),
            type: T.nilable(Anthropic::BrowserTypeConfig),
            wait: T.nilable(Anthropic::BrowserWaitConfig),
            zoom: T.nilable(Anthropic::BrowserZoomConfig)
          }
        )
      end
      def to_hash
      end
    end
  end
end
