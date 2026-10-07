# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserKeyToolUseBlock < Anthropic::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute caller_
      #   Which party invoked the tool call: the model directly, or a server tool on its
      #   behalf.
      #
      #   @return [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120]
      required :caller_, union: -> { Anthropic::ToolUseCaller }, api_name: :caller

      # @!attribute input
      #   Press a key or key chord. Use "+" to combine modifiers with a key (e.g.
      #   "ctrl+a", "cmd+shift+p") and space to sequence presses (e.g. "Backspace
      #   Backspace Delete"). Common names like "Return", "Tab", "Escape", "BackSpace" are
      #   supported.
      #
      #   @return [Anthropic::Models::BrowserKeyInput]
      required :input, -> { Anthropic::BrowserKeyInput }

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

      # @!method initialize(id:, caller_:, input:, name: :key, toolset_name: :browser, type: :tool_use)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserKeyToolUseBlock} for more details.
      #
      #   @param id [String]
      #
      #   @param caller_ [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
      #
      #   @param input [Anthropic::Models::BrowserKeyInput] Press a key or key chord. Use "+" to combine modifiers with a key (e.g. "ctrl+a"
      #
      #   @param name [Symbol, :key]
      #
      #   @param toolset_name [Symbol, :browser]
      #
      #   @param type [Symbol, :tool_use]
    end
  end
end
