# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserMiddleClickToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Middle-click at a viewport coordinate or on an element by reference.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserMiddleClickInput]
        required :input, -> { Anthropic::Beta::BetaBrowserMiddleClickInput }

        # @!attribute name
        #
        #   @return [Symbol, :middle_click]
        required :name, const: :middle_click

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

        # @!method initialize(id:, input:, caller_: nil, name: :middle_click, toolset_name: :browser, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserMiddleClickToolUseBlock} for more details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaBrowserMiddleClickInput] Middle-click at a viewport coordinate or on an element by reference.
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :middle_click]
        #
        #   @param toolset_name [Symbol, :browser]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaBrowserMiddleClickToolUseBlock = Beta::BetaBrowserMiddleClickToolUseBlock
  end
end
