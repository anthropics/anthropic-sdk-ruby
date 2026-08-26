# typed: strong

module Anthropic
  module Models
    BetaMessageDeltaUsage = Beta::BetaMessageDeltaUsage

    module Beta
      class BetaMessageDeltaUsage < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMessageDeltaUsage,
              Anthropic::Internal::AnyHash
            )
          end

        # The cumulative number of input tokens used to create the cache entry.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :cache_creation_input_tokens

        # The cumulative number of input tokens read from the cache.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :cache_read_input_tokens

        # Outcome of the `fallback_credit_token` presented on this request.
        sig { returns(T.nilable(Anthropic::Beta::BetaFallbackCreditUsage)) }
        attr_reader :fallback_credit

        sig do
          params(
            fallback_credit:
              T.nilable(Anthropic::Beta::BetaFallbackCreditUsage::OrHash)
          ).void
        end
        attr_writer :fallback_credit

        # The cumulative number of input tokens which were used.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :input_tokens

        # Per-iteration token usage breakdown.
        #
        # Each entry represents one sampling iteration, with its own input/output token
        # counts and cache statistics, discriminated by `type`. For `message` entries
        # (model sampling iterations, such as the turns of a server-side tool use loop),
        # this allows you to:
        #
        # - Determine which iterations exceeded long context thresholds (>=200k tokens)
        # - Calculate the context window size from the last `message` entry
        # - Understand token accumulation across server-side tool use loops
        #
        # A `compaction` entry reports the token usage of the compaction operation itself
        # — the server-side request that summarizes the context being closed — NOT the
        # size of the context that was compacted away, and its token counts can be much
        # smaller than that closed context (for example, a compaction that closes a
        # ~200k-token context can report only a few thousand tokens). Do not derive the
        # context window size from a `compaction` entry, even when it is the last entry. A
        # `compaction` entry's tokens are not included in the top-level `usage` fields.
        # When an input-token trigger is in effect (the default — 150,000 tokens unless
        # configured otherwise), each `compaction` entry closes a context that had reached
        # at least that threshold, though the context can exceed it by the final
        # iteration's output and tool results.
        sig do
          returns(
            T.nilable(
              T::Array[Anthropic::Beta::BetaIterationsUsageItem::Variants]
            )
          )
        end
        attr_accessor :iterations

        # The cumulative number of output tokens which were used.
        sig { returns(Integer) }
        attr_accessor :output_tokens

        # Breakdown of output tokens by category.
        #
        # `output_tokens` remains the inclusive, authoritative total used for billing.
        # This object provides a read-only decomposition for observability — for example,
        # how many of the billed output tokens were spent on internal reasoning that may
        # have been summarized before being returned to you.
        sig { returns(T.nilable(Anthropic::Beta::BetaOutputTokensDetails)) }
        attr_reader :output_tokens_details

        sig do
          params(
            output_tokens_details:
              T.nilable(Anthropic::Beta::BetaOutputTokensDetails::OrHash)
          ).void
        end
        attr_writer :output_tokens_details

        # The number of server tool requests.
        sig { returns(T.nilable(Anthropic::Beta::BetaServerToolUsage)) }
        attr_reader :server_tool_use

        sig do
          params(
            server_tool_use:
              T.nilable(Anthropic::Beta::BetaServerToolUsage::OrHash)
          ).void
        end
        attr_writer :server_tool_use

        sig do
          params(
            cache_creation_input_tokens: T.nilable(Integer),
            cache_read_input_tokens: T.nilable(Integer),
            fallback_credit:
              T.nilable(Anthropic::Beta::BetaFallbackCreditUsage::OrHash),
            input_tokens: T.nilable(Integer),
            iterations:
              T.nilable(
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaMessageIterationUsage::OrHash,
                    Anthropic::Beta::BetaCompactionIterationUsage::OrHash,
                    Anthropic::Beta::BetaAdvisorMessageIterationUsage::OrHash,
                    Anthropic::Beta::BetaFallbackMessageIterationUsage::OrHash
                  )
                ]
              ),
            output_tokens: Integer,
            output_tokens_details:
              T.nilable(Anthropic::Beta::BetaOutputTokensDetails::OrHash),
            server_tool_use:
              T.nilable(Anthropic::Beta::BetaServerToolUsage::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # The cumulative number of input tokens used to create the cache entry.
          cache_creation_input_tokens:,
          # The cumulative number of input tokens read from the cache.
          cache_read_input_tokens:,
          # Outcome of the `fallback_credit_token` presented on this request.
          fallback_credit:,
          # The cumulative number of input tokens which were used.
          input_tokens:,
          # Per-iteration token usage breakdown.
          #
          # Each entry represents one sampling iteration, with its own input/output token
          # counts and cache statistics, discriminated by `type`. For `message` entries
          # (model sampling iterations, such as the turns of a server-side tool use loop),
          # this allows you to:
          #
          # - Determine which iterations exceeded long context thresholds (>=200k tokens)
          # - Calculate the context window size from the last `message` entry
          # - Understand token accumulation across server-side tool use loops
          #
          # A `compaction` entry reports the token usage of the compaction operation itself
          # — the server-side request that summarizes the context being closed — NOT the
          # size of the context that was compacted away, and its token counts can be much
          # smaller than that closed context (for example, a compaction that closes a
          # ~200k-token context can report only a few thousand tokens). Do not derive the
          # context window size from a `compaction` entry, even when it is the last entry. A
          # `compaction` entry's tokens are not included in the top-level `usage` fields.
          # When an input-token trigger is in effect (the default — 150,000 tokens unless
          # configured otherwise), each `compaction` entry closes a context that had reached
          # at least that threshold, though the context can exceed it by the final
          # iteration's output and tool results.
          iterations:,
          # The cumulative number of output tokens which were used.
          output_tokens:,
          # Breakdown of output tokens by category.
          #
          # `output_tokens` remains the inclusive, authoritative total used for billing.
          # This object provides a read-only decomposition for observability — for example,
          # how many of the billed output tokens were spent on internal reasoning that may
          # have been summarized before being returned to you.
          output_tokens_details:,
          # The number of server tool requests.
          server_tool_use:
        )
        end

        sig do
          override.returns(
            {
              cache_creation_input_tokens: T.nilable(Integer),
              cache_read_input_tokens: T.nilable(Integer),
              fallback_credit:
                T.nilable(Anthropic::Beta::BetaFallbackCreditUsage),
              input_tokens: T.nilable(Integer),
              iterations:
                T.nilable(
                  T::Array[Anthropic::Beta::BetaIterationsUsageItem::Variants]
                ),
              output_tokens: Integer,
              output_tokens_details:
                T.nilable(Anthropic::Beta::BetaOutputTokensDetails),
              server_tool_use: T.nilable(Anthropic::Beta::BetaServerToolUsage)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
