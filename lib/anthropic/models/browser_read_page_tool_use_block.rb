# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserReadPageToolUseBlock < Anthropic::Internal::Type::BaseModel
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
      #   Return a structured accessibility tree of the page (or the subtree rooted at
      #   `ref`), with element references like [ref_7] that can be used as targets on
      #   later actions. Output is capped at 50,000 characters — narrow with `ref` or a
      #   smaller `depth` when exceeded.
      #
      #   @return [Anthropic::Models::BrowserReadPageInput]
      required :input, -> { Anthropic::BrowserReadPageInput }

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

      # @!method initialize(id:, caller_:, input:, name: :read_page, toolset_name: :browser, type: :tool_use)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserReadPageToolUseBlock} for more details.
      #
      #   @param id [String]
      #
      #   @param caller_ [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
      #
      #   @param input [Anthropic::Models::BrowserReadPageInput] Return a structured accessibility tree of the page (or the subtree rooted at
      #
      #   @param name [Symbol, :read_page]
      #
      #   @param toolset_name [Symbol, :browser]
      #
      #   @param type [Symbol, :tool_use]
    end
  end
end
