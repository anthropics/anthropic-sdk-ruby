# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaComputerLeftMouseDownToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Press and hold the left mouse button at the current cursor position.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerLeftMouseDownInput]
        required :input, -> { Anthropic::Beta::BetaComputerLeftMouseDownInput }

        # @!attribute name
        #
        #   @return [Symbol, :left_mouse_down]
        required :name, const: :left_mouse_down

        # @!attribute toolset_name
        #
        #   @return [Symbol, :computer]
        required :toolset_name, const: :computer

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

        # @!method initialize(id:, input:, caller_: nil, name: :left_mouse_down, toolset_name: :computer, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaComputerLeftMouseDownToolUseBlock} for more
        #   details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaComputerLeftMouseDownInput] Press and hold the left mouse button at the current cursor position.
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :left_mouse_down]
        #
        #   @param toolset_name [Symbol, :computer]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaComputerLeftMouseDownToolUseBlock = Beta::BetaComputerLeftMouseDownToolUseBlock
  end
end
