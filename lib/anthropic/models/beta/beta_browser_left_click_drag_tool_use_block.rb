# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserLeftClickDragToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Press at `from`, drag to `target`, release. Both must be coordinate targets.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserLeftClickDragInput]
        required :input, -> { Anthropic::Beta::BetaBrowserLeftClickDragInput }

        # @!attribute name
        #
        #   @return [Symbol, :left_click_drag]
        required :name, const: :left_click_drag

        # @!attribute toolset_name
        #
        #   @return [Symbol, :browser]
        required :toolset_name, const: :browser

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

        # @!method initialize(id:, input:, caller_: nil, name: :left_click_drag, toolset_name: :browser, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserLeftClickDragToolUseBlock} for more
        #   details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaBrowserLeftClickDragInput] Press at `from`, drag to `target`, release. Both must be coordinate targets.
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :left_click_drag]
        #
        #   @param toolset_name [Symbol, :browser]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaBrowserLeftClickDragToolUseBlock = Beta::BetaBrowserLeftClickDragToolUseBlock
  end
end
