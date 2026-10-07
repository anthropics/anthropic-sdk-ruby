# frozen_string_literal: true

module Anthropic
  module Models
    class ComputerKeyToolUseBlock < Anthropic::Internal::Type::BaseModel
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
      #   Press a key or key-combination on the keyboard. Use "+" to combine modifiers
      #   with a key (e.g. "ctrl+s", "alt+Tab", "ctrl+shift+Escape"). Key names are
      #   case-insensitive; common names like "Return", "Tab", "Escape", "Up", "Down",
      #   "Left", "Right", "Home", "End", "Page_Up", "Page_Down", "Delete", "BackSpace"
      #   are supported.
      #
      #   @return [Anthropic::Models::ComputerKeyInput]
      required :input, -> { Anthropic::ComputerKeyInput }

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

      # @!method initialize(id:, caller_:, input:, name: :key, toolset_name: :computer, type: :tool_use)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ComputerKeyToolUseBlock} for more details.
      #
      #   @param id [String]
      #
      #   @param caller_ [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
      #
      #   @param input [Anthropic::Models::ComputerKeyInput] Press a key or key-combination on the keyboard. Use "+" to combine modifiers wit
      #
      #   @param name [Symbol, :key]
      #
      #   @param toolset_name [Symbol, :computer]
      #
      #   @param type [Symbol, :tool_use]
    end
  end
end
