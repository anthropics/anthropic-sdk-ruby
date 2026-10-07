# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaComputerZoomToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Take a screenshot of a rectangular region. Region coordinates are in the
        #   full-screenshot space (not physical display pixels). The crop is scaled up to
        #   fill the image budget so fine details become legible.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerZoomInput]
        required :input, -> { Anthropic::Beta::BetaComputerZoomInput }

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

        # @!attribute caller_
        #   Which party invoked the tool call: the model directly, or a server tool on its
        #   behalf.
        #
        #   @return [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120, nil]
        optional :caller_, union: -> { Anthropic::Beta::BetaToolUseCaller }, api_name: :caller

        # @!method initialize(id:, input:, caller_: nil, name: :zoom, toolset_name: :computer, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaComputerZoomToolUseBlock} for more details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaComputerZoomInput] Take a screenshot of a rectangular region. Region coordinates are in the
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :zoom]
        #
        #   @param toolset_name [Symbol, :computer]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaComputerZoomToolUseBlock = Beta::BetaComputerZoomToolUseBlock
  end
end
