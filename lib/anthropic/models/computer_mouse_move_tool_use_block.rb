# frozen_string_literal: true

module Anthropic
  module Models
    class ComputerMouseMoveToolUseBlock < Anthropic::Internal::Type::BaseModel
      # @!attribute id
      #
      #   @return [String]
      required :id, String

      # @!attribute caller_
      #   Which party invoked the tool call: the model directly, or a server tool on its
      #   behalf.
      #
      #   @return [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120]
      required :caller_, union: -> { Anthropic::ToolUseCaller }, api_name: :caller

      # @!attribute input
      #   Move the cursor to a specified (x, y) pixel coordinate. Use this ONLY to hover
      #   without clicking; otherwise use a click action directly.
      #
      #   @return [Anthropic::Models::ComputerMouseMoveInput]
      required :input, -> { Anthropic::ComputerMouseMoveInput }

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

      # @!method initialize(id:, caller_:, input:, name: :mouse_move, toolset_name: :computer, type: :tool_use)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ComputerMouseMoveToolUseBlock} for more details.
      #
      #   @param id [String]
      #
      #   @param caller_ [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
      #
      #   @param input [Anthropic::Models::ComputerMouseMoveInput] Move the cursor to a specified (x, y) pixel coordinate. Use this ONLY to hover
      #
      #   @param name [Symbol, :mouse_move]
      #
      #   @param toolset_name [Symbol, :computer]
      #
      #   @param type [Symbol, :tool_use]
    end
  end
end
