# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaComputerKeyToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Press a key or key-combination on the keyboard. Use "+" to combine modifiers
        #   with a key (e.g. "ctrl+s", "alt+Tab", "ctrl+shift+Escape"). Key names are
        #   case-insensitive; common names like "Return", "Tab", "Escape", "Up", "Down",
        #   "Left", "Right", "Home", "End", "Page_Up", "Page_Down", "Delete", "BackSpace"
        #   are supported.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerKeyInput]
        required :input, -> { Anthropic::Beta::BetaComputerKeyInput }

        # @!attribute name
        #
        #   @return [Symbol, :key]
        required :name, const: :key

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

        # @!method initialize(id:, input:, caller_: nil, name: :key, toolset_name: :computer, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaComputerKeyToolUseBlock} for more details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaComputerKeyInput] Press a key or key-combination on the keyboard. Use "+" to combine modifiers wit
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :key]
        #
        #   @param toolset_name [Symbol, :computer]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaComputerKeyToolUseBlock = Beta::BetaComputerKeyToolUseBlock
  end
end
