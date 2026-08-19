# typed: strong

module Anthropic
  module Models
    BetaComputerToolsetConfigs = Beta::BetaComputerToolsetConfigs

    module Beta
      class BetaComputerToolsetConfigs < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaComputerToolsetConfigs,
              Anthropic::Internal::AnyHash
            )
          end

        # `cursor_position`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaComputerCursorPositionConfig))
        end
        attr_reader :cursor_position

        sig do
          params(
            cursor_position:
              T.nilable(
                Anthropic::Beta::BetaComputerCursorPositionConfig::OrHash
              )
          ).void
        end
        attr_writer :cursor_position

        # `double_click`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaComputerDoubleClickConfig))
        end
        attr_reader :double_click

        sig do
          params(
            double_click:
              T.nilable(Anthropic::Beta::BetaComputerDoubleClickConfig::OrHash)
          ).void
        end
        attr_writer :double_click

        # `hold_key`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaComputerHoldKeyConfig)) }
        attr_reader :hold_key

        sig do
          params(
            hold_key:
              T.nilable(Anthropic::Beta::BetaComputerHoldKeyConfig::OrHash)
          ).void
        end
        attr_writer :hold_key

        # `key`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaComputerKeyConfig)) }
        attr_reader :key

        sig do
          params(
            key: T.nilable(Anthropic::Beta::BetaComputerKeyConfig::OrHash)
          ).void
        end
        attr_writer :key

        # `left_click`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaComputerLeftClickConfig)) }
        attr_reader :left_click

        sig do
          params(
            left_click:
              T.nilable(Anthropic::Beta::BetaComputerLeftClickConfig::OrHash)
          ).void
        end
        attr_writer :left_click

        # `left_click_drag`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaComputerLeftClickDragConfig))
        end
        attr_reader :left_click_drag

        sig do
          params(
            left_click_drag:
              T.nilable(
                Anthropic::Beta::BetaComputerLeftClickDragConfig::OrHash
              )
          ).void
        end
        attr_writer :left_click_drag

        # `left_mouse_down`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaComputerLeftMouseDownConfig))
        end
        attr_reader :left_mouse_down

        sig do
          params(
            left_mouse_down:
              T.nilable(
                Anthropic::Beta::BetaComputerLeftMouseDownConfig::OrHash
              )
          ).void
        end
        attr_writer :left_mouse_down

        # `left_mouse_up`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaComputerLeftMouseUpConfig))
        end
        attr_reader :left_mouse_up

        sig do
          params(
            left_mouse_up:
              T.nilable(Anthropic::Beta::BetaComputerLeftMouseUpConfig::OrHash)
          ).void
        end
        attr_writer :left_mouse_up

        # `middle_click`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaComputerMiddleClickConfig))
        end
        attr_reader :middle_click

        sig do
          params(
            middle_click:
              T.nilable(Anthropic::Beta::BetaComputerMiddleClickConfig::OrHash)
          ).void
        end
        attr_writer :middle_click

        # `mouse_move`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaComputerMouseMoveConfig)) }
        attr_reader :mouse_move

        sig do
          params(
            mouse_move:
              T.nilable(Anthropic::Beta::BetaComputerMouseMoveConfig::OrHash)
          ).void
        end
        attr_writer :mouse_move

        # `right_click`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaComputerRightClickConfig))
        end
        attr_reader :right_click

        sig do
          params(
            right_click:
              T.nilable(Anthropic::Beta::BetaComputerRightClickConfig::OrHash)
          ).void
        end
        attr_writer :right_click

        # `screenshot`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaComputerScreenshotConfig))
        end
        attr_reader :screenshot

        sig do
          params(
            screenshot:
              T.nilable(Anthropic::Beta::BetaComputerScreenshotConfig::OrHash)
          ).void
        end
        attr_writer :screenshot

        # `scroll`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaComputerScrollConfig)) }
        attr_reader :scroll

        sig do
          params(
            scroll: T.nilable(Anthropic::Beta::BetaComputerScrollConfig::OrHash)
          ).void
        end
        attr_writer :scroll

        # `triple_click`'s config overrides.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaComputerTripleClickConfig))
        end
        attr_reader :triple_click

        sig do
          params(
            triple_click:
              T.nilable(Anthropic::Beta::BetaComputerTripleClickConfig::OrHash)
          ).void
        end
        attr_writer :triple_click

        # `type`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaComputerTypeConfig)) }
        attr_reader :type

        sig do
          params(
            type: T.nilable(Anthropic::Beta::BetaComputerTypeConfig::OrHash)
          ).void
        end
        attr_writer :type

        # `wait`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaComputerWaitConfig)) }
        attr_reader :wait

        sig do
          params(
            wait: T.nilable(Anthropic::Beta::BetaComputerWaitConfig::OrHash)
          ).void
        end
        attr_writer :wait

        # `zoom`'s config overrides.
        sig { returns(T.nilable(Anthropic::Beta::BetaComputerZoomConfig)) }
        attr_reader :zoom

        sig do
          params(
            zoom: T.nilable(Anthropic::Beta::BetaComputerZoomConfig::OrHash)
          ).void
        end
        attr_writer :zoom

        # Per-member configuration for `computer_toolset_20260801`: one optional field per
        # member tool, keyed by the member name — the same name the member's `tool_use`
        # blocks carry. Every member is an accepted key, and a member's defaults apply
        # wherever its key is absent. Unknown keys are rejected: the field set is this
        # toolset version's complete member set.
        sig do
          params(
            cursor_position:
              T.nilable(
                Anthropic::Beta::BetaComputerCursorPositionConfig::OrHash
              ),
            double_click:
              T.nilable(Anthropic::Beta::BetaComputerDoubleClickConfig::OrHash),
            hold_key:
              T.nilable(Anthropic::Beta::BetaComputerHoldKeyConfig::OrHash),
            key: T.nilable(Anthropic::Beta::BetaComputerKeyConfig::OrHash),
            left_click:
              T.nilable(Anthropic::Beta::BetaComputerLeftClickConfig::OrHash),
            left_click_drag:
              T.nilable(
                Anthropic::Beta::BetaComputerLeftClickDragConfig::OrHash
              ),
            left_mouse_down:
              T.nilable(
                Anthropic::Beta::BetaComputerLeftMouseDownConfig::OrHash
              ),
            left_mouse_up:
              T.nilable(Anthropic::Beta::BetaComputerLeftMouseUpConfig::OrHash),
            middle_click:
              T.nilable(Anthropic::Beta::BetaComputerMiddleClickConfig::OrHash),
            mouse_move:
              T.nilable(Anthropic::Beta::BetaComputerMouseMoveConfig::OrHash),
            right_click:
              T.nilable(Anthropic::Beta::BetaComputerRightClickConfig::OrHash),
            screenshot:
              T.nilable(Anthropic::Beta::BetaComputerScreenshotConfig::OrHash),
            scroll:
              T.nilable(Anthropic::Beta::BetaComputerScrollConfig::OrHash),
            triple_click:
              T.nilable(Anthropic::Beta::BetaComputerTripleClickConfig::OrHash),
            type: T.nilable(Anthropic::Beta::BetaComputerTypeConfig::OrHash),
            wait: T.nilable(Anthropic::Beta::BetaComputerWaitConfig::OrHash),
            zoom: T.nilable(Anthropic::Beta::BetaComputerZoomConfig::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # `cursor_position`'s config overrides.
          cursor_position: nil,
          # `double_click`'s config overrides.
          double_click: nil,
          # `hold_key`'s config overrides.
          hold_key: nil,
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
          # `middle_click`'s config overrides.
          middle_click: nil,
          # `mouse_move`'s config overrides.
          mouse_move: nil,
          # `right_click`'s config overrides.
          right_click: nil,
          # `screenshot`'s config overrides.
          screenshot: nil,
          # `scroll`'s config overrides.
          scroll: nil,
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
              cursor_position:
                T.nilable(Anthropic::Beta::BetaComputerCursorPositionConfig),
              double_click:
                T.nilable(Anthropic::Beta::BetaComputerDoubleClickConfig),
              hold_key: T.nilable(Anthropic::Beta::BetaComputerHoldKeyConfig),
              key: T.nilable(Anthropic::Beta::BetaComputerKeyConfig),
              left_click:
                T.nilable(Anthropic::Beta::BetaComputerLeftClickConfig),
              left_click_drag:
                T.nilable(Anthropic::Beta::BetaComputerLeftClickDragConfig),
              left_mouse_down:
                T.nilable(Anthropic::Beta::BetaComputerLeftMouseDownConfig),
              left_mouse_up:
                T.nilable(Anthropic::Beta::BetaComputerLeftMouseUpConfig),
              middle_click:
                T.nilable(Anthropic::Beta::BetaComputerMiddleClickConfig),
              mouse_move:
                T.nilable(Anthropic::Beta::BetaComputerMouseMoveConfig),
              right_click:
                T.nilable(Anthropic::Beta::BetaComputerRightClickConfig),
              screenshot:
                T.nilable(Anthropic::Beta::BetaComputerScreenshotConfig),
              scroll: T.nilable(Anthropic::Beta::BetaComputerScrollConfig),
              triple_click:
                T.nilable(Anthropic::Beta::BetaComputerTripleClickConfig),
              type: T.nilable(Anthropic::Beta::BetaComputerTypeConfig),
              wait: T.nilable(Anthropic::Beta::BetaComputerWaitConfig),
              zoom: T.nilable(Anthropic::Beta::BetaComputerZoomConfig)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
