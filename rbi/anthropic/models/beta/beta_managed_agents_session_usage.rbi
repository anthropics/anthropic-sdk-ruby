# typed: strong

module Anthropic
  module Models
    BetaManagedAgentsSessionUsage = Beta::BetaManagedAgentsSessionUsage

    module Beta
      class BetaManagedAgentsSessionUsage < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaManagedAgentsSessionUsage,
              Anthropic::Internal::AnyHash
            )
          end

        # Cumulative time in seconds during which the session had at least one thread in
        # running status. Overlapping activity from concurrent threads is counted once,
        # unlike `stats.active_seconds`, which sums each thread's own active time. This is
        # the duration the session's runtime cost is priced on.
        sig { returns(T.nilable(Float)) }
        attr_reader :active_seconds

        sig { params(active_seconds: Float).void }
        attr_writer :active_seconds

        # Tokens used to create prompt cache entries, broken down by cache TTL.
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaManagedAgentsCacheCreationUsage)
          )
        end
        attr_reader :cache_creation

        sig do
          params(
            cache_creation:
              Anthropic::Beta::BetaManagedAgentsCacheCreationUsage::OrHash
          ).void
        end
        attr_writer :cache_creation

        # Total tokens read from prompt cache.
        sig { returns(T.nilable(Integer)) }
        attr_reader :cache_read_input_tokens

        sig { params(cache_read_input_tokens: Integer).void }
        attr_writer :cache_read_input_tokens

        # Total input tokens consumed across all turns.
        sig { returns(T.nilable(Integer)) }
        attr_reader :input_tokens

        sig { params(input_tokens: Integer).void }
        attr_writer :input_tokens

        # Cumulative list cost of the session across all turns, priced at public list
        # rates. Absent until cost tracking is available for the session.
        sig { returns(T.nilable(Anthropic::BetaMonetaryAmount)) }
        attr_reader :list_cost

        sig do
          params(
            list_cost: T.nilable(Anthropic::BetaMonetaryAmount::OrHash)
          ).void
        end
        attr_writer :list_cost

        # Total output tokens generated across all turns.
        sig { returns(T.nilable(Integer)) }
        attr_reader :output_tokens

        sig { params(output_tokens: Integer).void }
        attr_writer :output_tokens

        # Cumulative server-executed tool usage across all turns. Absent until server-tool
        # tracking is available for the session.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaManagedAgentsServerToolUsage))
        end
        attr_reader :server_tool_use

        sig do
          params(
            server_tool_use:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsServerToolUsage::OrHash
              )
          ).void
        end
        attr_writer :server_tool_use

        # Cumulative token usage for a session across all turns.
        sig do
          params(
            active_seconds: Float,
            cache_creation:
              Anthropic::Beta::BetaManagedAgentsCacheCreationUsage::OrHash,
            cache_read_input_tokens: Integer,
            input_tokens: Integer,
            list_cost: T.nilable(Anthropic::BetaMonetaryAmount::OrHash),
            output_tokens: Integer,
            server_tool_use:
              T.nilable(
                Anthropic::Beta::BetaManagedAgentsServerToolUsage::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # Cumulative time in seconds during which the session had at least one thread in
          # running status. Overlapping activity from concurrent threads is counted once,
          # unlike `stats.active_seconds`, which sums each thread's own active time. This is
          # the duration the session's runtime cost is priced on.
          active_seconds: nil,
          # Tokens used to create prompt cache entries, broken down by cache TTL.
          cache_creation: nil,
          # Total tokens read from prompt cache.
          cache_read_input_tokens: nil,
          # Total input tokens consumed across all turns.
          input_tokens: nil,
          # Cumulative list cost of the session across all turns, priced at public list
          # rates. Absent until cost tracking is available for the session.
          list_cost: nil,
          # Total output tokens generated across all turns.
          output_tokens: nil,
          # Cumulative server-executed tool usage across all turns. Absent until server-tool
          # tracking is available for the session.
          server_tool_use: nil
        )
        end

        sig do
          override.returns(
            {
              active_seconds: Float,
              cache_creation:
                Anthropic::Beta::BetaManagedAgentsCacheCreationUsage,
              cache_read_input_tokens: Integer,
              input_tokens: Integer,
              list_cost: T.nilable(Anthropic::BetaMonetaryAmount),
              output_tokens: Integer,
              server_tool_use:
                T.nilable(Anthropic::Beta::BetaManagedAgentsServerToolUsage)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
