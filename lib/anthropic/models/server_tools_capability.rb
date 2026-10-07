# frozen_string_literal: true

module Anthropic
  module Models
    class ServerToolsCapability < Anthropic::Internal::Type::BaseModel
      # @!attribute code_execution
      #   Whether the model supports the code execution tool: true when the model supports
      #   at least one version of the tool, not necessarily every version.
      #
      #   @return [Anthropic::Models::CapabilitySupport]
      required :code_execution, -> { Anthropic::CapabilitySupport }

      # @!attribute supported
      #   Whether this capability is supported by the model.
      #
      #   @return [Boolean]
      required :supported, Anthropic::Internal::Type::Boolean

      # @!attribute web_search
      #   Whether the model supports the web search tool: true when the model supports at
      #   least one version of the tool, not necessarily every version.
      #
      #   @return [Anthropic::Models::CapabilitySupport]
      required :web_search, -> { Anthropic::CapabilitySupport }

      # @!method initialize(code_execution:, supported:, web_search:)
      #   Web search and code execution tool support, with one entry per tool.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ServerToolsCapability} for more details.
      #
      #   @param code_execution [Anthropic::Models::CapabilitySupport] Whether the model supports the code execution tool: true when the model supports
      #
      #   @param supported [Boolean] Whether this capability is supported by the model.
      #
      #   @param web_search [Anthropic::Models::CapabilitySupport] Whether the model supports the web search tool: true when the model supports at
    end
  end
end
