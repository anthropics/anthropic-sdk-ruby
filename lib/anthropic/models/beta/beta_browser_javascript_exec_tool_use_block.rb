# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserJavascriptExecToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Execute JavaScript in the page context and return the value of the last
        #   expression. The code runs with access to the DOM, `window`, and page variables.
        #   Write the expression you want evaluated — do NOT use `return`.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserJavascriptExecInput]
        required :input, -> { Anthropic::Beta::BetaBrowserJavascriptExecInput }

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

        # @!attribute caller_
        #   Which party invoked the tool call: the model directly, or a server tool on its
        #   behalf.
        #
        #   @return [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120, nil]
        optional :caller_, union: -> { Anthropic::Beta::BetaToolUseCaller }, api_name: :caller

        # @!method initialize(id:, input:, caller_: nil, name: :javascript_exec, toolset_name: :browser, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserJavascriptExecToolUseBlock} for more
        #   details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaBrowserJavascriptExecInput] Execute JavaScript in the page context and return the value of the last
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :javascript_exec]
        #
        #   @param toolset_name [Symbol, :browser]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaBrowserJavascriptExecToolUseBlock = Beta::BetaBrowserJavascriptExecToolUseBlock
  end
end
