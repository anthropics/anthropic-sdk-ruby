# typed: strong

module Anthropic
  module Models
    class CompletionCreateParams < Anthropic::BaseModel
      extend Anthropic::RequestParameters::Converter
      include Anthropic::RequestParameters

      sig { returns(Integer) }
      def max_tokens_to_sample
      end

      sig { params(_: Integer).returns(Integer) }
      def max_tokens_to_sample=(_)
      end

      sig { returns(T.any(Symbol, String)) }
      def model
      end

      sig { params(_: T.any(Symbol, String)).returns(T.any(Symbol, String)) }
      def model=(_)
      end

      sig { returns(String) }
      def prompt
      end

      sig { params(_: String).returns(String) }
      def prompt=(_)
      end

      sig { returns(T.nilable(Anthropic::Models::Metadata)) }
      def metadata
      end

      sig { params(_: Anthropic::Models::Metadata).returns(Anthropic::Models::Metadata) }
      def metadata=(_)
      end

      sig { returns(T.nilable(T::Array[String])) }
      def stop_sequences
      end

      sig { params(_: T::Array[String]).returns(T::Array[String]) }
      def stop_sequences=(_)
      end

      sig { returns(T::Boolean) }
      def stream
      end

      sig { params(_: T::Boolean).returns(T::Boolean) }
      def stream=(_)
      end

      sig { returns(T.nilable(Float)) }
      def temperature
      end

      sig { params(_: Float).returns(Float) }
      def temperature=(_)
      end

      sig { returns(T.nilable(Integer)) }
      def top_k
      end

      sig { params(_: Integer).returns(Integer) }
      def top_k=(_)
      end

      sig { returns(T.nilable(Float)) }
      def top_p
      end

      sig { params(_: Float).returns(Float) }
      def top_p=(_)
      end

      sig do
        params(
          max_tokens_to_sample: Integer,
          model: T.any(Symbol, String),
          prompt: String,
          stream: T::Boolean,
          metadata: Anthropic::Models::Metadata,
          stop_sequences: T::Array[String],
          temperature: Float,
          top_k: Integer,
          top_p: Float,
          request_options: T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything])
        ).void
      end
      def initialize(
        max_tokens_to_sample:,
        model:,
        prompt:,
        stream:,
        metadata: nil,
        stop_sequences: nil,
        temperature: nil,
        top_k: nil,
        top_p: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            max_tokens_to_sample: Integer,
            model: T.any(Symbol, String),
            prompt: String,
            metadata: Anthropic::Models::Metadata,
            stop_sequences: T::Array[String],
            stream: T::Boolean,
            temperature: Float,
            top_k: Integer,
            top_p: Float,
            request_options: Anthropic::RequestOptions
          }
        )
      end
      def to_hash
      end

      class Stream < Anthropic::Enum
        abstract!

        TRUE = T.let(true, T::Boolean)

        sig { override.returns(T::Array[T::Boolean]) }
        def self.values
        end
      end
    end
  end
end
