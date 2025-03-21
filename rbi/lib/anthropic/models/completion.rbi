# typed: strong

module Anthropic
  module Models
    class Completion < Anthropic::BaseModel
      # Unique object identifier.
      #
      #   The format and length of IDs may change over time.
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      # The resulting completion up to and excluding the stop sequences.
      sig { returns(String) }
      def completion
      end

      sig { params(_: String).returns(String) }
      def completion=(_)
      end

      # The model that will complete your prompt.\n\nSee
      #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      #   details and options.
      sig { returns(T.any(Anthropic::Models::Model::TaggedSymbol, String)) }
      def model
      end

      sig do
        params(_: T.any(Anthropic::Models::Model::TaggedSymbol, String))
          .returns(T.any(Anthropic::Models::Model::TaggedSymbol, String))
      end
      def model=(_)
      end

      # The reason that we stopped.
      #
      #   This may be one the following values:
      #
      #   - `"stop_sequence"`: we reached a stop sequence — either provided by you via the
      #     `stop_sequences` parameter, or a stop sequence built into the model
      #   - `"max_tokens"`: we exceeded `max_tokens_to_sample` or the model's maximum
      sig { returns(T.nilable(String)) }
      def stop_reason
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def stop_reason=(_)
      end

      # Object type.
      #
      #   For Text Completions, this is always `"completion"`.
      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig do
        params(
          id: String,
          completion: String,
          model: T.any(Anthropic::Models::Model::OrSymbol, String),
          stop_reason: T.nilable(String),
          type: Symbol
        )
          .returns(T.attached_class)
      end
      def self.new(id:, completion:, model:, stop_reason:, type: :completion)
      end

      sig do
        override
          .returns(
            {
              id: String,
              completion: String,
              model: T.any(Anthropic::Models::Model::TaggedSymbol, String),
              stop_reason: T.nilable(String),
              type: Symbol
            }
          )
      end
      def to_hash
      end
    end
  end
end
