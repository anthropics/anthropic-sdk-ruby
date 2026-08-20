# typed: strong

module Anthropic
  module Models
    BetaIterationsUsage =
      T.let(Beta::BetaIterationsUsage, Anthropic::Internal::Type::Converter)

    module Beta
      # Token usage for a sampling iteration.
      module BetaIterationsUsageItem
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaMessageIterationUsage,
              Anthropic::Beta::BetaCompactionIterationUsage,
              Anthropic::Beta::BetaAdvisorMessageIterationUsage,
              Anthropic::Beta::BetaFallbackMessageIterationUsage
            )
          end

        module Type
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaIterationsUsageItem::Type)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          MESSAGE =
            T.let(
              :message,
              Anthropic::Beta::BetaIterationsUsageItem::Type::TaggedSymbol
            )
          COMPACTION =
            T.let(
              :compaction,
              Anthropic::Beta::BetaIterationsUsageItem::Type::TaggedSymbol
            )
          ADVISOR_MESSAGE =
            T.let(
              :advisor_message,
              Anthropic::Beta::BetaIterationsUsageItem::Type::TaggedSymbol
            )
          FALLBACK_MESSAGE =
            T.let(
              :fallback_message,
              Anthropic::Beta::BetaIterationsUsageItem::Type::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaIterationsUsageItem::Type::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end

        sig do
          override.returns(
            T::Array[Anthropic::Beta::BetaIterationsUsageItem::Variants]
          )
        end
        def self.variants
        end

        # Creates a new instance of the variant class whose `type` matches the given
        # value, passing the remaining arguments to its constructor.
        sig do
          params(
            type: T.any(Symbol, String),
            cache_creation:
              T.nilable(Anthropic::Beta::BetaCacheCreation::OrHash),
            cache_creation_input_tokens: Integer,
            cache_read_input_tokens: Integer,
            input_tokens: Integer,
            output_tokens: Integer,
            model: T.any(Anthropic::Model::OrSymbol, String)
          ).returns(Anthropic::Beta::BetaIterationsUsageItem::Variants)
        end
        def self.new(
          type:,
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
          # The model that will complete your prompt.
          #
          # See [models](https://docs.anthropic.com/en/docs/models-overview) for additional
          # details and options.
          model: nil
        )
        end
      end

      BetaIterationsUsage =
        T.let(
          Anthropic::Internal::Type::ArrayOf[
            union: Anthropic::Beta::BetaIterationsUsageItem
          ],
          Anthropic::Internal::Type::Converter
        )
    end
  end
end
