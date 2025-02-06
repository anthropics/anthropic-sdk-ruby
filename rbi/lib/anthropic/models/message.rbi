# typed: strong

module Anthropic
  module Models
    class Message < Anthropic::BaseModel
      sig { returns(String) }
      attr_accessor :id

      sig { returns(T::Array[T.any(Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock)]) }
      attr_accessor :content

      sig { returns(T.any(Symbol, String)) }
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
          content: T::Array[T.any(Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock)],
          model: T.any(Symbol, String),
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

      sig do
        override.returns(
          {
            id: String,
            content: T::Array[T.any(Anthropic::Models::TextBlock, Anthropic::Models::ToolUseBlock)],
            model: T.any(Symbol, String),
            role: Symbol,
            stop_reason: T.nilable(Symbol),
            stop_sequence: T.nilable(String),
            type: Symbol,
            usage: Anthropic::Models::Usage
          }
        )
      end
      def to_hash; end

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
