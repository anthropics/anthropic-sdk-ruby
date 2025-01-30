# typed: strong

module Anthropic
  module Models
    class Message < Anthropic::BaseModel
      Shape = T.type_alias do
        {
          id: String,
          content: T::Array[Anthropic::Models::ContentBlock::Variants],
          model: Anthropic::Models::Model::Variants,
          role: Symbol,
          stop_reason: T.nilable(Symbol),
          stop_sequence: T.nilable(String),
          type: Symbol,
          usage: Anthropic::Models::Usage
        }
      end

      sig { returns(String) }
      attr_accessor :id

      sig { returns(T::Array[Anthropic::Models::ContentBlock::Variants]) }
      attr_accessor :content

      sig { returns(Anthropic::Models::Model::Variants) }
      attr_accessor :model

      sig { returns(Symbol) }
      attr_accessor :role

      sig { returns(T.nilable(Symbol)) }
      attr_accessor :stop_reason

      sig { returns(T.nilable(String)) }
      attr_accessor :stop_sequence

      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(Anthropic::Models::Usage) }
      attr_accessor :usage

      sig do
        params(
          id: String,
          content: T::Array[Anthropic::Models::ContentBlock::Variants],
          model: Anthropic::Models::Model::Variants,
          stop_reason: T.nilable(Symbol),
          stop_sequence: T.nilable(String),
          usage: Anthropic::Models::Usage,
          role: Symbol,
          type: Symbol
        ).void
      end
      def initialize(
        id:,
        content:,
        model:,
        stop_reason:,
        stop_sequence:,
        usage:,
        role: :assistant,
        type: :message
      )
      end

      sig { returns(Anthropic::Models::Message::Shape) }
      def to_h; end

      class StopReason < Anthropic::Enum
        abstract!

        END_TURN = T.let(:end_turn, T.nilable(Symbol))
        MAX_TOKENS = T.let(:max_tokens, T.nilable(Symbol))
        STOP_SEQUENCE = T.let(:stop_sequence, T.nilable(Symbol))
        TOOL_USE = T.let(:tool_use, T.nilable(Symbol))

        sig { override.returns(T::Array[Symbol]) }
        def self.values; end
      end
    end
  end
end
