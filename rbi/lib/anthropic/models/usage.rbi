# typed: strong

module Anthropic
  module Models
    class Usage < Anthropic::Internal::Type::BaseModel
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

      sig do
        params(
          cache_creation_input_tokens: T.nilable(Integer),
          cache_read_input_tokens: T.nilable(Integer),
          input_tokens: Integer,
          output_tokens: Integer
        )
          .returns(T.attached_class)
      end
      def self.new(cache_creation_input_tokens:, cache_read_input_tokens:, input_tokens:, output_tokens:); end

      sig do
        override
          .returns(
            {
              cache_creation_input_tokens: T.nilable(Integer),
              cache_read_input_tokens: T.nilable(Integer),
              input_tokens: Integer,
              output_tokens: Integer
            }
          )
      end
      def to_hash; end
    end
  end
end
