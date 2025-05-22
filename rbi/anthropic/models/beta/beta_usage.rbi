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

        # The number of input tokens which were used.
        sig { returns(Integer) }
        attr_accessor :input_tokens

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

        sig do
          params(
            cache_creation:
              T.nilable(Anthropic::Beta::BetaCacheCreation::OrHash),
            cache_creation_input_tokens: T.nilable(Integer),
            cache_read_input_tokens: T.nilable(Integer),
            input_tokens: Integer,
            output_tokens: Integer,
            server_tool_use:
              T.nilable(Anthropic::Beta::BetaServerToolUsage::OrHash),
            service_tier:
              T.nilable(Anthropic::Beta::BetaUsage::ServiceTier::OrSymbol)
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
          # The number of server tool requests.
          server_tool_use:,
          # If the request used the priority, standard, or batch tier.
          service_tier:
        )
        end

        sig do
          override.returns(
            {
              cache_creation: T.nilable(Anthropic::Beta::BetaCacheCreation),
              cache_creation_input_tokens: T.nilable(Integer),
              cache_read_input_tokens: T.nilable(Integer),
              input_tokens: Integer,
              output_tokens: Integer,
              server_tool_use: T.nilable(Anthropic::Beta::BetaServerToolUsage),
              service_tier:
                T.nilable(Anthropic::Beta::BetaUsage::ServiceTier::TaggedSymbol)
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
      end
    end
  end
end
