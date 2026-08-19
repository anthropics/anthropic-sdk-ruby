# frozen_string_literal: true

module Anthropic
  module Models
    class ComputerToolsetConfigs < Anthropic::Internal::Type::BaseModel
      # @!attribute cursor_position
      #   `cursor_position`'s config overrides.
      #
      #   @return [Anthropic::Models::ComputerCursorPositionConfig, nil]
      optional :cursor_position, -> { Anthropic::ComputerCursorPositionConfig }, nil?: true

      # @!attribute double_click
      #   `double_click`'s config overrides.
      #
      #   @return [Anthropic::Models::ComputerDoubleClickConfig, nil]
      optional :double_click, -> { Anthropic::ComputerDoubleClickConfig }, nil?: true

      # @!attribute hold_key
      #   `hold_key`'s config overrides.
      #
      #   @return [Anthropic::Models::ComputerHoldKeyConfig, nil]
      optional :hold_key, -> { Anthropic::ComputerHoldKeyConfig }, nil?: true

      # @!attribute key
      #   `key`'s config overrides.
      #
      #   @return [Anthropic::Models::ComputerKeyConfig, nil]
      optional :key, -> { Anthropic::ComputerKeyConfig }, nil?: true

      # @!attribute left_click
      #   `left_click`'s config overrides.
      #
      #   @return [Anthropic::Models::ComputerLeftClickConfig, nil]
      optional :left_click, -> { Anthropic::ComputerLeftClickConfig }, nil?: true

      # @!attribute left_click_drag
      #   `left_click_drag`'s config overrides.
      #
      #   @return [Anthropic::Models::ComputerLeftClickDragConfig, nil]
      optional :left_click_drag, -> { Anthropic::ComputerLeftClickDragConfig }, nil?: true

      # @!attribute left_mouse_down
      #   `left_mouse_down`'s config overrides.
      #
      #   @return [Anthropic::Models::ComputerLeftMouseDownConfig, nil]
      optional :left_mouse_down, -> { Anthropic::ComputerLeftMouseDownConfig }, nil?: true

      # @!attribute left_mouse_up
      #   `left_mouse_up`'s config overrides.
      #
      #   @return [Anthropic::Models::ComputerLeftMouseUpConfig, nil]
      optional :left_mouse_up, -> { Anthropic::ComputerLeftMouseUpConfig }, nil?: true

      # @!attribute middle_click
      #   `middle_click`'s config overrides.
      #
      #   @return [Anthropic::Models::ComputerMiddleClickConfig, nil]
      optional :middle_click, -> { Anthropic::ComputerMiddleClickConfig }, nil?: true

      # @!attribute mouse_move
      #   `mouse_move`'s config overrides.
      #
      #   @return [Anthropic::Models::ComputerMouseMoveConfig, nil]
      optional :mouse_move, -> { Anthropic::ComputerMouseMoveConfig }, nil?: true

      # @!attribute right_click
      #   `right_click`'s config overrides.
      #
      #   @return [Anthropic::Models::ComputerRightClickConfig, nil]
      optional :right_click, -> { Anthropic::ComputerRightClickConfig }, nil?: true

      # @!attribute screenshot
      #   `screenshot`'s config overrides.
      #
      #   @return [Anthropic::Models::ComputerScreenshotConfig, nil]
      optional :screenshot, -> { Anthropic::ComputerScreenshotConfig }, nil?: true

      # @!attribute scroll
      #   `scroll`'s config overrides.
      #
      #   @return [Anthropic::Models::ComputerScrollConfig, nil]
      optional :scroll, -> { Anthropic::ComputerScrollConfig }, nil?: true

      # @!attribute triple_click
      #   `triple_click`'s config overrides.
      #
      #   @return [Anthropic::Models::ComputerTripleClickConfig, nil]
      optional :triple_click, -> { Anthropic::ComputerTripleClickConfig }, nil?: true

      # @!attribute type
      #   `type`'s config overrides.
      #
      #   @return [Anthropic::Models::ComputerTypeConfig, nil]
      optional :type, -> { Anthropic::ComputerTypeConfig }, nil?: true

      # @!attribute wait
      #   `wait`'s config overrides.
      #
      #   @return [Anthropic::Models::ComputerWaitConfig, nil]
      optional :wait, -> { Anthropic::ComputerWaitConfig }, nil?: true

      # @!attribute zoom
      #   `zoom`'s config overrides.
      #
      #   @return [Anthropic::Models::ComputerZoomConfig, nil]
      optional :zoom, -> { Anthropic::ComputerZoomConfig }, nil?: true

      # @!method initialize(cursor_position: nil, double_click: nil, hold_key: nil, key: nil, left_click: nil, left_click_drag: nil, left_mouse_down: nil, left_mouse_up: nil, middle_click: nil, mouse_move: nil, right_click: nil, screenshot: nil, scroll: nil, triple_click: nil, type: nil, wait: nil, zoom: nil)
      #   Per-member configuration for `computer_toolset_20260801`: one optional field per
      #   member tool, keyed by the member name — the same name the member's `tool_use`
      #   blocks carry. Every member is an accepted key, and a member's defaults apply
      #   wherever its key is absent. Unknown keys are rejected: the field set is this
      #   toolset version's complete member set.
      #
      #   @param cursor_position [Anthropic::Models::ComputerCursorPositionConfig, nil] `cursor_position`'s config overrides.
      #
      #   @param double_click [Anthropic::Models::ComputerDoubleClickConfig, nil] `double_click`'s config overrides.
      #
      #   @param hold_key [Anthropic::Models::ComputerHoldKeyConfig, nil] `hold_key`'s config overrides.
      #
      #   @param key [Anthropic::Models::ComputerKeyConfig, nil] `key`'s config overrides.
      #
      #   @param left_click [Anthropic::Models::ComputerLeftClickConfig, nil] `left_click`'s config overrides.
      #
      #   @param left_click_drag [Anthropic::Models::ComputerLeftClickDragConfig, nil] `left_click_drag`'s config overrides.
      #
      #   @param left_mouse_down [Anthropic::Models::ComputerLeftMouseDownConfig, nil] `left_mouse_down`'s config overrides.
      #
      #   @param left_mouse_up [Anthropic::Models::ComputerLeftMouseUpConfig, nil] `left_mouse_up`'s config overrides.
      #
      #   @param middle_click [Anthropic::Models::ComputerMiddleClickConfig, nil] `middle_click`'s config overrides.
      #
      #   @param mouse_move [Anthropic::Models::ComputerMouseMoveConfig, nil] `mouse_move`'s config overrides.
      #
      #   @param right_click [Anthropic::Models::ComputerRightClickConfig, nil] `right_click`'s config overrides.
      #
      #   @param screenshot [Anthropic::Models::ComputerScreenshotConfig, nil] `screenshot`'s config overrides.
      #
      #   @param scroll [Anthropic::Models::ComputerScrollConfig, nil] `scroll`'s config overrides.
      #
      #   @param triple_click [Anthropic::Models::ComputerTripleClickConfig, nil] `triple_click`'s config overrides.
      #
      #   @param type [Anthropic::Models::ComputerTypeConfig, nil] `type`'s config overrides.
      #
      #   @param wait [Anthropic::Models::ComputerWaitConfig, nil] `wait`'s config overrides.
      #
      #   @param zoom [Anthropic::Models::ComputerZoomConfig, nil] `zoom`'s config overrides.
    end
  end
end
