# typed: strong

module Anthropic
  module Models
    class RawMessageDeltaEvent < Anthropic::BaseModel
      sig { returns(Anthropic::Models::RawMessageDeltaEvent::Delta) }
      attr_reader :delta

      sig do
        params(delta: T.any(Anthropic::Models::RawMessageDeltaEvent::Delta, Anthropic::Internal::Util::AnyHash))
          .void
      end
      attr_writer :delta

      sig { returns(Symbol) }
      attr_accessor :type

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
      attr_reader :usage

      sig { params(usage: T.any(Anthropic::Models::MessageDeltaUsage, Anthropic::Internal::Util::AnyHash)).void }
      attr_writer :usage

      sig do
        params(
          delta: T.any(Anthropic::Models::RawMessageDeltaEvent::Delta, Anthropic::Internal::Util::AnyHash),
          usage: T.any(Anthropic::Models::MessageDeltaUsage, Anthropic::Internal::Util::AnyHash),
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
        sig { returns(T.nilable(Anthropic::Models::StopReason::TaggedSymbol)) }
        attr_accessor :stop_reason

        sig { returns(T.nilable(String)) }
        attr_accessor :stop_sequence

        sig do
          params(stop_reason: T.nilable(Anthropic::Models::StopReason::OrSymbol), stop_sequence: T.nilable(String))
            .returns(T.attached_class)
        end
        def self.new(stop_reason:, stop_sequence:)
        end

        sig do
          override
            .returns(
              {stop_reason: T.nilable(Anthropic::Models::StopReason::TaggedSymbol), stop_sequence: T.nilable(String)}
            )
        end
        def to_hash
        end
      end
    end
  end
end
