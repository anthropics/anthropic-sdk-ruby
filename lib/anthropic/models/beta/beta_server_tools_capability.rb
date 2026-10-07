# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaServerToolsCapability < Anthropic::Internal::Type::BaseModel
        # @!attribute code_execution
        #   Whether the model supports the code execution tool: true when the model supports
        #   at least one version of the tool, not necessarily every version.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :code_execution, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!attribute supported
        #   Whether this capability is supported by the model.
        #
        #   @return [Boolean]
        required :supported, Anthropic::Internal::Type::Boolean

        # @!attribute web_search
        #   Whether the model supports the web search tool: true when the model supports at
        #   least one version of the tool, not necessarily every version.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :web_search, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!method initialize(code_execution:, supported:, web_search:)
        #   Web search and code execution tool support, with one entry per tool.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaServerToolsCapability} for more details.
        #
        #   @param code_execution [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the model supports the code execution tool: true when the model supports
        #
        #   @param supported [Boolean] Whether this capability is supported by the model.
        #
        #   @param web_search [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the model supports the web search tool: true when the model supports at
      end
    end

    BetaServerToolsCapability = Beta::BetaServerToolsCapability
  end
end
