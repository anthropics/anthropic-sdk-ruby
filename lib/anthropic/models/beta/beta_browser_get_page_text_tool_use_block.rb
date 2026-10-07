# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserGetPageTextToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Return the page's visible text content as plain text, prioritizing article
        #   content. Suited to articles, documentation, and other text-heavy pages.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserGetPageTextInput]
        required :input, -> { Anthropic::Beta::BetaBrowserGetPageTextInput }

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

        # @!attribute caller_
        #   Which party invoked the tool call: the model directly, or a server tool on its
        #   behalf.
        #
        #   @return [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120, nil]
        optional :caller_, union: -> { Anthropic::Beta::BetaToolUseCaller }, api_name: :caller

        # @!method initialize(id:, input:, caller_: nil, name: :get_page_text, toolset_name: :browser, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserGetPageTextToolUseBlock} for more details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaBrowserGetPageTextInput] Return the page's visible text content as plain text, prioritizing article
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :get_page_text]
        #
        #   @param toolset_name [Symbol, :browser]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaBrowserGetPageTextToolUseBlock = Beta::BetaBrowserGetPageTextToolUseBlock
  end
end
