# typed: strong

module Anthropic
  module Models
    class Message < Anthropic::BaseModel
      sig { returns(String) }
      def id
      end

      sig { params(_: String).returns(String) }
      def id=(_)
      end

      sig do
        returns(
          T::Array[
          T.any(
            Anthropic::Models::TextBlock,
            Anthropic::Models::ToolUseBlock,
            Anthropic::Models::ThinkingBlock,
            Anthropic::Models::RedactedThinkingBlock
          )
          ]
        )
      end
      def content
      end

      sig do
        params(
          _: T::Array[
          T.any(
            Anthropic::Models::TextBlock,
            Anthropic::Models::ToolUseBlock,
            Anthropic::Models::ThinkingBlock,
            Anthropic::Models::RedactedThinkingBlock
          )
          ]
        )
          .returns(
            T::Array[
            T.any(
              Anthropic::Models::TextBlock,
              Anthropic::Models::ToolUseBlock,
              Anthropic::Models::ThinkingBlock,
              Anthropic::Models::RedactedThinkingBlock
            )
            ]
          )
      end
      def content=(_)
      end

      sig { returns(T.any(Symbol, String)) }
      def model
      end

      sig { params(_: T.any(Symbol, String)).returns(T.any(Symbol, String)) }
      def model=(_)
      end

      sig { returns(Symbol) }
      def role
      end

      sig { params(_: Symbol).returns(Symbol) }
      def role=(_)
      end

      sig { returns(T.nilable(Symbol)) }
      def stop_reason
      end

      sig { params(_: T.nilable(Symbol)).returns(T.nilable(Symbol)) }
      def stop_reason=(_)
      end

      sig { returns(T.nilable(String)) }
      def stop_sequence
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def stop_sequence=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig { returns(Anthropic::Models::Usage) }
      def usage
      end

      sig { params(_: Anthropic::Models::Usage).returns(Anthropic::Models::Usage) }
      def usage=(_)
      end

      sig do
        params(
          id: String,
          content: T::Array[
          T.any(
            Anthropic::Models::TextBlock,
            Anthropic::Models::ToolUseBlock,
            Anthropic::Models::ThinkingBlock,
            Anthropic::Models::RedactedThinkingBlock
          )
          ],
          model: T.any(Symbol, String),
          stop_reason: T.nilable(Symbol),
          stop_sequence: T.nilable(String),
          usage: Anthropic::Models::Usage,
          role: Symbol,
          type: Symbol
        )
          .returns(T.attached_class)
      end
      def self.new(id:, content:, model:, stop_reason:, stop_sequence:, usage:, role: :assistant, type: :message)
      end

      sig do
        override
          .returns(
            {
              id: String,
              content: T::Array[
              T.any(
                Anthropic::Models::TextBlock,
                Anthropic::Models::ToolUseBlock,
                Anthropic::Models::ThinkingBlock,
                Anthropic::Models::RedactedThinkingBlock
              )
              ],
              model: T.any(Symbol, String),
              role: Symbol,
              stop_reason: T.nilable(Symbol),
              stop_sequence: T.nilable(String),
              type: Symbol,
              usage: Anthropic::Models::Usage
            }
          )
      end
      def to_hash
      end

      class StopReason < Anthropic::Enum
        abstract!

        END_TURN = T.let(:end_turn, T.nilable(Symbol))
        MAX_TOKENS = T.let(:max_tokens, T.nilable(Symbol))
        STOP_SEQUENCE = T.let(:stop_sequence, T.nilable(Symbol))
        TOOL_USE = T.let(:tool_use, T.nilable(Symbol))

        class << self
          sig { override.returns(T::Array[Symbol]) }
          def values
          end
        end
      end
    end
  end
end
