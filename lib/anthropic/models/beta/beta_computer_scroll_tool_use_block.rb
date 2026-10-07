# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaComputerScrollToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Scroll the screen at the specified (x, y) pixel coordinate, or the current
        #   cursor position if `coordinate` is omitted. Do NOT use PageUp/PageDown to
        #   scroll.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerScrollInput]
        required :input, -> { Anthropic::Beta::BetaComputerScrollInput }

        # @!attribute name
        #
        #   @return [Symbol, :scroll]
        required :name, const: :scroll

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

        # @!method initialize(id:, input:, caller_: nil, name: :scroll, toolset_name: :computer, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaComputerScrollToolUseBlock} for more details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaComputerScrollInput] Scroll the screen at the specified (x, y) pixel coordinate, or the current curso
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :scroll]
        #
        #   @param toolset_name [Symbol, :computer]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaComputerScrollToolUseBlock = Beta::BetaComputerScrollToolUseBlock
  end
end
