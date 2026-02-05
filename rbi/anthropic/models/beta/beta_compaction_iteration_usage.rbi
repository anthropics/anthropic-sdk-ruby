# typed: strong

module Anthropic
  module Models
    BetaCompactionIterationUsage = Beta::BetaCompactionIterationUsage

    module Beta
      class BetaCompactionIterationUsage < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaCompactionIterationUsage,
              Anthropic::Internal::AnyHash
            )
          end

        # Breakdown of cached tokens by TTL
        sig { returns(T.nilable(Anthropic::Beta::BetaCacheCreation)) }
        attr_reader :cache_creation

        sig do
          params(
            cache_creation:
              T.nilable(Anthropic::Beta::BetaCacheCreation::OrHash)
          ).void
        end
        attr_writer :cache_creation

        # The number of input tokens used to create the cache entry.
        sig { returns(Integer) }
        attr_accessor :cache_creation_input_tokens

        # The number of input tokens read from the cache.
        sig { returns(Integer) }
        attr_accessor :cache_read_input_tokens

        # The number of input tokens which were used.
        sig { returns(Integer) }
        attr_accessor :input_tokens

        # The number of output tokens which were used.
        sig { returns(Integer) }
        attr_accessor :output_tokens

        # Usage for a compaction iteration
        sig { returns(Symbol) }
        attr_accessor :type

        # Token usage for a compaction iteration.
        sig do
          params(
            cache_creation:
              T.nilable(Anthropic::Beta::BetaCacheCreation::OrHash),
            cache_creation_input_tokens: Integer,
            cache_read_input_tokens: Integer,
            input_tokens: Integer,
            output_tokens: Integer,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Breakdown of cached tokens by TTL
          cache_creation:,
          # The number of input tokens used to create the cache entry.
          cache_creation_input_tokens:,
          # The number of input tokens read from the cache.
          cache_read_input_tokens:,
          # The number of input tokens which were used.
          input_tokens:,
          # The number of output tokens which were used.
          output_tokens:,
          # Usage for a compaction iteration
          type: :compaction
        )
        end

        sig do
          override.returns(
            {
              cache_creation: T.nilable(Anthropic::Beta::BetaCacheCreation),
              cache_creation_input_tokens: Integer,
              cache_read_input_tokens: Integer,
              input_tokens: Integer,
              output_tokens: Integer,
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
