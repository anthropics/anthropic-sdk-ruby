# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          class BetaAnalyticsUsageMetrics < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageMetrics,
                  Anthropic::Internal::AnyHash
                )
              end

            # The number of input tokens for cache creation.
            sig { returns(Anthropic::Beta::BetaCacheCreation) }
            attr_reader :cache_creation

            sig do
              params(
                cache_creation: Anthropic::Beta::BetaCacheCreation::OrHash
              ).void
            end
            attr_writer :cache_creation

            # The number of input tokens read from the cache.
            sig { returns(Integer) }
            attr_accessor :cache_read_input_tokens

            # The number of output tokens generated.
            sig { returns(Integer) }
            attr_accessor :output_tokens

            # Number of API requests in this row's scope. For sandbox / code-execution events,
            # this counts execution spans rather than HTTP requests (these rows surface with
            # `product: null`).
            sig { returns(T.nilable(Integer)) }
            attr_accessor :requests

            # Server-side tool usage metrics.
            sig do
              returns(Anthropic::Beta::Organization::BetaAnalyticsServerToolUse)
            end
            attr_reader :server_tool_use

            sig do
              params(
                server_tool_use:
                  Anthropic::Beta::Organization::BetaAnalyticsServerToolUse::OrHash
              ).void
            end
            attr_writer :server_tool_use

            # Total token count across all token types. This is the value the default
            # `order_by` (`total_tokens`) sorts on.
            sig { returns(Integer) }
            attr_accessor :total_tokens

            # The number of uncached input tokens processed.
            sig { returns(Integer) }
            attr_accessor :uncached_input_tokens

            # The token usage of one row.
            sig do
              params(
                cache_creation: Anthropic::Beta::BetaCacheCreation::OrHash,
                cache_read_input_tokens: Integer,
                output_tokens: Integer,
                requests: T.nilable(Integer),
                server_tool_use:
                  Anthropic::Beta::Organization::BetaAnalyticsServerToolUse::OrHash,
                total_tokens: Integer,
                uncached_input_tokens: Integer
              ).returns(T.attached_class)
            end
            def self.new(
              # The number of input tokens for cache creation.
              cache_creation:,
              # The number of input tokens read from the cache.
              cache_read_input_tokens:,
              # The number of output tokens generated.
              output_tokens:,
              # Number of API requests in this row's scope. For sandbox / code-execution events,
              # this counts execution spans rather than HTTP requests (these rows surface with
              # `product: null`).
              requests:,
              # Server-side tool usage metrics.
              server_tool_use:,
              # Total token count across all token types. This is the value the default
              # `order_by` (`total_tokens`) sorts on.
              total_tokens:,
              # The number of uncached input tokens processed.
              uncached_input_tokens:
            )
            end

            sig do
              override.returns(
                {
                  cache_creation: Anthropic::Beta::BetaCacheCreation,
                  cache_read_input_tokens: Integer,
                  output_tokens: Integer,
                  requests: T.nilable(Integer),
                  server_tool_use:
                    Anthropic::Beta::Organization::BetaAnalyticsServerToolUse,
                  total_tokens: Integer,
                  uncached_input_tokens: Integer
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
