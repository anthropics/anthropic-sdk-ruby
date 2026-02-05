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

        # The cumulative number of input tokens which were used.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :input_tokens

        # Per-iteration token usage breakdown.
        #
        # Each entry represents one sampling iteration, with its own input/output token
        # counts and cache statistics. This allows you to:
        #
        # - Determine which iterations exceeded long context thresholds (>=200k tokens)
        # - Calculate the true context window size from the last iteration
        # - Understand token accumulation across server-side tool use loops
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
            input_tokens: T.nilable(Integer),
            iterations:
              T.nilable(
                T::Array[
                  T.any(
                    Anthropic::Beta::BetaMessageIterationUsage::OrHash,
                    Anthropic::Beta::BetaCompactionIterationUsage::OrHash
                  )
                ]
              ),
            output_tokens: Integer,
            server_tool_use:
              T.nilable(Anthropic::Beta::BetaServerToolUsage::OrHash)
          ).returns(T.attached_class)
        end
        def self.new(
          # The cumulative number of input tokens used to create the cache entry.
          cache_creation_input_tokens:,
          # The cumulative number of input tokens read from the cache.
          cache_read_input_tokens:,
          # The cumulative number of input tokens which were used.
          input_tokens:,
          # Per-iteration token usage breakdown.
          #
          # Each entry represents one sampling iteration, with its own input/output token
          # counts and cache statistics. This allows you to:
          #
          # - Determine which iterations exceeded long context thresholds (>=200k tokens)
          # - Calculate the true context window size from the last iteration
          # - Understand token accumulation across server-side tool use loops
          iterations:,
          # The cumulative number of output tokens which were used.
          output_tokens:,
          # The number of server tool requests.
          server_tool_use:
        )
        end

        sig do
          override.returns(
            {
              cache_creation_input_tokens: T.nilable(Integer),
              cache_read_input_tokens: T.nilable(Integer),
              input_tokens: T.nilable(Integer),
              iterations:
                T.nilable(
                  T::Array[Anthropic::Beta::BetaIterationsUsageItem::Variants]
                ),
              output_tokens: Integer,
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
