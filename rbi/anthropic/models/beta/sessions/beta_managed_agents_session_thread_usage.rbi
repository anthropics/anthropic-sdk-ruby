# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSessionThreadUsage < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSessionThreadUsage,
                Anthropic::Internal::AnyHash
              )
            end

          # Cumulative time in seconds this thread spent in running status. Equal to
          # `stats.active_seconds`; surfaced here so a thread's usage carries every quantity
          # its cost is priced on.
          sig { returns(T.nilable(Float)) }
          attr_reader :active_seconds

          sig { params(active_seconds: Float).void }
          attr_writer :active_seconds

          # Prompt-cache creation token usage broken down by cache lifetime.
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

          # A monetary amount in a specific currency.
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

          # Cumulative count of server-executed tool invocations, broken down by tool.
          sig do
            returns(
              T.nilable(Anthropic::Beta::BetaManagedAgentsServerToolUsage)
            )
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

          # Cumulative token usage for a session thread across all turns.
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
            # Cumulative time in seconds this thread spent in running status. Equal to
            # `stats.active_seconds`; surfaced here so a thread's usage carries every quantity
            # its cost is priced on.
            active_seconds: nil,
            # Prompt-cache creation token usage broken down by cache lifetime.
            cache_creation: nil,
            # Total tokens read from prompt cache.
            cache_read_input_tokens: nil,
            # Total input tokens consumed across all turns.
            input_tokens: nil,
            # A monetary amount in a specific currency.
            list_cost: nil,
            # Total output tokens generated across all turns.
            output_tokens: nil,
            # Cumulative count of server-executed tool invocations, broken down by tool.
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
end
