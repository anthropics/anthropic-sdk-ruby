# typed: strong

module Anthropic
  module Models
    class Completion < Anthropic::Internal::Type::BaseModel
      # Unique object identifier.
      #
      #   The format and length of IDs may change over time.
      sig { returns(String) }
      attr_accessor :id

      # The resulting completion up to and excluding the stop sequences.
      sig { returns(String) }
      attr_accessor :completion

      # The model that will complete your prompt.\n\nSee
      #   [models](https://docs.anthropic.com/en/docs/models-overview) for additional
      #   details and options.
      sig { returns(T.any(Anthropic::Models::Model::TaggedSymbol, String)) }
      attr_accessor :model

      # The reason that we stopped.
      #
      #   This may be one the following values:
      #
      #   - `"stop_sequence"`: we reached a stop sequence — either provided by you via the
      #     `stop_sequences` parameter, or a stop sequence built into the model
      #   - `"max_tokens"`: we exceeded `max_tokens_to_sample` or the model's maximum
      sig { returns(T.nilable(String)) }
      attr_accessor :stop_reason

      # Object type.
      #
      #   For Text Completions, this is always `"completion"`.
      sig { returns(Symbol) }
      attr_accessor :type

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
      def self.new(id:, completion:, model:, stop_reason:, type: :completion); end

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
      def to_hash; end
    end
  end
end
