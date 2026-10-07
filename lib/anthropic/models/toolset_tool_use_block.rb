# frozen_string_literal: true

module Anthropic
  module Models
    module ToolsetToolUseBlock
      extend Anthropic::Internal::Type::Union

      variant union: -> { Anthropic::BrowserToolUseBlock }

      variant union: -> { Anthropic::ComputerToolUseBlock }

      variant -> { Anthropic::ToolUseBlock }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::BrowserNavigateToolUseBlock, Anthropic::Models::BrowserListTabsToolUseBlock, Anthropic::Models::BrowserNewTabToolUseBlock, Anthropic::Models::BrowserSwitchTabToolUseBlock, Anthropic::Models::BrowserCloseTabToolUseBlock, Anthropic::Models::BrowserReadPageToolUseBlock, Anthropic::Models::BrowserGetPageTextToolUseBlock, Anthropic::Models::BrowserReadConsoleToolUseBlock, Anthropic::Models::BrowserReadNetworkToolUseBlock, Anthropic::Models::BrowserFindToolUseBlock, Anthropic::Models::BrowserFormInputToolUseBlock, Anthropic::Models::BrowserFileUploadToolUseBlock, Anthropic::Models::BrowserScrollToToolUseBlock, Anthropic::Models::BrowserScreenshotToolUseBlock, Anthropic::Models::BrowserZoomToolUseBlock, Anthropic::Models::BrowserLeftClickToolUseBlock, Anthropic::Models::BrowserRightClickToolUseBlock, Anthropic::Models::BrowserMiddleClickToolUseBlock, Anthropic::Models::BrowserDoubleClickToolUseBlock, Anthropic::Models::BrowserTripleClickToolUseBlock, Anthropic::Models::BrowserHoverToolUseBlock, Anthropic::Models::BrowserLeftClickDragToolUseBlock, Anthropic::Models::BrowserLeftMouseDownToolUseBlock, Anthropic::Models::BrowserLeftMouseUpToolUseBlock, Anthropic::Models::BrowserMouseMoveToolUseBlock, Anthropic::Models::BrowserScrollToolUseBlock, Anthropic::Models::BrowserTypeToolUseBlock, Anthropic::Models::BrowserKeyToolUseBlock, Anthropic::Models::BrowserHoldKeyToolUseBlock, Anthropic::Models::BrowserWaitToolUseBlock, Anthropic::Models::BrowserJavascriptExecToolUseBlock, Anthropic::Models::ComputerKeyToolUseBlock, Anthropic::Models::ComputerHoldKeyToolUseBlock, Anthropic::Models::ComputerTypeToolUseBlock, Anthropic::Models::ComputerCursorPositionToolUseBlock, Anthropic::Models::ComputerMouseMoveToolUseBlock, Anthropic::Models::ComputerLeftMouseDownToolUseBlock, Anthropic::Models::ComputerLeftMouseUpToolUseBlock, Anthropic::Models::ComputerLeftClickToolUseBlock, Anthropic::Models::ComputerLeftClickDragToolUseBlock, Anthropic::Models::ComputerRightClickToolUseBlock, Anthropic::Models::ComputerMiddleClickToolUseBlock, Anthropic::Models::ComputerDoubleClickToolUseBlock, Anthropic::Models::ComputerTripleClickToolUseBlock, Anthropic::Models::ComputerScrollToolUseBlock, Anthropic::Models::ComputerWaitToolUseBlock, Anthropic::Models::ComputerScreenshotToolUseBlock, Anthropic::Models::ComputerZoomToolUseBlock, Anthropic::Models::ToolUseBlock)]
    end
  end
end
