# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserLeftClickToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Left-click at a viewport coordinate or on an element by reference.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserLeftClickInput]
        required :input, -> { Anthropic::Beta::BetaBrowserLeftClickInput }

        # @!attribute name
        #
        #   @return [Symbol, :left_click]
        required :name, const: :left_click

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

        # @!method initialize(id:, input:, caller_: nil, name: :left_click, toolset_name: :browser, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserLeftClickToolUseBlock} for more details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaBrowserLeftClickInput] Left-click at a viewport coordinate or on an element by reference.
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :left_click]
        #
        #   @param toolset_name [Symbol, :browser]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaBrowserLeftClickToolUseBlock = Beta::BetaBrowserLeftClickToolUseBlock
  end
end
