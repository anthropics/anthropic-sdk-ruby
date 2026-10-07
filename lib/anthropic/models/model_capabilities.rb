# frozen_string_literal: true

module Anthropic
  module Models
    class ModelCapabilities < Anthropic::Internal::Type::BaseModel
      # @!attribute batch
      #   Whether the model supports the Batch API.
      #
      #   @return [Anthropic::Models::CapabilitySupport]
      required :batch, -> { Anthropic::CapabilitySupport }

      # @!attribute citations
      #   Whether the model supports citation generation.
      #
      #   @return [Anthropic::Models::CapabilitySupport]
      required :citations, -> { Anthropic::CapabilitySupport }

      # @!attribute code_execution
      #   Whether code that the model runs in the code execution tool can call the
      #   request's other tools, as in programmatic tool calling and dynamic filtering for
      #   web search and web fetch. Support for the code execution tool itself is in
      #   `server_tools.code_execution`.
      #
      #   @return [Anthropic::Models::CapabilitySupport]
      required :code_execution, -> { Anthropic::CapabilitySupport }

      # @!attribute context_management
      #   Context management support and available strategies.
      #
      #   @return [Anthropic::Models::ContextManagementCapability]
      required :context_management, -> { Anthropic::ContextManagementCapability }

      # @!attribute effort
      #   Effort (reasoning_effort) support and available levels.
      #
      #   @return [Anthropic::Models::EffortCapability]
      required :effort, -> { Anthropic::EffortCapability }

      # @!attribute image_input
      #   Whether the model accepts image content blocks.
      #
      #   @return [Anthropic::Models::CapabilitySupport]
      required :image_input, -> { Anthropic::CapabilitySupport }

      # @!attribute pdf_input
      #   Whether the model accepts PDF content blocks.
      #
      #   @return [Anthropic::Models::CapabilitySupport]
      required :pdf_input, -> { Anthropic::CapabilitySupport }

      # @!attribute server_tools
      #   Whether this model supports the web search and code execution server tools.
      #   `supported` is true when the model supports at least one of the tools. A
      #   supported tool can still be rejected for your organization, for example when an
      #   admin has turned web search off.
      #
      #   @return [Anthropic::Models::ServerToolsCapability]
      required :server_tools, -> { Anthropic::ServerToolsCapability }

      # @!attribute structured_outputs
      #   Whether the model supports structured output / JSON mode / strict tool schemas.
      #
      #   @return [Anthropic::Models::CapabilitySupport]
      required :structured_outputs, -> { Anthropic::CapabilitySupport }

      # @!attribute thinking
      #   Thinking capability and supported type configurations.
      #
      #   @return [Anthropic::Models::ThinkingCapability]
      required :thinking, -> { Anthropic::ThinkingCapability }

      # @!method initialize(batch:, citations:, code_execution:, context_management:, effort:, image_input:, pdf_input:, server_tools:, structured_outputs:, thinking:)
      #   Model capability information.
      #
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::ModelCapabilities} for more details.
      #
      #   @param batch [Anthropic::Models::CapabilitySupport] Whether the model supports the Batch API.
      #
      #   @param citations [Anthropic::Models::CapabilitySupport] Whether the model supports citation generation.
      #
      #   @param code_execution [Anthropic::Models::CapabilitySupport] Whether code that the model runs in the code execution tool can call the request
      #
      #   @param context_management [Anthropic::Models::ContextManagementCapability] Context management support and available strategies.
      #
      #   @param effort [Anthropic::Models::EffortCapability] Effort (reasoning_effort) support and available levels.
      #
      #   @param image_input [Anthropic::Models::CapabilitySupport] Whether the model accepts image content blocks.
      #
      #   @param pdf_input [Anthropic::Models::CapabilitySupport] Whether the model accepts PDF content blocks.
      #
      #   @param server_tools [Anthropic::Models::ServerToolsCapability] Whether this model supports the web search and code execution server tools. `sup
      #
      #   @param structured_outputs [Anthropic::Models::CapabilitySupport] Whether the model supports structured output / JSON mode / strict tool schemas.
      #
      #   @param thinking [Anthropic::Models::ThinkingCapability] Thinking capability and supported type configurations.
    end
  end
end
