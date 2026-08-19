# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaComputerToolsetConfigs < Anthropic::Internal::Type::BaseModel
        # @!attribute cursor_position
        #   `cursor_position`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerCursorPositionConfig, nil]
        optional :cursor_position, -> { Anthropic::Beta::BetaComputerCursorPositionConfig }, nil?: true

        # @!attribute double_click
        #   `double_click`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerDoubleClickConfig, nil]
        optional :double_click, -> { Anthropic::Beta::BetaComputerDoubleClickConfig }, nil?: true

        # @!attribute hold_key
        #   `hold_key`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerHoldKeyConfig, nil]
        optional :hold_key, -> { Anthropic::Beta::BetaComputerHoldKeyConfig }, nil?: true

        # @!attribute key
        #   `key`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerKeyConfig, nil]
        optional :key, -> { Anthropic::Beta::BetaComputerKeyConfig }, nil?: true

        # @!attribute left_click
        #   `left_click`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerLeftClickConfig, nil]
        optional :left_click, -> { Anthropic::Beta::BetaComputerLeftClickConfig }, nil?: true

        # @!attribute left_click_drag
        #   `left_click_drag`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerLeftClickDragConfig, nil]
        optional :left_click_drag, -> { Anthropic::Beta::BetaComputerLeftClickDragConfig }, nil?: true

        # @!attribute left_mouse_down
        #   `left_mouse_down`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerLeftMouseDownConfig, nil]
        optional :left_mouse_down, -> { Anthropic::Beta::BetaComputerLeftMouseDownConfig }, nil?: true

        # @!attribute left_mouse_up
        #   `left_mouse_up`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerLeftMouseUpConfig, nil]
        optional :left_mouse_up, -> { Anthropic::Beta::BetaComputerLeftMouseUpConfig }, nil?: true

        # @!attribute middle_click
        #   `middle_click`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerMiddleClickConfig, nil]
        optional :middle_click, -> { Anthropic::Beta::BetaComputerMiddleClickConfig }, nil?: true

        # @!attribute mouse_move
        #   `mouse_move`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerMouseMoveConfig, nil]
        optional :mouse_move, -> { Anthropic::Beta::BetaComputerMouseMoveConfig }, nil?: true

        # @!attribute right_click
        #   `right_click`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerRightClickConfig, nil]
        optional :right_click, -> { Anthropic::Beta::BetaComputerRightClickConfig }, nil?: true

        # @!attribute screenshot
        #   `screenshot`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerScreenshotConfig, nil]
        optional :screenshot, -> { Anthropic::Beta::BetaComputerScreenshotConfig }, nil?: true

        # @!attribute scroll
        #   `scroll`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerScrollConfig, nil]
        optional :scroll, -> { Anthropic::Beta::BetaComputerScrollConfig }, nil?: true

        # @!attribute triple_click
        #   `triple_click`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerTripleClickConfig, nil]
        optional :triple_click, -> { Anthropic::Beta::BetaComputerTripleClickConfig }, nil?: true

        # @!attribute type
        #   `type`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerTypeConfig, nil]
        optional :type, -> { Anthropic::Beta::BetaComputerTypeConfig }, nil?: true

        # @!attribute wait
        #   `wait`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerWaitConfig, nil]
        optional :wait, -> { Anthropic::Beta::BetaComputerWaitConfig }, nil?: true

        # @!attribute zoom
        #   `zoom`'s config overrides.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerZoomConfig, nil]
        optional :zoom, -> { Anthropic::Beta::BetaComputerZoomConfig }, nil?: true

        # @!method initialize(cursor_position: nil, double_click: nil, hold_key: nil, key: nil, left_click: nil, left_click_drag: nil, left_mouse_down: nil, left_mouse_up: nil, middle_click: nil, mouse_move: nil, right_click: nil, screenshot: nil, scroll: nil, triple_click: nil, type: nil, wait: nil, zoom: nil)
        #   Per-member configuration for `computer_toolset_20260801`: one optional field per
        #   member tool, keyed by the member name — the same name the member's `tool_use`
        #   blocks carry. Every member is an accepted key, and a member's defaults apply
        #   wherever its key is absent. Unknown keys are rejected: the field set is this
        #   toolset version's complete member set.
        #
        #   @param cursor_position [Anthropic::Models::Beta::BetaComputerCursorPositionConfig, nil] `cursor_position`'s config overrides.
        #
        #   @param double_click [Anthropic::Models::Beta::BetaComputerDoubleClickConfig, nil] `double_click`'s config overrides.
        #
        #   @param hold_key [Anthropic::Models::Beta::BetaComputerHoldKeyConfig, nil] `hold_key`'s config overrides.
        #
        #   @param key [Anthropic::Models::Beta::BetaComputerKeyConfig, nil] `key`'s config overrides.
        #
        #   @param left_click [Anthropic::Models::Beta::BetaComputerLeftClickConfig, nil] `left_click`'s config overrides.
        #
        #   @param left_click_drag [Anthropic::Models::Beta::BetaComputerLeftClickDragConfig, nil] `left_click_drag`'s config overrides.
        #
        #   @param left_mouse_down [Anthropic::Models::Beta::BetaComputerLeftMouseDownConfig, nil] `left_mouse_down`'s config overrides.
        #
        #   @param left_mouse_up [Anthropic::Models::Beta::BetaComputerLeftMouseUpConfig, nil] `left_mouse_up`'s config overrides.
        #
        #   @param middle_click [Anthropic::Models::Beta::BetaComputerMiddleClickConfig, nil] `middle_click`'s config overrides.
        #
        #   @param mouse_move [Anthropic::Models::Beta::BetaComputerMouseMoveConfig, nil] `mouse_move`'s config overrides.
        #
        #   @param right_click [Anthropic::Models::Beta::BetaComputerRightClickConfig, nil] `right_click`'s config overrides.
        #
        #   @param screenshot [Anthropic::Models::Beta::BetaComputerScreenshotConfig, nil] `screenshot`'s config overrides.
        #
        #   @param scroll [Anthropic::Models::Beta::BetaComputerScrollConfig, nil] `scroll`'s config overrides.
        #
        #   @param triple_click [Anthropic::Models::Beta::BetaComputerTripleClickConfig, nil] `triple_click`'s config overrides.
        #
        #   @param type [Anthropic::Models::Beta::BetaComputerTypeConfig, nil] `type`'s config overrides.
        #
        #   @param wait [Anthropic::Models::Beta::BetaComputerWaitConfig, nil] `wait`'s config overrides.
        #
        #   @param zoom [Anthropic::Models::Beta::BetaComputerZoomConfig, nil] `zoom`'s config overrides.
      end
    end

    BetaComputerToolsetConfigs = Beta::BetaComputerToolsetConfigs
  end
end
