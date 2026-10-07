# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserTripleClickToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Triple left-click at a viewport coordinate or on an element by reference
        #   (typically selects a line or paragraph).
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserTripleClickInput]
        required :input, -> { Anthropic::Beta::BetaBrowserTripleClickInput }

        # @!attribute name
        #
        #   @return [Symbol, :triple_click]
        required :name, const: :triple_click

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

        # @!method initialize(id:, input:, caller_: nil, name: :triple_click, toolset_name: :browser, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserTripleClickToolUseBlock} for more details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaBrowserTripleClickInput] Triple left-click at a viewport coordinate or on an element by reference
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :triple_click]
        #
        #   @param toolset_name [Symbol, :browser]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaBrowserTripleClickToolUseBlock = Beta::BetaBrowserTripleClickToolUseBlock
  end
end
