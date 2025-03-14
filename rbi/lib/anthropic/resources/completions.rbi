# typed: strong

module Anthropic
  module Resources
    class Completions
      # [Legacy] Create a Text Completion.
      #
      #   The Text Completions API is a legacy API. We recommend using the
      #   [Messages API](https://docs.anthropic.com/en/api/messages) going forward.
      #
      #   Future models and features will not be compatible with Text Completions. See our
      #   [migration guide](https://docs.anthropic.com/en/api/migrating-from-text-completions-to-messages)
      #   for guidance in migrating from Text Completions to Messages.
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

      # [Legacy] Create a Text Completion.
      #
      #   The Text Completions API is a legacy API. We recommend using the
      #   [Messages API](https://docs.anthropic.com/en/api/messages) going forward.
      #
      #   Future models and features will not be compatible with Text Completions. See our
      #   [migration guide](https://docs.anthropic.com/en/api/migrating-from-text-completions-to-messages)
      #   for guidance in migrating from Text Completions to Messages.
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

      sig { params(client: Anthropic::Client).returns(T.attached_class) }
      def self.new(client:)
      end
    end
  end
end
