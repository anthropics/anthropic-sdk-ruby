# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaModelCapabilities < Anthropic::Internal::Type::BaseModel
        # @!attribute batch
        #   Whether the model supports the Batch API.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :batch, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!attribute citations
        #   Whether the model supports citation generation.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :citations, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!attribute code_execution
        #   Whether the model supports code execution tools.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :code_execution, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!attribute context_management
        #   Context management support and available strategies.
        #
        #   @return [Anthropic::Models::Beta::BetaContextManagementCapability]
        required :context_management, -> { Anthropic::Beta::BetaContextManagementCapability }

        # @!attribute effort
        #   Effort (reasoning_effort) support and available levels.
        #
        #   @return [Anthropic::Models::Beta::BetaEffortCapability]
        required :effort, -> { Anthropic::Beta::BetaEffortCapability }

        # @!attribute image_input
        #   Whether the model accepts image content blocks.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :image_input, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!attribute pdf_input
        #   Whether the model accepts PDF content blocks.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :pdf_input, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!attribute structured_outputs
        #   Whether the model supports structured output / JSON mode / strict tool schemas.
        #
        #   @return [Anthropic::Models::Beta::BetaCapabilitySupport]
        required :structured_outputs, -> { Anthropic::Beta::BetaCapabilitySupport }

        # @!attribute thinking
        #   Thinking capability and supported type configurations.
        #
        #   @return [Anthropic::Models::Beta::BetaThinkingCapability]
        required :thinking, -> { Anthropic::Beta::BetaThinkingCapability }

        # @!method initialize(batch:, citations:, code_execution:, context_management:, effort:, image_input:, pdf_input:, structured_outputs:, thinking:)
        #   Model capability information.
        #
        #   @param batch [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the model supports the Batch API.
        #
        #   @param citations [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the model supports citation generation.
        #
        #   @param code_execution [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the model supports code execution tools.
        #
        #   @param context_management [Anthropic::Models::Beta::BetaContextManagementCapability] Context management support and available strategies.
        #
        #   @param effort [Anthropic::Models::Beta::BetaEffortCapability] Effort (reasoning_effort) support and available levels.
        #
        #   @param image_input [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the model accepts image content blocks.
        #
        #   @param pdf_input [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the model accepts PDF content blocks.
        #
        #   @param structured_outputs [Anthropic::Models::Beta::BetaCapabilitySupport] Whether the model supports structured output / JSON mode / strict tool schemas.
        #
        #   @param thinking [Anthropic::Models::Beta::BetaThinkingCapability] Thinking capability and supported type configurations.
      end
    end

    BetaModelCapabilities = Beta::BetaModelCapabilities
  end
end
