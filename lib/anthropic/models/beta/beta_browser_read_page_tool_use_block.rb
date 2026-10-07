# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserReadPageToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Return a structured accessibility tree of the page (or the subtree rooted at
        #   `ref`), with element references like [ref_7] that can be used as targets on
        #   later actions. Output is capped at 50,000 characters — narrow with `ref` or a
        #   smaller `depth` when exceeded.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserReadPageInput]
        required :input, -> { Anthropic::Beta::BetaBrowserReadPageInput }

        # @!attribute name
        #
        #   @return [Symbol, :read_page]
        required :name, const: :read_page

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

        # @!method initialize(id:, input:, caller_: nil, name: :read_page, toolset_name: :browser, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserReadPageToolUseBlock} for more details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaBrowserReadPageInput] Return a structured accessibility tree of the page (or the subtree rooted at
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :read_page]
        #
        #   @param toolset_name [Symbol, :browser]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaBrowserReadPageToolUseBlock = Beta::BetaBrowserReadPageToolUseBlock
  end
end
