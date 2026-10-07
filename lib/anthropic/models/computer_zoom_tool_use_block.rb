# frozen_string_literal: true

module Anthropic
  module Models
    class ComputerZoomToolUseBlock < Anthropic::Internal::Type::BaseModel
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
      #   Take a screenshot of a rectangular region. Region coordinates are in the
      #   full-screenshot space (not physical display pixels). The crop is scaled up to
      #   fill the image budget so fine details become legible.
      #
      #   @return [Anthropic::Models::ComputerZoomInput]
      required :input, -> { Anthropic::ComputerZoomInput }

      # @!attribute name
      #
      #   @return [Symbol, :zoom]
      required :name, const: :zoom

      # @!attribute toolset_name
      #
      #   @return [Symbol, :computer]
      required :toolset_name, const: :computer

      # @!attribute type
      #
      #   @return [Symbol, :tool_use]
      required :type, const: :tool_use

      # @!method initialize(id:, caller_:, input:, name: :zoom, toolset_name: :computer, type: :tool_use)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ComputerZoomToolUseBlock} for more details.
      #
      #   @param id [String]
      #
      #   @param caller_ [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
      #
      #   @param input [Anthropic::Models::ComputerZoomInput] Take a screenshot of a rectangular region. Region coordinates are in the
      #
      #   @param name [Symbol, :zoom]
      #
      #   @param toolset_name [Symbol, :computer]
      #
      #   @param type [Symbol, :tool_use]
    end
  end
end
