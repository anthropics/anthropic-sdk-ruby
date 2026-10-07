# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserJavascriptExecToolUseBlock < Anthropic::Internal::Type::BaseModel
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
      #   Execute JavaScript in the page context and return the value of the last
      #   expression. The code runs with access to the DOM, `window`, and page variables.
      #   Write the expression you want evaluated — do NOT use `return`.
      #
      #   @return [Anthropic::Models::BrowserJavascriptExecInput]
      required :input, -> { Anthropic::BrowserJavascriptExecInput }

      # @!attribute name
      #
      #   @return [Symbol, :javascript_exec]
      required :name, const: :javascript_exec

      # @!attribute toolset_name
      #
      #   @return [Symbol, :browser]
      required :toolset_name, const: :browser

      # @!attribute type
      #
      #   @return [Symbol, :tool_use]
      required :type, const: :tool_use

      # @!method initialize(id:, caller_:, input:, name: :javascript_exec, toolset_name: :browser, type: :tool_use)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserJavascriptExecToolUseBlock} for more details.
      #
      #   @param id [String]
      #
      #   @param caller_ [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
      #
      #   @param input [Anthropic::Models::BrowserJavascriptExecInput] Execute JavaScript in the page context and return the value of the last
      #
      #   @param name [Symbol, :javascript_exec]
      #
      #   @param toolset_name [Symbol, :browser]
      #
      #   @param type [Symbol, :tool_use]
    end
  end
end
