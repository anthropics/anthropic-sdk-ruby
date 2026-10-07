# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserLeftMouseUpToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Release the left mouse button at a viewport coordinate.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserLeftMouseUpInput]
        required :input, -> { Anthropic::Beta::BetaBrowserLeftMouseUpInput }

        # @!attribute name
        #
        #   @return [Symbol, :left_mouse_up]
        required :name, const: :left_mouse_up

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

        # @!method initialize(id:, input:, caller_: nil, name: :left_mouse_up, toolset_name: :browser, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserLeftMouseUpToolUseBlock} for more details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaBrowserLeftMouseUpInput] Release the left mouse button at a viewport coordinate.
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :left_mouse_up]
        #
        #   @param toolset_name [Symbol, :browser]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaBrowserLeftMouseUpToolUseBlock = Beta::BetaBrowserLeftMouseUpToolUseBlock
  end
end
