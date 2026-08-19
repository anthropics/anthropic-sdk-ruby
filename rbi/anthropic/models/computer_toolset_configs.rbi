# typed: strong

module Anthropic
  module Models
    class ComputerToolsetConfigs < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ComputerToolsetConfigs, Anthropic::Internal::AnyHash)
        end

      # `cursor_position`'s config overrides.
      sig { returns(T.nilable(Anthropic::ComputerCursorPositionConfig)) }
      attr_reader :cursor_position

      sig do
        params(
          cursor_position:
            T.nilable(Anthropic::ComputerCursorPositionConfig::OrHash)
        ).void
      end
      attr_writer :cursor_position

      # `double_click`'s config overrides.
      sig { returns(T.nilable(Anthropic::ComputerDoubleClickConfig)) }
      attr_reader :double_click

      sig do
        params(
          double_click: T.nilable(Anthropic::ComputerDoubleClickConfig::OrHash)
        ).void
      end
      attr_writer :double_click

      # `hold_key`'s config overrides.
      sig { returns(T.nilable(Anthropic::ComputerHoldKeyConfig)) }
      attr_reader :hold_key

      sig do
        params(
          hold_key: T.nilable(Anthropic::ComputerHoldKeyConfig::OrHash)
        ).void
      end
      attr_writer :hold_key

      # `key`'s config overrides.
      sig { returns(T.nilable(Anthropic::ComputerKeyConfig)) }
      attr_reader :key

      sig { params(key: T.nilable(Anthropic::ComputerKeyConfig::OrHash)).void }
      attr_writer :key

      # `left_click`'s config overrides.
      sig { returns(T.nilable(Anthropic::ComputerLeftClickConfig)) }
      attr_reader :left_click

      sig do
        params(
          left_click: T.nilable(Anthropic::ComputerLeftClickConfig::OrHash)
        ).void
      end
      attr_writer :left_click

      # `left_click_drag`'s config overrides.
      sig { returns(T.nilable(Anthropic::ComputerLeftClickDragConfig)) }
      attr_reader :left_click_drag

      sig do
        params(
          left_click_drag:
            T.nilable(Anthropic::ComputerLeftClickDragConfig::OrHash)
        ).void
      end
      attr_writer :left_click_drag

      # `left_mouse_down`'s config overrides.
      sig { returns(T.nilable(Anthropic::ComputerLeftMouseDownConfig)) }
      attr_reader :left_mouse_down

      sig do
        params(
          left_mouse_down:
            T.nilable(Anthropic::ComputerLeftMouseDownConfig::OrHash)
        ).void
      end
      attr_writer :left_mouse_down

      # `left_mouse_up`'s config overrides.
      sig { returns(T.nilable(Anthropic::ComputerLeftMouseUpConfig)) }
      attr_reader :left_mouse_up

      sig do
        params(
          left_mouse_up: T.nilable(Anthropic::ComputerLeftMouseUpConfig::OrHash)
        ).void
      end
      attr_writer :left_mouse_up

      # `middle_click`'s config overrides.
      sig { returns(T.nilable(Anthropic::ComputerMiddleClickConfig)) }
      attr_reader :middle_click

      sig do
        params(
          middle_click: T.nilable(Anthropic::ComputerMiddleClickConfig::OrHash)
        ).void
      end
      attr_writer :middle_click

      # `mouse_move`'s config overrides.
      sig { returns(T.nilable(Anthropic::ComputerMouseMoveConfig)) }
      attr_reader :mouse_move

      sig do
        params(
          mouse_move: T.nilable(Anthropic::ComputerMouseMoveConfig::OrHash)
        ).void
      end
      attr_writer :mouse_move

      # `right_click`'s config overrides.
      sig { returns(T.nilable(Anthropic::ComputerRightClickConfig)) }
      attr_reader :right_click

      sig do
        params(
          right_click: T.nilable(Anthropic::ComputerRightClickConfig::OrHash)
        ).void
      end
      attr_writer :right_click

      # `screenshot`'s config overrides.
      sig { returns(T.nilable(Anthropic::ComputerScreenshotConfig)) }
      attr_reader :screenshot

      sig do
        params(
          screenshot: T.nilable(Anthropic::ComputerScreenshotConfig::OrHash)
        ).void
      end
      attr_writer :screenshot

      # `scroll`'s config overrides.
      sig { returns(T.nilable(Anthropic::ComputerScrollConfig)) }
      attr_reader :scroll

      sig do
        params(scroll: T.nilable(Anthropic::ComputerScrollConfig::OrHash)).void
      end
      attr_writer :scroll

      # `triple_click`'s config overrides.
      sig { returns(T.nilable(Anthropic::ComputerTripleClickConfig)) }
      attr_reader :triple_click

      sig do
        params(
          triple_click: T.nilable(Anthropic::ComputerTripleClickConfig::OrHash)
        ).void
      end
      attr_writer :triple_click

      # `type`'s config overrides.
      sig { returns(T.nilable(Anthropic::ComputerTypeConfig)) }
      attr_reader :type

      sig do
        params(type: T.nilable(Anthropic::ComputerTypeConfig::OrHash)).void
      end
      attr_writer :type

      # `wait`'s config overrides.
      sig { returns(T.nilable(Anthropic::ComputerWaitConfig)) }
      attr_reader :wait

      sig do
        params(wait: T.nilable(Anthropic::ComputerWaitConfig::OrHash)).void
      end
      attr_writer :wait

      # `zoom`'s config overrides.
      sig { returns(T.nilable(Anthropic::ComputerZoomConfig)) }
      attr_reader :zoom

      sig do
        params(zoom: T.nilable(Anthropic::ComputerZoomConfig::OrHash)).void
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
            T.nilable(Anthropic::ComputerCursorPositionConfig::OrHash),
          double_click: T.nilable(Anthropic::ComputerDoubleClickConfig::OrHash),
          hold_key: T.nilable(Anthropic::ComputerHoldKeyConfig::OrHash),
          key: T.nilable(Anthropic::ComputerKeyConfig::OrHash),
          left_click: T.nilable(Anthropic::ComputerLeftClickConfig::OrHash),
          left_click_drag:
            T.nilable(Anthropic::ComputerLeftClickDragConfig::OrHash),
          left_mouse_down:
            T.nilable(Anthropic::ComputerLeftMouseDownConfig::OrHash),
          left_mouse_up:
            T.nilable(Anthropic::ComputerLeftMouseUpConfig::OrHash),
          middle_click: T.nilable(Anthropic::ComputerMiddleClickConfig::OrHash),
          mouse_move: T.nilable(Anthropic::ComputerMouseMoveConfig::OrHash),
          right_click: T.nilable(Anthropic::ComputerRightClickConfig::OrHash),
          screenshot: T.nilable(Anthropic::ComputerScreenshotConfig::OrHash),
          scroll: T.nilable(Anthropic::ComputerScrollConfig::OrHash),
          triple_click: T.nilable(Anthropic::ComputerTripleClickConfig::OrHash),
          type: T.nilable(Anthropic::ComputerTypeConfig::OrHash),
          wait: T.nilable(Anthropic::ComputerWaitConfig::OrHash),
          zoom: T.nilable(Anthropic::ComputerZoomConfig::OrHash)
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
            cursor_position: T.nilable(Anthropic::ComputerCursorPositionConfig),
            double_click: T.nilable(Anthropic::ComputerDoubleClickConfig),
            hold_key: T.nilable(Anthropic::ComputerHoldKeyConfig),
            key: T.nilable(Anthropic::ComputerKeyConfig),
            left_click: T.nilable(Anthropic::ComputerLeftClickConfig),
            left_click_drag: T.nilable(Anthropic::ComputerLeftClickDragConfig),
            left_mouse_down: T.nilable(Anthropic::ComputerLeftMouseDownConfig),
            left_mouse_up: T.nilable(Anthropic::ComputerLeftMouseUpConfig),
            middle_click: T.nilable(Anthropic::ComputerMiddleClickConfig),
            mouse_move: T.nilable(Anthropic::ComputerMouseMoveConfig),
            right_click: T.nilable(Anthropic::ComputerRightClickConfig),
            screenshot: T.nilable(Anthropic::ComputerScreenshotConfig),
            scroll: T.nilable(Anthropic::ComputerScrollConfig),
            triple_click: T.nilable(Anthropic::ComputerTripleClickConfig),
            type: T.nilable(Anthropic::ComputerTypeConfig),
            wait: T.nilable(Anthropic::ComputerWaitConfig),
            zoom: T.nilable(Anthropic::ComputerZoomConfig)
          }
        )
      end
      def to_hash
      end
    end
  end
end
