# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserLeftMouseDownToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Press and hold the left mouse button at a viewport coordinate. Pair with
        #   left_mouse_up to perform a custom drag.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserLeftMouseDownInput]
        required :input, -> { Anthropic::Beta::BetaBrowserLeftMouseDownInput }

        # @!attribute name
        #
        #   @return [Symbol, :left_mouse_down]
        required :name, const: :left_mouse_down

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

        # @!method initialize(id:, input:, caller_: nil, name: :left_mouse_down, toolset_name: :browser, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserLeftMouseDownToolUseBlock} for more
        #   details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaBrowserLeftMouseDownInput] Press and hold the left mouse button at a viewport coordinate. Pair with
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :left_mouse_down]
        #
        #   @param toolset_name [Symbol, :browser]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaBrowserLeftMouseDownToolUseBlock = Beta::BetaBrowserLeftMouseDownToolUseBlock
  end
end
