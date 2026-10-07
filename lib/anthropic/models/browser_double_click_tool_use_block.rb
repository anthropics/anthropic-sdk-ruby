# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserDoubleClickToolUseBlock < Anthropic::Internal::Type::BaseModel
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
      #   Double left-click at a viewport coordinate or on an element by reference.
      #
      #   @return [Anthropic::Models::BrowserDoubleClickInput]
      required :input, -> { Anthropic::BrowserDoubleClickInput }

      # @!attribute name
      #
      #   @return [Symbol, :double_click]
      required :name, const: :double_click

      # @!attribute toolset_name
      #
      #   @return [Symbol, :browser]
      required :toolset_name, const: :browser

      # @!attribute type
      #
      #   @return [Symbol, :tool_use]
      required :type, const: :tool_use

      # @!method initialize(id:, caller_:, input:, name: :double_click, toolset_name: :browser, type: :tool_use)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserDoubleClickToolUseBlock} for more details.
      #
      #   @param id [String]
      #
      #   @param caller_ [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
      #
      #   @param input [Anthropic::Models::BrowserDoubleClickInput] Double left-click at a viewport coordinate or on an element by reference.
      #
      #   @param name [Symbol, :double_click]
      #
      #   @param toolset_name [Symbol, :browser]
      #
      #   @param type [Symbol, :tool_use]
    end
  end
end
