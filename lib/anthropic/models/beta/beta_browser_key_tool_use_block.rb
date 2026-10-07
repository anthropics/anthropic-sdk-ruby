# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserKeyToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Press a key or key chord. Use "+" to combine modifiers with a key (e.g.
        #   "ctrl+a", "cmd+shift+p") and space to sequence presses (e.g. "Backspace
        #   Backspace Delete"). Common names like "Return", "Tab", "Escape", "BackSpace" are
        #   supported.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserKeyInput]
        required :input, -> { Anthropic::Beta::BetaBrowserKeyInput }

        # @!attribute name
        #
        #   @return [Symbol, :key]
        required :name, const: :key

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

        # @!method initialize(id:, input:, caller_: nil, name: :key, toolset_name: :browser, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserKeyToolUseBlock} for more details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaBrowserKeyInput] Press a key or key chord. Use "+" to combine modifiers with a key (e.g. "ctrl+a"
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :key]
        #
        #   @param toolset_name [Symbol, :browser]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaBrowserKeyToolUseBlock = Beta::BetaBrowserKeyToolUseBlock
  end
end
