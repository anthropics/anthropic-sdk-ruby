# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaComputerLeftClickDragToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Click and drag the cursor from `start_coordinate` to `coordinate`.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerLeftClickDragInput]
        required :input, -> { Anthropic::Beta::BetaComputerLeftClickDragInput }

        # @!attribute name
        #
        #   @return [Symbol, :left_click_drag]
        required :name, const: :left_click_drag

        # @!attribute toolset_name
        #
        #   @return [Symbol, :computer]
        required :toolset_name, const: :computer

        # @!attribute type
        #
        #   @return [Symbol, :tool_use]
        required :type, const: :tool_use

        # @!attribute caller_
        #   Which party invoked the tool call: the model directly, or a server tool on its
        #   behalf.
        #
        #   @return [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120, nil]
        optional :caller_, union: -> { Anthropic::Beta::BetaToolUseCaller }, api_name: :caller

        # @!method initialize(id:, input:, caller_: nil, name: :left_click_drag, toolset_name: :computer, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaComputerLeftClickDragToolUseBlock} for more
        #   details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaComputerLeftClickDragInput] Click and drag the cursor from `start_coordinate` to `coordinate`.
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :left_click_drag]
        #
        #   @param toolset_name [Symbol, :computer]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaComputerLeftClickDragToolUseBlock = Beta::BetaComputerLeftClickDragToolUseBlock
  end
end
