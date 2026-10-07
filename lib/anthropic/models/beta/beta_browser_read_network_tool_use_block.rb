# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserReadNetworkToolUseBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #
        #   @return [String]
        required :id, String

        # @!attribute input
        #   Return the network requests (method, URL, status, MIME type, timing) recorded
        #   since the driver attached to the tab and since the last read, one line per
        #   entry. An empty result does not mean no traffic for a tab that predates attach.
        #
        #   @return [Anthropic::Models::Beta::BetaBrowserReadNetworkInput]
        required :input, -> { Anthropic::Beta::BetaBrowserReadNetworkInput }

        # @!attribute name
        #
        #   @return [Symbol, :read_network]
        required :name, const: :read_network

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

        # @!method initialize(id:, input:, caller_: nil, name: :read_network, toolset_name: :browser, type: :tool_use)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaBrowserReadNetworkToolUseBlock} for more details.
        #
        #   @param id [String]
        #
        #   @param input [Anthropic::Models::Beta::BetaBrowserReadNetworkInput] Return the network requests (method, URL, status, MIME type, timing) recorded
        #
        #   @param caller_ [Anthropic::Models::Beta::BetaDirectCaller, Anthropic::Models::Beta::BetaServerToolCaller, Anthropic::Models::Beta::BetaServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
        #
        #   @param name [Symbol, :read_network]
        #
        #   @param toolset_name [Symbol, :browser]
        #
        #   @param type [Symbol, :tool_use]
      end
    end

    BetaBrowserReadNetworkToolUseBlock = Beta::BetaBrowserReadNetworkToolUseBlock
  end
end
