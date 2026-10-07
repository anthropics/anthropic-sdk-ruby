# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserHoldKeyToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Hold a key or key chord down for a duration, then release it. Uses the same key
        #   names and "+" chord syntax as the key action.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserHoldKeyInput]
        required :input, -> { Anthropic::Beta::BetaBrowserHoldKeyInput }

        # @!attribute name
        #
        #   @return [Symbol, :hold_key]
        required :name, const: :hold_key

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

        # @!method initialize(id:, input:, caller_: nil, name: :hold_key, toolset_name: :browser, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserHoldKeyToolUseBlock} for more details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaBrowserHoldKeyInput] Hold a key or key chord down for a duration, then release it. Uses the same key
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :hold_key]
        #
        #   @param toolset_name [Symbol, :browser]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaBrowserHoldKeyToolUseBlock = Beta::BetaBrowserHoldKeyToolUseBlock
  end
end
