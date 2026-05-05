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

          # Total output tokens generated across all turns.
          sig { returns(T.nilable(Integer)) }
          attr_reader :output_tokens

          sig { params(output_tokens: Integer).void }
          attr_writer :output_tokens

          # Cumulative token usage for a session thread across all turns.
          sig do
            params(
              cache_creation:
                Anthropic::Beta::BetaManagedAgentsCacheCreationUsage::OrHash,
              cache_read_input_tokens: Integer,
              input_tokens: Integer,
              output_tokens: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Prompt-cache creation token usage broken down by cache lifetime.
            cache_creation: nil,
            # Total tokens read from prompt cache.
            cache_read_input_tokens: nil,
            # Total input tokens consumed across all turns.
            input_tokens: nil,
            # Total output tokens generated across all turns.
            output_tokens: nil
          )
          end

          sig do
            override.returns(
              {
                cache_creation:
                  Anthropic::Beta::BetaManagedAgentsCacheCreationUsage,
                cache_read_input_tokens: Integer,
                input_tokens: Integer,
                output_tokens: Integer
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
