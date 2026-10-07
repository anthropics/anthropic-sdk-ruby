# frozen_string_literal: true

module Anthropic
  module Models
    class BrowserReadNetworkToolUseBlock < Anthropic::Internal::Type::BaseModel
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
      #   Return the network requests (method, URL, status, MIME type, timing) recorded
      #   since the driver attached to the tab and since the last read, one line per
      #   entry. An empty result does not mean no traffic for a tab that predates attach.
      #
      #   @return [Anthropic::Models::BrowserReadNetworkInput]
      required :input, -> { Anthropic::BrowserReadNetworkInput }

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

      # @!method initialize(id:, caller_:, input:, name: :read_network, toolset_name: :browser, type: :tool_use)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BrowserReadNetworkToolUseBlock} for more details.
      #
      #   @param id [String]
      #
      #   @param caller_ [Anthropic::Models::DirectCaller, Anthropic::Models::ServerToolCaller, Anthropic::Models::ServerToolCaller20260120] Which party invoked the tool call: the model directly, or a server tool on its b
      #
      #   @param input [Anthropic::Models::BrowserReadNetworkInput] Return the network requests (method, URL, status, MIME type, timing) recorded
      #
      #   @param name [Symbol, :read_network]
      #
      #   @param toolset_name [Symbol, :browser]
      #
      #   @param type [Symbol, :tool_use]
    end
  end
end
