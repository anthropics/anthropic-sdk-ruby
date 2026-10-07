# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserLeftMouseDownToolUseBlock < Anthropic::Internal::Type::BaseModel
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
      #   Press and hold the left mouse button at a viewport coordinate. Pair with
      #   left_mouse_up to perform a custom drag.
      #
      #   @return [Anthropic::Models::BrowserLeftMouseDownInput]
      required :input, -> { Anthropic::BrowserLeftMouseDownInput }

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

      # @!method initialize(id:, caller_:, input:, name: :left_mouse_down, toolset_name: :browser, type: :tool_use)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserLeftMouseDownToolUseBlock} for more details.
      #
      #   @param id [String]
      #
      #   @param caller_ [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
      #
      #   @param input [Anthropic::Models::BrowserLeftMouseDownInput] Press and hold the left mouse button at a viewport coordinate. Pair with
      #
      #   @param name [Symbol, :left_mouse_down]
      #
      #   @param toolset_name [Symbol, :browser]
      #
      #   @param type [Symbol, :tool_use]
    end
  end
end
