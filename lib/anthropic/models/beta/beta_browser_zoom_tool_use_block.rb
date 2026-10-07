# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserZoomToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Return a cropped screenshot of the given viewport region, scaled up for closer
        #   inspection — useful for small icons, buttons, or text. Coordinates are in the
        #   same viewport-pixel space as a full screenshot.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserZoomInput]
        required :input, -> { Anthropic::Beta::BetaBrowserZoomInput }

        # @!attribute name
        #
        #   @return [Symbol, :zoom]
        required :name, const: :zoom

        # @!attribute toolset_name
        #
        #   @return [Symbol, :browser]
        required :toolset_name, const: :browser

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

        # @!method initialize(id:, input:, caller_: nil, name: :zoom, toolset_name: :browser, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserZoomToolUseBlock} for more details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaBrowserZoomInput] Return a cropped screenshot of the given viewport region, scaled up for closer
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :zoom]
        #
        #   @param toolset_name [Symbol, :browser]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaBrowserZoomToolUseBlock = Beta::BetaBrowserZoomToolUseBlock
  end
end
