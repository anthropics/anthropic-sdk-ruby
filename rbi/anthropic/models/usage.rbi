# typed: strong

module Anthropic
  module Models
    class Usage < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Anthropic::Usage, Anthropic::Internal::AnyHash) }

      # Breakdown of cached tokens by TTL
      sig { returns(T.nilable(Anthropic::CacheCreation)) }
      attr_reader :cache_creation

      sig do
        params(cache_creation: T.nilable(Anthropic::CacheCreation::OrHash)).void
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

      # The number of output tokens which were used.
      sig { returns(Integer) }
      attr_accessor :output_tokens

      # The number of server tool requests.
      sig { returns(T.nilable(Anthropic::ServerToolUsage)) }
      attr_reader :server_tool_use

      sig do
        params(
          server_tool_use: T.nilable(Anthropic::ServerToolUsage::OrHash)
        ).void
      end
      attr_writer :server_tool_use

      # If the request used the priority, standard, or batch tier.
      sig { returns(T.nilable(Anthropic::Usage::ServiceTier::TaggedSymbol)) }
      attr_accessor :service_tier

      # The inference speed mode used for this request.
      sig { returns(T.nilable(Anthropic::Usage::Speed::TaggedSymbol)) }
      attr_accessor :speed

      sig do
        params(
          cache_creation: T.nilable(Anthropic::CacheCreation::OrHash),
          cache_creation_input_tokens: T.nilable(Integer),
          cache_read_input_tokens: T.nilable(Integer),
          inference_geo: T.nilable(String),
          input_tokens: Integer,
          output_tokens: Integer,
          server_tool_use: T.nilable(Anthropic::ServerToolUsage::OrHash),
          service_tier: T.nilable(Anthropic::Usage::ServiceTier::OrSymbol),
          speed: T.nilable(Anthropic::Usage::Speed::OrSymbol)
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
            cache_creation: T.nilable(Anthropic::CacheCreation),
            cache_creation_input_tokens: T.nilable(Integer),
            cache_read_input_tokens: T.nilable(Integer),
            inference_geo: T.nilable(String),
            input_tokens: Integer,
            output_tokens: Integer,
            server_tool_use: T.nilable(Anthropic::ServerToolUsage),
            service_tier:
              T.nilable(Anthropic::Usage::ServiceTier::TaggedSymbol),
            speed: T.nilable(Anthropic::Usage::Speed::TaggedSymbol)
          }
        )
      end
      def to_hash
      end

      # If the request used the priority, standard, or batch tier.
      module ServiceTier
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias { T.all(Symbol, Anthropic::Usage::ServiceTier) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STANDARD = T.let(:standard, Anthropic::Usage::ServiceTier::TaggedSymbol)
        PRIORITY = T.let(:priority, Anthropic::Usage::ServiceTier::TaggedSymbol)
        BATCH = T.let(:batch, Anthropic::Usage::ServiceTier::TaggedSymbol)

        sig do
          override.returns(
            T::Array[Anthropic::Usage::ServiceTier::TaggedSymbol]
          )
        end
        def self.values
        end
      end

      # The inference speed mode used for this request.
      module Speed
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::Usage::Speed) }
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        STANDARD = T.let(:standard, Anthropic::Usage::Speed::TaggedSymbol)
        FAST = T.let(:fast, Anthropic::Usage::Speed::TaggedSymbol)

        sig do
          override.returns(T::Array[Anthropic::Usage::Speed::TaggedSymbol])
        end
        def self.values
        end
      end
    end
  end
end
