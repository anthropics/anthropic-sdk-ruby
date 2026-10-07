# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaComputerMouseMoveToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Move the cursor to a specified (x, y) pixel coordinate. Use this ONLY to hover
        #   without clicking; otherwise use a click action directly.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerMouseMoveInput]
        required :input, -> { Anthropic::Beta::BetaComputerMouseMoveInput }

        # @!attribute name
        #
        #   @return [Symbol, :mouse_move]
        required :name, const: :mouse_move

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

        # @!method initialize(id:, input:, caller_: nil, name: :mouse_move, toolset_name: :computer, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaComputerMouseMoveToolUseBlock} for more details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaComputerMouseMoveInput] Move the cursor to a specified (x, y) pixel coordinate. Use this ONLY to hover
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :mouse_move]
        #
        #   @param toolset_name [Symbol, :computer]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaComputerMouseMoveToolUseBlock = Beta::BetaComputerMouseMoveToolUseBlock
  end
end
