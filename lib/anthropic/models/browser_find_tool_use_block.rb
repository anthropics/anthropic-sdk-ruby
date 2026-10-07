# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserFindToolUseBlock < Anthropic::Internal::Type::BaseModel
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
      #   Find elements matching a natural-language description (e.g. "search bar", "add
      #   to cart button") and return up to 20 matches with element references.
      #
      #   @return [Anthropic::Models::BrowserFindInput]
      required :input, -> { Anthropic::BrowserFindInput }

      # @!attribute name
      #
      #   @return [Symbol, :find]
      required :name, const: :find

      # @!attribute toolset_name
      #
      #   @return [Symbol, :browser]
      required :toolset_name, const: :browser

      # @!attribute type
      #
      #   @return [Symbol, :tool_use]
      required :type, const: :tool_use

      # @!method initialize(id:, caller_:, input:, name: :find, toolset_name: :browser, type: :tool_use)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserFindToolUseBlock} for more details.
      #
      #   @param id [String]
      #
      #   @param caller_ [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
      #
      #   @param input [Anthropic::Models::BrowserFindInput] Find elements matching a natural-language description (e.g. "search bar", "add t
      #
      #   @param name [Symbol, :find]
      #
      #   @param toolset_name [Symbol, :browser]
      #
      #   @param type [Symbol, :tool_use]
    end
  end
end
