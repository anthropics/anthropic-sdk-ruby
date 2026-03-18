# typed: strong

module Anthropic
  module Models
    class ModelCapabilities < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::ModelCapabilities, Anthropic::Internal::AnyHash)
        end

      # Whether the model supports the Batch API.
      sig { returns(Anthropic::CapabilitySupport) }
      attr_reader :batch

      sig { params(batch: Anthropic::CapabilitySupport::OrHash).void }
      attr_writer :batch

      # Whether the model supports citation generation.
      sig { returns(Anthropic::CapabilitySupport) }
      attr_reader :citations

      sig { params(citations: Anthropic::CapabilitySupport::OrHash).void }
      attr_writer :citations

      # Whether the model supports code execution tools.
      sig { returns(Anthropic::CapabilitySupport) }
      attr_reader :code_execution

      sig { params(code_execution: Anthropic::CapabilitySupport::OrHash).void }
      attr_writer :code_execution

      # Context management support and available strategies.
      sig { returns(Anthropic::ContextManagementCapability) }
      attr_reader :context_management

      sig do
        params(
          context_management: Anthropic::ContextManagementCapability::OrHash
        ).void
      end
      attr_writer :context_management

      # Effort (reasoning_effort) support and available levels.
      sig { returns(Anthropic::EffortCapability) }
      attr_reader :effort

      sig { params(effort: Anthropic::EffortCapability::OrHash).void }
      attr_writer :effort

      # Whether the model accepts image content blocks.
      sig { returns(Anthropic::CapabilitySupport) }
      attr_reader :image_input

      sig { params(image_input: Anthropic::CapabilitySupport::OrHash).void }
      attr_writer :image_input

      # Whether the model accepts PDF content blocks.
      sig { returns(Anthropic::CapabilitySupport) }
      attr_reader :pdf_input

      sig { params(pdf_input: Anthropic::CapabilitySupport::OrHash).void }
      attr_writer :pdf_input

      # Whether the model supports structured output / JSON mode / strict tool schemas.
      sig { returns(Anthropic::CapabilitySupport) }
      attr_reader :structured_outputs

      sig do
        params(structured_outputs: Anthropic::CapabilitySupport::OrHash).void
      end
      attr_writer :structured_outputs

      # Thinking capability and supported type configurations.
      sig { returns(Anthropic::ThinkingCapability) }
      attr_reader :thinking

      sig { params(thinking: Anthropic::ThinkingCapability::OrHash).void }
      attr_writer :thinking

      # Model capability information.
      sig do
        params(
          batch: Anthropic::CapabilitySupport::OrHash,
          citations: Anthropic::CapabilitySupport::OrHash,
          code_execution: Anthropic::CapabilitySupport::OrHash,
          context_management: Anthropic::ContextManagementCapability::OrHash,
          effort: Anthropic::EffortCapability::OrHash,
          image_input: Anthropic::CapabilitySupport::OrHash,
          pdf_input: Anthropic::CapabilitySupport::OrHash,
          structured_outputs: Anthropic::CapabilitySupport::OrHash,
          thinking: Anthropic::ThinkingCapability::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Whether the model supports the Batch API.
        batch:,
        # Whether the model supports citation generation.
        citations:,
        # Whether the model supports code execution tools.
        code_execution:,
        # Context management support and available strategies.
        context_management:,
        # Effort (reasoning_effort) support and available levels.
        effort:,
        # Whether the model accepts image content blocks.
        image_input:,
        # Whether the model accepts PDF content blocks.
        pdf_input:,
        # Whether the model supports structured output / JSON mode / strict tool schemas.
        structured_outputs:,
        # Thinking capability and supported type configurations.
        thinking:
      )
      end

      sig do
        override.returns(
          {
            batch: Anthropic::CapabilitySupport,
            citations: Anthropic::CapabilitySupport,
            code_execution: Anthropic::CapabilitySupport,
            context_management: Anthropic::ContextManagementCapability,
            effort: Anthropic::EffortCapability,
            image_input: Anthropic::CapabilitySupport,
            pdf_input: Anthropic::CapabilitySupport,
            structured_outputs: Anthropic::CapabilitySupport,
            thinking: Anthropic::ThinkingCapability
          }
        )
      end
      def to_hash
      end
    end
  end
end
