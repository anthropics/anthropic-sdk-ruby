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

          Value = type_template(:out) { {fixed: Symbol} }

          END_TURN = :end_turn
          MAX_TOKENS = :max_tokens
          STOP_SEQUENCE = :stop_sequence
          TOOL_USE = :tool_use
        end
      end
    end
  end
end
