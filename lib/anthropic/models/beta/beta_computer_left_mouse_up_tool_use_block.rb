# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaComputerLeftMouseUpToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Release the left mouse button.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerLeftMouseUpInput]
        required :input, -> { Anthropic::Beta::BetaComputerLeftMouseUpInput }

        # @!attribute name
        #
        #   @return [Symbol, :left_mouse_up]
        required :name, const: :left_mouse_up

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

        # @!method initialize(id:, input:, caller_: nil, name: :left_mouse_up, toolset_name: :computer, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaComputerLeftMouseUpToolUseBlock} for more details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaComputerLeftMouseUpInput] Release the left mouse button.
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :left_mouse_up]
        #
        #   @param toolset_name [Symbol, :computer]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaComputerLeftMouseUpToolUseBlock = Beta::BetaComputerLeftMouseUpToolUseBlock
  end
end
