# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserHoldKeyToolUseBlock < Anthropic::Internal::Type::BaseModel
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
      #   Hold a key or key chord down for a duration, then release it. Uses the same key
      #   names and "+" chord syntax as the key action.
      #
      #   @return [Anthropic::Models::BrowserHoldKeyInput]
      required :input, -> { Anthropic::BrowserHoldKeyInput }

      # @!attribute name
      #
      #   @return [Symbol, :hold_key]
      required :name, const: :hold_key

      # @!attribute toolset_name
      #
      #   @return [Symbol, :browser]
      required :toolset_name, const: :browser

      # @!attribute type
      #
      #   @return [Symbol, :tool_use]
      required :type, const: :tool_use

      # @!method initialize(id:, caller_:, input:, name: :hold_key, toolset_name: :browser, type: :tool_use)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserHoldKeyToolUseBlock} for more details.
      #
      #   @param id [String]
      #
      #   @param caller_ [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
      #
      #   @param input [Anthropic::Models::BrowserHoldKeyInput] Hold a key or key chord down for a duration, then release it. Uses the same key
      #
      #   @param name [Symbol, :hold_key]
      #
      #   @param toolset_name [Symbol, :browser]
      #
      #   @param type [Symbol, :tool_use]
    end
  end
end
