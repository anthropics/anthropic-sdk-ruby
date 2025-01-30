# typed: strong

module Anthropic
  module Models
    class CompletionCreateParams < Anthropic::BaseModel
      extend Anthropic::RequestParameters::Converter
      include Anthropic::RequestParameters

      Shape = T.type_alias do
        T.all(
          {
            max_tokens_to_sample: Integer,
            model: Anthropic::Models::Model::Variants,
            prompt: String,
            metadata: Anthropic::Models::Metadata,
            stop_sequences: T::Array[String],
            stream: T::Boolean,
            temperature: Float,
            top_k: Integer,
            top_p: Float
          },
          Anthropic::RequestParameters::Shape
        )
      end

      sig { returns(Integer) }
      attr_accessor :max_tokens_to_sample

      sig { returns(Anthropic::Models::Model::Variants) }
      attr_accessor :model

      sig { returns(String) }
      attr_accessor :prompt

      sig { returns(T.nilable(Anthropic::Models::Metadata)) }
      attr_reader :metadata

      sig { params(metadata: Anthropic::Models::Metadata).void }
      attr_writer :metadata

      sig { returns(T::Array[String]) }
      attr_reader :stop_sequences

      sig { params(stop_sequences: T::Array[String]).void }
      attr_writer :stop_sequences

      sig { returns(T::Boolean) }
      attr_accessor :stream

      sig { returns(T.nilable(Float)) }
      attr_reader :temperature

      sig { params(temperature: Float).void }
      attr_writer :temperature

      sig { returns(T.nilable(Integer)) }
      attr_reader :top_k

      sig { params(top_k: Integer).void }
      attr_writer :top_k

      sig { returns(T.nilable(Float)) }
      attr_reader :top_p

      sig { params(top_p: Float).void }
      attr_writer :top_p

      sig do
        params(
          max_tokens_to_sample: Integer,
          model: Anthropic::Models::Model::Variants,
          prompt: String,
          stream: T::Boolean,
          metadata: Anthropic::Models::Metadata,
          stop_sequences: T::Array[String],
          temperature: Float,
          top_k: Integer,
          top_p: Float,
          request_options: Anthropic::RequestOpts
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
      ); end

      sig { returns(Anthropic::Models::CompletionCreateParams::Shape) }
      def to_h; end

      class Stream < Anthropic::Enum
        abstract!

        TRUE = T.let(true, T::Boolean)

        sig { override.returns(T::Array[T::Boolean]) }
        def self.values; end
      end
    end
  end
end
