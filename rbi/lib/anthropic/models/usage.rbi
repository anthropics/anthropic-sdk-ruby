# typed: strong

module Anthropic
  module Models
    class Usage < Anthropic::BaseModel
      Shape = T.type_alias do
        {
          cache_creation_input_tokens: T.nilable(Integer),
          cache_read_input_tokens: T.nilable(Integer),
          input_tokens: Integer,
          output_tokens: Integer
        }
      end

      sig { returns(T.nilable(Integer)) }
      attr_accessor :cache_creation_input_tokens

      sig { returns(T.nilable(Integer)) }
      attr_accessor :cache_read_input_tokens

      sig { returns(Integer) }
      attr_accessor :input_tokens

      sig { returns(Integer) }
      attr_accessor :output_tokens

      sig do
        params(
          cache_creation_input_tokens: T.nilable(Integer),
          cache_read_input_tokens: T.nilable(Integer),
          input_tokens: Integer,
          output_tokens: Integer
        ).void
      end
      def initialize(cache_creation_input_tokens:, cache_read_input_tokens:, input_tokens:, output_tokens:)
      end

      sig { returns(Anthropic::Models::Usage::Shape) }
      def to_h; end
    end
  end
end
