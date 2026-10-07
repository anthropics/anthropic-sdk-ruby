# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaComputerScreenshotToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Take a screenshot of the screen.
        #
        #   @return [Anthropic::Models::Beta::BetaComputerScreenshotInput]
        required :input, -> { Anthropic::Beta::BetaComputerScreenshotInput }

        # @!attribute name
        #
        #   @return [Symbol, :screenshot]
        required :name, const: :screenshot

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

        # @!method initialize(id:, input:, caller_: nil, name: :screenshot, toolset_name: :computer, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaComputerScreenshotToolUseBlock} for more details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaComputerScreenshotInput] Take a screenshot of the screen.
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :screenshot]
        #
        #   @param toolset_name [Symbol, :computer]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaComputerScreenshotToolUseBlock = Beta::BetaComputerScreenshotToolUseBlock
  end
end
