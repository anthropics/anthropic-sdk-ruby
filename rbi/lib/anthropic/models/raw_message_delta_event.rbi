# typed: strong

module Anthropic
  module Models
    class RawMessageDeltaEvent < Anthropic::BaseModel
      sig { returns(Anthropic::Models::RawMessageDeltaEvent::Delta) }
      def delta
      end

      sig do
        params(_: T.any(Anthropic::Models::RawMessageDeltaEvent::Delta, Anthropic::Util::AnyHash))
          .returns(T.any(Anthropic::Models::RawMessageDeltaEvent::Delta, Anthropic::Util::AnyHash))
      end
      def delta=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      # Billing and rate-limit usage.
      #
      #   Anthropic's API bills and rate-limits by token counts, as tokens represent the
      #   underlying cost to our systems.
      #
      #   Under the hood, the API transforms requests into a format suitable for the
      #   model. The model's output then goes through a parsing stage before becoming an
      #   API response. As a result, the token counts in `usage` will not match one-to-one
      #   with the exact visible content of an API request or response.
      #
      #   For example, `output_tokens` will be non-zero, even for an empty string response
      #   from Claude.
      #
      #   Total input tokens in a request is the summation of `input_tokens`,
      #   `cache_creation_input_tokens`, and `cache_read_input_tokens`.
      sig { returns(Anthropic::Models::MessageDeltaUsage) }
      def usage
      end

      sig do
        params(_: T.any(Anthropic::Models::MessageDeltaUsage, Anthropic::Util::AnyHash))
          .returns(T.any(Anthropic::Models::MessageDeltaUsage, Anthropic::Util::AnyHash))
      end
      def usage=(_)
      end

      sig do
        params(
          delta: T.any(Anthropic::Models::RawMessageDeltaEvent::Delta, Anthropic::Util::AnyHash),
          usage: T.any(Anthropic::Models::MessageDeltaUsage, Anthropic::Util::AnyHash),
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
        sig { returns(T.nilable(Anthropic::Models::RawMessageDeltaEvent::Delta::StopReason::TaggedSymbol)) }
        def stop_reason
        end

        sig do
          params(_: T.nilable(Anthropic::Models::RawMessageDeltaEvent::Delta::StopReason::TaggedSymbol))
            .returns(T.nilable(Anthropic::Models::RawMessageDeltaEvent::Delta::StopReason::TaggedSymbol))
        end
        def stop_reason=(_)
        end

        sig { returns(T.nilable(String)) }
        def stop_sequence
        end

        sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
        def stop_sequence=(_)
        end

        sig do
          params(
            stop_reason: T.nilable(Anthropic::Models::RawMessageDeltaEvent::Delta::StopReason::OrSymbol),
            stop_sequence: T.nilable(String)
          )
            .returns(T.attached_class)
        end
        def self.new(stop_reason:, stop_sequence:)
        end

        sig do
          override
            .returns(
              {
                stop_reason: T.nilable(Anthropic::Models::RawMessageDeltaEvent::Delta::StopReason::TaggedSymbol),
                stop_sequence: T.nilable(String)
              }
            )
        end
        def to_hash
        end

        module StopReason
          extend Anthropic::Enum

          TaggedSymbol = T.type_alias { T.all(Symbol, Anthropic::Models::RawMessageDeltaEvent::Delta::StopReason) }
          OrSymbol =
            T.type_alias { T.any(Symbol, Anthropic::Models::RawMessageDeltaEvent::Delta::StopReason::TaggedSymbol) }

          END_TURN = T.let(:end_turn, Anthropic::Models::RawMessageDeltaEvent::Delta::StopReason::TaggedSymbol)
          MAX_TOKENS = T.let(:max_tokens, Anthropic::Models::RawMessageDeltaEvent::Delta::StopReason::TaggedSymbol)
          STOP_SEQUENCE =
            T.let(:stop_sequence, Anthropic::Models::RawMessageDeltaEvent::Delta::StopReason::TaggedSymbol)
          TOOL_USE = T.let(:tool_use, Anthropic::Models::RawMessageDeltaEvent::Delta::StopReason::TaggedSymbol)

          class << self
            sig { override.returns(T::Array[Anthropic::Models::RawMessageDeltaEvent::Delta::StopReason::TaggedSymbol]) }
            def values
            end
          end
        end
      end
    end
  end
end
