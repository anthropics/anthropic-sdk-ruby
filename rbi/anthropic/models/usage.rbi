# typed: strong

module Anthropic
  module Models
    class Usage < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias { T.any(Anthropic::Usage, Anthropic::Internal::AnyHash) }

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

      sig do
        params(
          cache_creation_input_tokens: T.nilable(Integer),
          cache_read_input_tokens: T.nilable(Integer),
          input_tokens: Integer,
          output_tokens: Integer,
          server_tool_use: T.nilable(Anthropic::ServerToolUsage::OrHash),
          service_tier: T.nilable(Anthropic::Usage::ServiceTier::OrSymbol)
        ).returns(T.attached_class)
      end
      def self.new(
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
            cache_creation_input_tokens: T.nilable(Integer),
            cache_read_input_tokens: T.nilable(Integer),
            input_tokens: Integer,
            output_tokens: Integer,
            server_tool_use: T.nilable(Anthropic::ServerToolUsage),
            service_tier: T.nilable(Anthropic::Usage::ServiceTier::TaggedSymbol)
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
    end
  end
end
