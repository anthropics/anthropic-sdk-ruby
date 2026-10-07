# frozen_string_literal: true

module Anthropic
  module Models
    class ComputerDoubleClickToolUseBlock < Anthropic::Internal::Type::BaseModel
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
      #   Double-click the left mouse button at the specified (x, y) pixel coordinate, or
      #   the current cursor position if `coordinate` is omitted.
      #
      #   @return [Anthropic::Models::ComputerDoubleClickInput]
      required :input, -> { Anthropic::ComputerDoubleClickInput }

      # @!attribute name
      #
      #   @return [Symbol, :double_click]
      required :name, const: :double_click

      # @!attribute toolset_name
      #
      #   @return [Symbol, :computer]
      required :toolset_name, const: :computer

      # @!attribute type
      #
      #   @return [Symbol, :tool_use]
      required :type, const: :tool_use

      # @!method initialize(id:, caller_:, input:, name: :double_click, toolset_name: :computer, type: :tool_use)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ComputerDoubleClickToolUseBlock} for more details.
      #
      #   @param id [String]
      #
      #   @param caller_ [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
      #
      #   @param input [Anthropic::Models::ComputerDoubleClickInput] Double-click the left mouse button at the specified (x, y) pixel coordinate, or
      #
      #   @param name [Symbol, :double_click]
      #
      #   @param toolset_name [Symbol, :computer]
      #
      #   @param type [Symbol, :tool_use]
    end
  end
end
