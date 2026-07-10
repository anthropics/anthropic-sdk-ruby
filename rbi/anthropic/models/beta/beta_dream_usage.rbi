# typed: strong

module Anthropic
  module Models
    BetaDreamUsage = Beta::BetaDreamUsage

    module Beta
      class BetaDreamUsage < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Anthropic::Beta::BetaDreamUsage, Anthropic::Internal::AnyHash)
          end

        # Total tokens used to create prompt-cache entries (sum of all TTL tiers).
        sig { returns(Integer) }
        attr_accessor :cache_creation_input_tokens

        # Total tokens read from prompt cache.
        sig { returns(Integer) }
        attr_accessor :cache_read_input_tokens

        # Total uncached input tokens consumed across every pipeline stage.
        sig { returns(Integer) }
        attr_accessor :input_tokens

        # Total output tokens generated across every pipeline stage.
        sig { returns(Integer) }
        attr_accessor :output_tokens

        # Cumulative token usage for the dream across every pipeline stage.
        sig do
          params(
            cache_creation_input_tokens: Integer,
            cache_read_input_tokens: Integer,
            input_tokens: Integer,
            output_tokens: Integer
          ).returns(T.attached_class)
        end
        def self.new(
          # Total tokens used to create prompt-cache entries (sum of all TTL tiers).
          cache_creation_input_tokens:,
          # Total tokens read from prompt cache.
          cache_read_input_tokens:,
          # Total uncached input tokens consumed across every pipeline stage.
          input_tokens:,
          # Total output tokens generated across every pipeline stage.
          output_tokens:
        )
        end

        sig do
          override.returns(
            {
              cache_creation_input_tokens: Integer,
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
