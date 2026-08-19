# typed: strong

module Anthropic
  module Models
    BetaBrowserToolsetConfigs = Beta::BetaBrowserToolsetConfigs

    module Beta
      class BetaBrowserToolsetConfigs < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBrowserToolsetConfigs,
              Anthropic::Internal::AnyHash
            )
          end

        # `close_tab`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserCloseTabConfig)) }
        attr_reader :close_tab

        sig do
          params(
            close_tab:
              T.nilable(Anthropic::Beta::BetaBrowserCloseTabConfig::OrHash)
          ).void
        end
        attr_writer :close_tab

        # `double_click`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaBrowserDoubleClickConfig))
        end
        attr_reader :double_click

        sig do
          params(
            double_click:
              T.nilable(Anthropic::Beta::BetaBrowserDoubleClickConfig::OrHash)
          ).void
        end
        attr_writer :double_click

        # `file_upload`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserFileUploadConfig)) }
        attr_reader :file_upload

        sig do
          params(
            file_upload:
              T.nilable(Anthropic::Beta::BetaBrowserFileUploadConfig::OrHash)
          ).void
        end
        attr_writer :file_upload

        # `find`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserFindConfig)) }
        attr_reader :find

        sig do
          params(
            find: T.nilable(Anthropic::Beta::BetaBrowserFindConfig::OrHash)
          ).void
        end
        attr_writer :find

        # `form_input`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserFormInputConfig)) }
        attr_reader :form_input

        sig do
          params(
            form_input:
              T.nilable(Anthropic::Beta::BetaBrowserFormInputConfig::OrHash)
          ).void
        end
        attr_writer :form_input

        # `get_page_text`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaBrowserGetPageTextConfig))
        end
        attr_reader :get_page_text

        sig do
          params(
            get_page_text:
              T.nilable(Anthropic::Beta::BetaBrowserGetPageTextConfig::OrHash)
          ).void
        end
        attr_writer :get_page_text

        # `hold_key`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserHoldKeyConfig)) }
        attr_reader :hold_key

        sig do
          params(
            hold_key:
              T.nilable(Anthropic::Beta::BetaBrowserHoldKeyConfig::OrHash)
          ).void
        end
        attr_writer :hold_key

        # `hover`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserHoverConfig)) }
        attr_reader :hover

        sig do
          params(
            hover: T.nilable(Anthropic::Beta::BetaBrowserHoverConfig::OrHash)
          ).void
        end
        attr_writer :hover

        # `javascript_exec`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaBrowserJavascriptExecConfig))
        end
        attr_reader :javascript_exec

        sig do
          params(
            javascript_exec:
              T.nilable(
                Anthropic::Beta::BetaBrowserJavascriptExecConfig::OrHash
              )
          ).void
        end
        attr_writer :javascript_exec

        # `key`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserKeyConfig)) }
        attr_reader :key

        sig do
          params(
            key: T.nilable(Anthropic::Beta::BetaBrowserKeyConfig::OrHash)
          ).void
        end
        attr_writer :key

        # `left_click`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserLeftClickConfig)) }
        attr_reader :left_click

        sig do
          params(
            left_click:
              T.nilable(Anthropic::Beta::BetaBrowserLeftClickConfig::OrHash)
          ).void
        end
        attr_writer :left_click

        # `left_click_drag`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaBrowserLeftClickDragConfig))
        end
        attr_reader :left_click_drag

        sig do
          params(
            left_click_drag:
              T.nilable(Anthropic::Beta::BetaBrowserLeftClickDragConfig::OrHash)
          ).void
        end
        attr_writer :left_click_drag

        # `left_mouse_down`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaBrowserLeftMouseDownConfig))
        end
        attr_reader :left_mouse_down

        sig do
          params(
            left_mouse_down:
              T.nilable(Anthropic::Beta::BetaBrowserLeftMouseDownConfig::OrHash)
          ).void
        end
        attr_writer :left_mouse_down

        # `left_mouse_up`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaBrowserLeftMouseUpConfig))
        end
        attr_reader :left_mouse_up

        sig do
          params(
            left_mouse_up:
              T.nilable(Anthropic::Beta::BetaBrowserLeftMouseUpConfig::OrHash)
          ).void
        end
        attr_writer :left_mouse_up

        # `list_tabs`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserListTabsConfig)) }
        attr_reader :list_tabs

        sig do
          params(
            list_tabs:
              T.nilable(Anthropic::Beta::BetaBrowserListTabsConfig::OrHash)
          ).void
        end
        attr_writer :list_tabs

        # `middle_click`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaBrowserMiddleClickConfig))
        end
        attr_reader :middle_click

        sig do
          params(
            middle_click:
              T.nilable(Anthropic::Beta::BetaBrowserMiddleClickConfig::OrHash)
          ).void
        end
        attr_writer :middle_click

        # `mouse_move`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserMouseMoveConfig)) }
        attr_reader :mouse_move

        sig do
          params(
            mouse_move:
              T.nilable(Anthropic::Beta::BetaBrowserMouseMoveConfig::OrHash)
          ).void
        end
        attr_writer :mouse_move

        # `navigate`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserNavigateConfig)) }
        attr_reader :navigate

        sig do
          params(
            navigate:
              T.nilable(Anthropic::Beta::BetaBrowserNavigateConfig::OrHash)
          ).void
        end
        attr_writer :navigate

        # `new_tab`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserNewTabConfig)) }
        attr_reader :new_tab

        sig do
          params(
            new_tab: T.nilable(Anthropic::Beta::BetaBrowserNewTabConfig::OrHash)
          ).void
        end
        attr_writer :new_tab

        # `read_console`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaBrowserReadConsoleConfig))
        end
        attr_reader :read_console

        sig do
          params(
            read_console:
              T.nilable(Anthropic::Beta::BetaBrowserReadConsoleConfig::OrHash)
          ).void
        end
        attr_writer :read_console

        # `read_network`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaBrowserReadNetworkConfig))
        end
        attr_reader :read_network

        sig do
          params(
            read_network:
              T.nilable(Anthropic::Beta::BetaBrowserReadNetworkConfig::OrHash)
          ).void
        end
        attr_writer :read_network

        # `read_page`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserReadPageConfig)) }
        attr_reader :read_page

        sig do
          params(
            read_page:
              T.nilable(Anthropic::Beta::BetaBrowserReadPageConfig::OrHash)
          ).void
        end
        attr_writer :read_page

        # `right_click`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserRightClickConfig)) }
        attr_reader :right_click

        sig do
          params(
            right_click:
              T.nilable(Anthropic::Beta::BetaBrowserRightClickConfig::OrHash)
          ).void
        end
        attr_writer :right_click

        # `screenshot`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserScreenshotConfig)) }
        attr_reader :screenshot

        sig do
          params(
            screenshot:
              T.nilable(Anthropic::Beta::BetaBrowserScreenshotConfig::OrHash)
          ).void
        end
        attr_writer :screenshot

        # `scroll`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserScrollConfig)) }
        attr_reader :scroll

        sig do
          params(
            scroll: T.nilable(Anthropic::Beta::BetaBrowserScrollConfig::OrHash)
          ).void
        end
        attr_writer :scroll

        # `scroll_to`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserScrollToConfig)) }
        attr_reader :scroll_to

        sig do
          params(
            scroll_to:
              T.nilable(Anthropic::Beta::BetaBrowserScrollToConfig::OrHash)
          ).void
        end
        attr_writer :scroll_to

        # `switch_tab`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserSwitchTabConfig)) }
        attr_reader :switch_tab

        sig do
          params(
            switch_tab:
              T.nilable(Anthropic::Beta::BetaBrowserSwitchTabConfig::OrHash)
          ).void
        end
        attr_writer :switch_tab

        # `triple_click`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaBrowserTripleClickConfig))
        end
        attr_reader :triple_click

        sig do
          params(
            triple_click:
              T.nilable(Anthropic::Beta::BetaBrowserTripleClickConfig::OrHash)
          ).void
        end
        attr_writer :triple_click

        # `type`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserTypeConfig)) }
        attr_reader :type

        sig do
          params(
            type: T.nilable(Anthropic::Beta::BetaBrowserTypeConfig::OrHash)
          ).void
        end
        attr_writer :type

        # `wait`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserWaitConfig)) }
        attr_reader :wait

        sig do
          params(
            wait: T.nilable(Anthropic::Beta::BetaBrowserWaitConfig::OrHash)
          ).void
        end
        attr_writer :wait

        # `zoom`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaBrowserZoomConfig)) }
        attr_reader :zoom

        sig do
          params(
            zoom: T.nilable(Anthropic::Beta::BetaBrowserZoomConfig::OrHash)
          ).void
        end
        attr_writer :zoom

        # Per-member configuration for `browser_toolset_20260801`: one optional field per
        # member tool, keyed by the member name — the same name the member's `tool_use`
        # blocks carry. Every member is an accepted key, and a member's defaults apply
        # wherever its key is absent. Unknown keys are rejected: the field set is this
        # toolset version's complete member set.
        sig do
          params(
            close_tab:
              T.nilable(Anthropic::Beta::BetaBrowserCloseTabConfig::OrHash),
            double_click:
              T.nilable(Anthropic::Beta::BetaBrowserDoubleClickConfig::OrHash),
            file_upload:
              T.nilable(Anthropic::Beta::BetaBrowserFileUploadConfig::OrHash),
            find: T.nilable(Anthropic::Beta::BetaBrowserFindConfig::OrHash),
            form_input:
              T.nilable(Anthropic::Beta::BetaBrowserFormInputConfig::OrHash),
            get_page_text:
              T.nilable(Anthropic::Beta::BetaBrowserGetPageTextConfig::OrHash),
            hold_key:
              T.nilable(Anthropic::Beta::BetaBrowserHoldKeyConfig::OrHash),
            hover: T.nilable(Anthropic::Beta::BetaBrowserHoverConfig::OrHash),
            javascript_exec:
              T.nilable(
                Anthropic::Beta::BetaBrowserJavascriptExecConfig::OrHash
              ),
            key: T.nilable(Anthropic::Beta::BetaBrowserKeyConfig::OrHash),
            left_click:
              T.nilable(Anthropic::Beta::BetaBrowserLeftClickConfig::OrHash),
            left_click_drag:
              T.nilable(
                Anthropic::Beta::BetaBrowserLeftClickDragConfig::OrHash
              ),
            left_mouse_down:
              T.nilable(
                Anthropic::Beta::BetaBrowserLeftMouseDownConfig::OrHash
              ),
            left_mouse_up:
              T.nilable(Anthropic::Beta::BetaBrowserLeftMouseUpConfig::OrHash),
            list_tabs:
              T.nilable(Anthropic::Beta::BetaBrowserListTabsConfig::OrHash),
            middle_click:
              T.nilable(Anthropic::Beta::BetaBrowserMiddleClickConfig::OrHash),
            mouse_move:
              T.nilable(Anthropic::Beta::BetaBrowserMouseMoveConfig::OrHash),
            navigate:
              T.nilable(Anthropic::Beta::BetaBrowserNavigateConfig::OrHash),
            new_tab:
              T.nilable(Anthropic::Beta::BetaBrowserNewTabConfig::OrHash),
            read_console:
              T.nilable(Anthropic::Beta::BetaBrowserReadConsoleConfig::OrHash),
            read_network:
              T.nilable(Anthropic::Beta::BetaBrowserReadNetworkConfig::OrHash),
            read_page:
              T.nilable(Anthropic::Beta::BetaBrowserReadPageConfig::OrHash),
            right_click:
              T.nilable(Anthropic::Beta::BetaBrowserRightClickConfig::OrHash),
            screenshot:
              T.nilable(Anthropic::Beta::BetaBrowserScreenshotConfig::OrHash),
            scroll: T.nilable(Anthropic::Beta::BetaBrowserScrollConfig::OrHash),
            scroll_to:
              T.nilable(Anthropic::Beta::BetaBrowserScrollToConfig::OrHash),
            switch_tab:
              T.nilable(Anthropic::Beta::BetaBrowserSwitchTabConfig::OrHash),
            triple_click:
              T.nilable(Anthropic::Beta::BetaBrowserTripleClickConfig::OrHash),
            type: T.nilable(Anthropic::Beta::BetaBrowserTypeConfig::OrHash),
            wait: T.nilable(Anthropic::Beta::BetaBrowserWaitConfig::OrHash),
            zoom: T.nilable(Anthropic::Beta::BetaBrowserZoomConfig::OrHash)
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
              close_tab: T.nilable(Anthropic::Beta::BetaBrowserCloseTabConfig),
              double_click:
                T.nilable(Anthropic::Beta::BetaBrowserDoubleClickConfig),
              file_upload:
                T.nilable(Anthropic::Beta::BetaBrowserFileUploadConfig),
              find: T.nilable(Anthropic::Beta::BetaBrowserFindConfig),
              form_input:
                T.nilable(Anthropic::Beta::BetaBrowserFormInputConfig),
              get_page_text:
                T.nilable(Anthropic::Beta::BetaBrowserGetPageTextConfig),
              hold_key: T.nilable(Anthropic::Beta::BetaBrowserHoldKeyConfig),
              hover: T.nilable(Anthropic::Beta::BetaBrowserHoverConfig),
              javascript_exec:
                T.nilable(Anthropic::Beta::BetaBrowserJavascriptExecConfig),
              key: T.nilable(Anthropic::Beta::BetaBrowserKeyConfig),
              left_click:
                T.nilable(Anthropic::Beta::BetaBrowserLeftClickConfig),
              left_click_drag:
                T.nilable(Anthropic::Beta::BetaBrowserLeftClickDragConfig),
              left_mouse_down:
                T.nilable(Anthropic::Beta::BetaBrowserLeftMouseDownConfig),
              left_mouse_up:
                T.nilable(Anthropic::Beta::BetaBrowserLeftMouseUpConfig),
              list_tabs: T.nilable(Anthropic::Beta::BetaBrowserListTabsConfig),
              middle_click:
                T.nilable(Anthropic::Beta::BetaBrowserMiddleClickConfig),
              mouse_move:
                T.nilable(Anthropic::Beta::BetaBrowserMouseMoveConfig),
              navigate: T.nilable(Anthropic::Beta::BetaBrowserNavigateConfig),
              new_tab: T.nilable(Anthropic::Beta::BetaBrowserNewTabConfig),
              read_console:
                T.nilable(Anthropic::Beta::BetaBrowserReadConsoleConfig),
              read_network:
                T.nilable(Anthropic::Beta::BetaBrowserReadNetworkConfig),
              read_page: T.nilable(Anthropic::Beta::BetaBrowserReadPageConfig),
              right_click:
                T.nilable(Anthropic::Beta::BetaBrowserRightClickConfig),
              screenshot:
                T.nilable(Anthropic::Beta::BetaBrowserScreenshotConfig),
              scroll: T.nilable(Anthropic::Beta::BetaBrowserScrollConfig),
              scroll_to: T.nilable(Anthropic::Beta::BetaBrowserScrollToConfig),
              switch_tab:
                T.nilable(Anthropic::Beta::BetaBrowserSwitchTabConfig),
              triple_click:
                T.nilable(Anthropic::Beta::BetaBrowserTripleClickConfig),
              type: T.nilable(Anthropic::Beta::BetaBrowserTypeConfig),
              wait: T.nilable(Anthropic::Beta::BetaBrowserWaitConfig),
              zoom: T.nilable(Anthropic::Beta::BetaBrowserZoomConfig)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
