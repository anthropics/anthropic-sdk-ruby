# typed: strong

module Anthropic
  module Models
    BetaModelCapabilities = Beta::BetaModelCapabilities

    module Beta
      class BetaModelCapabilities < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaModelCapabilities,
              Anthropic::Internal::AnyHash
            )
          end

        # Whether the model supports the Batch API.
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :batch

        sig do
          params(batch: Anthropic::Beta::BetaCapabilitySupport::OrHash).void
        end
        attr_writer :batch

        # Whether the model supports citation generation.
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :citations

        sig do
          params(citations: Anthropic::Beta::BetaCapabilitySupport::OrHash).void
        end
        attr_writer :citations

        # Whether code that the model runs in the code execution tool can call the
        # request's other tools, as in programmatic tool calling and dynamic filtering for
        # web search and web fetch. Support for the code execution tool itself is in
        # `server_tools.code_execution`.
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :code_execution

        sig do
          params(
            code_execution: Anthropic::Beta::BetaCapabilitySupport::OrHash
          ).void
        end
        attr_writer :code_execution

        # Server-side compaction support (the top-level `compaction` parameter) and the
        # accepted `compaction.type` values.
        sig { returns(T.nilable(Anthropic::Beta::BetaCompactionCapability)) }
        attr_reader :compaction

        sig do
          params(
            compaction:
              T.nilable(Anthropic::Beta::BetaCompactionCapability::OrHash)
          ).void
        end
        attr_writer :compaction

        # Context management support and available strategies.
        sig { returns(Anthropic::Beta::BetaContextManagementCapability) }
        attr_reader :context_management

        sig do
          params(
            context_management:
              Anthropic::Beta::BetaContextManagementCapability::OrHash
          ).void
        end
        attr_writer :context_management

        # Effort (reasoning_effort) support and available levels.
        sig { returns(Anthropic::Beta::BetaEffortCapability) }
        attr_reader :effort

        sig do
          params(effort: Anthropic::Beta::BetaEffortCapability::OrHash).void
        end
        attr_writer :effort

        # Whether the model accepts image content blocks.
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :image_input

        sig do
          params(
            image_input: Anthropic::Beta::BetaCapabilitySupport::OrHash
          ).void
        end
        attr_writer :image_input

        # Whether the model accepts PDF content blocks.
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :pdf_input

        sig do
          params(pdf_input: Anthropic::Beta::BetaCapabilitySupport::OrHash).void
        end
        attr_writer :pdf_input

        # Whether this model supports the web search and code execution server tools.
        # `supported` is true when the model supports at least one of the tools. A
        # supported tool can still be rejected for your organization, for example when an
        # admin has turned web search off.
        sig { returns(Anthropic::Beta::BetaServerToolsCapability) }
        attr_reader :server_tools

        sig do
          params(
            server_tools: Anthropic::Beta::BetaServerToolsCapability::OrHash
          ).void
        end
        attr_writer :server_tools

        # Whether the model supports structured output / JSON mode / strict tool schemas.
        sig { returns(Anthropic::Beta::BetaCapabilitySupport) }
        attr_reader :structured_outputs

        sig do
          params(
            structured_outputs: Anthropic::Beta::BetaCapabilitySupport::OrHash
          ).void
        end
        attr_writer :structured_outputs

        # Thinking capability and supported type configurations.
        sig { returns(Anthropic::Beta::BetaThinkingCapability) }
        attr_reader :thinking

        sig do
          params(thinking: Anthropic::Beta::BetaThinkingCapability::OrHash).void
        end
        attr_writer :thinking

        # Model capability information.
        sig do
          params(
            batch: Anthropic::Beta::BetaCapabilitySupport::OrHash,
            citations: Anthropic::Beta::BetaCapabilitySupport::OrHash,
            code_execution: Anthropic::Beta::BetaCapabilitySupport::OrHash,
            compaction:
              T.nilable(Anthropic::Beta::BetaCompactionCapability::OrHash),
            context_management:
              Anthropic::Beta::BetaContextManagementCapability::OrHash,
            effort: Anthropic::Beta::BetaEffortCapability::OrHash,
            image_input: Anthropic::Beta::BetaCapabilitySupport::OrHash,
            pdf_input: Anthropic::Beta::BetaCapabilitySupport::OrHash,
            server_tools: Anthropic::Beta::BetaServerToolsCapability::OrHash,
            structured_outputs: Anthropic::Beta::BetaCapabilitySupport::OrHash,
            thinking: Anthropic::Beta::BetaThinkingCapability::OrHash
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the model supports the Batch API.
          batch:,
          # Whether the model supports citation generation.
          citations:,
          # Whether code that the model runs in the code execution tool can call the
          # request's other tools, as in programmatic tool calling and dynamic filtering for
          # web search and web fetch. Support for the code execution tool itself is in
          # `server_tools.code_execution`.
          code_execution:,
          # Server-side compaction support (the top-level `compaction` parameter) and the
          # accepted `compaction.type` values.
          compaction:,
          # Context management support and available strategies.
          context_management:,
          # Effort (reasoning_effort) support and available levels.
          effort:,
          # Whether the model accepts image content blocks.
          image_input:,
          # Whether the model accepts PDF content blocks.
          pdf_input:,
          # Whether this model supports the web search and code execution server tools.
          # `supported` is true when the model supports at least one of the tools. A
          # supported tool can still be rejected for your organization, for example when an
          # admin has turned web search off.
          server_tools:,
          # Whether the model supports structured output / JSON mode / strict tool schemas.
          structured_outputs:,
          # Thinking capability and supported type configurations.
          thinking:
        )
        end

        sig do
          override.returns(
            {
              batch: Anthropic::Beta::BetaCapabilitySupport,
              citations: Anthropic::Beta::BetaCapabilitySupport,
              code_execution: Anthropic::Beta::BetaCapabilitySupport,
              compaction: T.nilable(Anthropic::Beta::BetaCompactionCapability),
              context_management:
                Anthropic::Beta::BetaContextManagementCapability,
              effort: Anthropic::Beta::BetaEffortCapability,
              image_input: Anthropic::Beta::BetaCapabilitySupport,
              pdf_input: Anthropic::Beta::BetaCapabilitySupport,
              server_tools: Anthropic::Beta::BetaServerToolsCapability,
              structured_outputs: Anthropic::Beta::BetaCapabilitySupport,
              thinking: Anthropic::Beta::BetaThinkingCapability
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
