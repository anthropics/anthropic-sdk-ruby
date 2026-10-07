# frozen_string_literal: true

module Anthropic
  module Models
    class ComputerLeftMouseDownToolUseBlock < Anthropic::Internal::Type::BaseModel
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
      #   Press and hold the left mouse button at the current cursor position.
      #
      #   @return [Anthropic::Models::ComputerLeftMouseDownInput]
      required :input, -> { Anthropic::ComputerLeftMouseDownInput }

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

      # @!method initialize(id:, caller_:, input:, name: :left_mouse_down, toolset_name: :computer, type: :tool_use)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ComputerLeftMouseDownToolUseBlock} for more details.
      #
      #   @param id [String]
      #
      #   @param caller_ [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
      #
      #   @param input [Anthropic::Models::ComputerLeftMouseDownInput] Press and hold the left mouse button at the current cursor position.
      #
      #   @param name [Symbol, :left_mouse_down]
      #
      #   @param toolset_name [Symbol, :computer]
      #
      #   @param type [Symbol, :tool_use]
    end
  end
end
