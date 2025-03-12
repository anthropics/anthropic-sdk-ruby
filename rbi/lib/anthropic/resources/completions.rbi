# typed: strong

module Anthropic
  module Resources
    class Completions
      sig do
        params(
          max_tokens_to_sample: Integer,
          model: T.any(Symbol, String),
          prompt: String,
          metadata: Anthropic::Models::Metadata,
          stop_sequences: T::Array[String],
          temperature: Float,
          top_k: Integer,
          top_p: Float,
          request_options: T.nilable(T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Anthropic::Models::Completion)
      end
      def create(
        max_tokens_to_sample:,
        model:,
        prompt:,
        metadata: nil,
        stop_sequences: nil,
        temperature: nil,
        top_k: nil,
        top_p: nil,
        request_options: {}
      )
      end

      sig do
        params(
          max_tokens_to_sample: Integer,
          model: T.any(Symbol, String),
          prompt: String,
          metadata: Anthropic::Models::Metadata,
          stop_sequences: T::Array[String],
          temperature: Float,
          top_k: Integer,
          top_p: Float,
          request_options: T.nilable(T.any(Anthropic::RequestOptions, T::Hash[Symbol, T.anything]))
        )
          .returns(Anthropic::Stream[Anthropic::Models::Completion])
      end
      def create_streaming(
        max_tokens_to_sample:,
        model:,
        prompt:,
        metadata: nil,
        stop_sequences: nil,
        temperature: nil,
        top_k: nil,
        top_p: nil,
        request_options: {}
      )
      end

      sig { params(client: Anthropic::Client).void }
      def initialize(client:)
      end
    end
  end
end
