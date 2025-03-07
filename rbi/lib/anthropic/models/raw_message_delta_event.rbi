# typed: strong

module Anthropic
  module Models
    class RawMessageDeltaEvent < Anthropic::BaseModel
      sig { returns(Anthropic::Models::RawMessageDeltaEvent::Delta) }
      def delta
      end

      sig do
        params(_: Anthropic::Models::RawMessageDeltaEvent::Delta)
          .returns(Anthropic::Models::RawMessageDeltaEvent::Delta)
      end
      def delta=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig { returns(Anthropic::Models::MessageDeltaUsage) }
      def usage
      end

      sig { params(_: Anthropic::Models::MessageDeltaUsage).returns(Anthropic::Models::MessageDeltaUsage) }
      def usage=(_)
      end

      sig do
        params(
          delta: Anthropic::Models::RawMessageDeltaEvent::Delta,
          usage: Anthropic::Models::MessageDeltaUsage,
          type: Symbol
        )
          .returns(T.attached_class)
      end
      def self.new(delta:, usage:, type: :message_delta)
      end

      sig do
        override
          .returns(
            {
              delta: Anthropic::Models::RawMessageDeltaEvent::Delta,
              type: Symbol,
              usage: Anthropic::Models::MessageDeltaUsage
            }
          )
      end
      def to_hash
      end

      class Delta < Anthropic::BaseModel
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

        sig do
          params(stop_reason: T.nilable(Symbol), stop_sequence: T.nilable(String)).returns(T.attached_class)
        end
        def self.new(stop_reason:, stop_sequence:)
        end

        sig { override.returns({stop_reason: T.nilable(Symbol), stop_sequence: T.nilable(String)}) }
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
end
