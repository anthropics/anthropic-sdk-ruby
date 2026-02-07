# typed: strong

module Anthropic
  module Models
    BetaUsage = Beta::BetaUsage

    module Beta
      class BetaUsage < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Anthropic::Beta::BetaUsage, Anthropic::Internal::AnyHash)
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
        sig { returns(T.nilable(Integer)) }
        attr_accessor :cache_creation_input_tokens

        # The number of input tokens read from the cache.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :cache_read_input_tokens

        # The geographic region where inference was performed for this request.
        sig { returns(T.nilable(String)) }
        attr_accessor :inference_geo

        # The number of input tokens which were used.
        sig { returns(Integer) }
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

        # The number of output tokens which were used.
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

        # If the request used the priority, standard, or batch tier.
        sig do
          returns(
            T.nilable(Anthropic::Beta::BetaUsage::ServiceTier::TaggedSymbol)
          )
        end
        attr_accessor :service_tier

        # The inference speed mode used for this request.
        sig do
          returns(T.nilable(Anthropic::Beta::BetaUsage::Speed::TaggedSymbol))
        end
        attr_accessor :speed

        sig do
          params(
            cache_creation:
              T.nilable(Anthropic::Beta::BetaCacheCreation::OrHash),
            cache_creation_input_tokens: T.nilable(Integer),
            cache_read_input_tokens: T.nilable(Integer),
            inference_geo: T.nilable(String),
            input_tokens: Integer,
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
              T.nilable(Anthropic::Beta::BetaServerToolUsage::OrHash),
            service_tier:
              T.nilable(Anthropic::Beta::BetaUsage::ServiceTier::OrSymbol),
            speed: T.nilable(Anthropic::Beta::BetaUsage::Speed::OrSymbol)
          ).returns(T.attached_class)
        end
        def self.new(
          # Breakdown of cached tokens by TTL
          cache_creation:,
          # The number of input tokens used to create the cache entry.
          cache_creation_input_tokens:,
          # The number of input tokens read from the cache.
          cache_read_input_tokens:,
          # The geographic region where inference was performed for this request.
          inference_geo:,
          # The number of input tokens which were used.
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
          # The number of output tokens which were used.
          output_tokens:,
          # The number of server tool requests.
          server_tool_use:,
          # If the request used the priority, standard, or batch tier.
          service_tier:,
          # The inference speed mode used for this request.
          speed:
        )
        end

        sig do
          override.returns(
            {
              cache_creation: T.nilable(Anthropic::Beta::BetaCacheCreation),
              cache_creation_input_tokens: T.nilable(Integer),
              cache_read_input_tokens: T.nilable(Integer),
              inference_geo: T.nilable(String),
              input_tokens: Integer,
              iterations:
                T.nilable(
                  T::Array[Anthropic::Beta::BetaIterationsUsageItem::Variants]
                ),
              output_tokens: Integer,
              server_tool_use: T.nilable(Anthropic::Beta::BetaServerToolUsage),
              service_tier:
                T.nilable(
                  Anthropic::Beta::BetaUsage::ServiceTier::TaggedSymbol
                ),
              speed: T.nilable(Anthropic::Beta::BetaUsage::Speed::TaggedSymbol)
            }
          )
        end
        def to_hash
        end

        # If the request used the priority, standard, or batch tier.
        module ServiceTier
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaUsage::ServiceTier)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STANDARD =
            T.let(
              :standard,
              Anthropic::Beta::BetaUsage::ServiceTier::TaggedSymbol
            )
          PRIORITY =
            T.let(
              :priority,
              Anthropic::Beta::BetaUsage::ServiceTier::TaggedSymbol
            )
          BATCH =
            T.let(:batch, Anthropic::Beta::BetaUsage::ServiceTier::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaUsage::ServiceTier::TaggedSymbol]
            )
          end
          def self.values
          end
        end

        # The inference speed mode used for this request.
        module Speed
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias { T.all(Symbol, Anthropic::Beta::BetaUsage::Speed) }
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STANDARD =
            T.let(:standard, Anthropic::Beta::BetaUsage::Speed::TaggedSymbol)
          FAST = T.let(:fast, Anthropic::Beta::BetaUsage::Speed::TaggedSymbol)

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaUsage::Speed::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
