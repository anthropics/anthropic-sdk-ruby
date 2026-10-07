# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaComputerMiddleClickToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Click the middle mouse button at the specified (x, y) pixel coordinate, or the
        #   current cursor position if `coordinate` is omitted.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerMiddleClickInput]
        required :input, -> { Anthropic::Beta::BetaComputerMiddleClickInput }

        # @!attribute name
        #
        #   @return [Symbol, :middle_click]
        required :name, const: :middle_click

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

        # @!method initialize(id:, input:, caller_: nil, name: :middle_click, toolset_name: :computer, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaComputerMiddleClickToolUseBlock} for more details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaComputerMiddleClickInput] Click the middle mouse button at the specified (x, y) pixel coordinate, or the
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :middle_click]
        #
        #   @param toolset_name [Symbol, :computer]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaComputerMiddleClickToolUseBlock = Beta::BetaComputerMiddleClickToolUseBlock
  end
end
