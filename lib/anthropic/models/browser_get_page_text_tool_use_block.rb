# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserGetPageTextToolUseBlock < Anthropic::Internal::Type::BaseModel
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
      #   Return the page's visible text content as plain text, prioritizing article
      #   content. Suited to articles, documentation, and other text-heavy pages.
      #
      #   @return [Anthropic::Models::BrowserGetPageTextInput]
      required :input, -> { Anthropic::BrowserGetPageTextInput }

      # @!attribute name
      #
      #   @return [Symbol, :get_page_text]
      required :name, const: :get_page_text

      # @!attribute toolset_name
      #
      #   @return [Symbol, :browser]
      required :toolset_name, const: :browser

      # @!attribute type
      #
      #   @return [Symbol, :tool_use]
      required :type, const: :tool_use

      # @!method initialize(id:, caller_:, input:, name: :get_page_text, toolset_name: :browser, type: :tool_use)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserGetPageTextToolUseBlock} for more details.
      #
      #   @param id [String]
      #
      #   @param caller_ [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
      #
      #   @param input [Anthropic::Models::BrowserGetPageTextInput] Return the page's visible text content as plain text, prioritizing article
      #
      #   @param name [Symbol, :get_page_text]
      #
      #   @param toolset_name [Symbol, :browser]
      #
      #   @param type [Symbol, :tool_use]
    end
  end
end
