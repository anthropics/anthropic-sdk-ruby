# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaToolsetToolUseBlock
        extend Anthropic::Internal::Type::Union

        variant union: -> { Anthropic::Beta::BetaBrowserToolUseBlock }

        variant union: -> { Anthropic::Beta::BetaComputerToolUseBlock }

        variant -> { Anthropic::Beta::BetaToolUseBlock }

        # @!method self.variants
        #   @return [Array(Anthropic::Models::Beta::BetaBrowserNavigateToolUseBlock, Anthropic::Models::Beta::BetaBrowserListTabsToolUseBlock, Anthropic::Models::Beta::BetaBrowserNewTabToolUseBlock, Anthropic::Models::Beta::BetaBrowserSwitchTabToolUseBlock, Anthropic::Models::Beta::BetaBrowserCloseTabToolUseBlock, Anthropic::Models::Beta::BetaBrowserReadPageToolUseBlock, Anthropic::Models::Beta::BetaBrowserGetPageTextToolUseBlock, Anthropic::Models::Beta::BetaBrowserReadConsoleToolUseBlock, Anthropic::Models::Beta::BetaBrowserReadNetworkToolUseBlock, Anthropic::Models::Beta::BetaBrowserFindToolUseBlock, Anthropic::Models::Beta::BetaBrowserFormInputToolUseBlock, Anthropic::Models::Beta::BetaBrowserFileUploadToolUseBlock, Anthropic::Models::Beta::BetaBrowserScrollToToolUseBlock, Anthropic::Models::Beta::BetaBrowserScreenshotToolUseBlock, Anthropic::Models::Beta::BetaBrowserZoomToolUseBlock, Anthropic::Models::Beta::BetaBrowserLeftClickToolUseBlock, Anthropic::Models::Beta::BetaBrowserRightClickToolUseBlock, Anthropic::Models::Beta::BetaBrowserMiddleClickToolUseBlock, Anthropic::Models::Beta::BetaBrowserDoubleClickToolUseBlock, Anthropic::Models::Beta::BetaBrowserTripleClickToolUseBlock, Anthropic::Models::Beta::BetaBrowserHoverToolUseBlock, Anthropic::Models::Beta::BetaBrowserLeftClickDragToolUseBlock, Anthropic::Models::Beta::BetaBrowserLeftMouseDownToolUseBlock, Anthropic::Models::Beta::BetaBrowserLeftMouseUpToolUseBlock, Anthropic::Models::Beta::BetaBrowserMouseMoveToolUseBlock, Anthropic::Models::Beta::BetaBrowserScrollToolUseBlock, Anthropic::Models::Beta::BetaBrowserTypeToolUseBlock, Anthropic::Models::Beta::BetaBrowserKeyToolUseBlock, Anthropic::Models::Beta::BetaBrowserHoldKeyToolUseBlock, Anthropic::Models::Beta::BetaBrowserWaitToolUseBlock, Anthropic::Models::Beta::BetaBrowserJavascriptExecToolUseBlock, Anthropic::Models::Beta::BetaComputerKeyToolUseBlock, Anthropic::Models::Beta::BetaComputerHoldKeyToolUseBlock, Anthropic::Models::Beta::BetaComputerTypeToolUseBlock, Anthropic::Models::Beta::BetaComputerCursorPositionToolUseBlock, Anthropic::Models::Beta::BetaComputerMouseMoveToolUseBlock, Anthropic::Models::Beta::BetaComputerLeftMouseDownToolUseBlock, Anthropic::Models::Beta::BetaComputerLeftMouseUpToolUseBlock, Anthropic::Models::Beta::BetaComputerLeftClickToolUseBlock, Anthropic::Models::Beta::BetaComputerLeftClickDragToolUseBlock, Anthropic::Models::Beta::BetaComputerRightClickToolUseBlock, Anthropic::Models::Beta::BetaComputerMiddleClickToolUseBlock, Anthropic::Models::Beta::BetaComputerDoubleClickToolUseBlock, Anthropic::Models::Beta::BetaComputerTripleClickToolUseBlock, Anthropic::Models::Beta::BetaComputerScrollToolUseBlock, Anthropic::Models::Beta::BetaComputerWaitToolUseBlock, Anthropic::Models::Beta::BetaComputerScreenshotToolUseBlock, Anthropic::Models::Beta::BetaComputerZoomToolUseBlock, Anthropic::Models::Beta::BetaToolUseBlock)]
      end
    end

    BetaToolsetToolUseBlock = Beta::BetaToolsetToolUseBlock
  end
end
