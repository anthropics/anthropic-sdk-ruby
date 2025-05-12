# typed: strong

module Anthropic
  module Models
    class RawMessageDeltaEvent < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::RawMessageDeltaEvent, Anthropic::Internal::AnyHash)
        end

      sig { returns(Anthropic::RawMessageDeltaEvent::Delta) }
      attr_reader :delta

      sig { params(delta: Anthropic::RawMessageDeltaEvent::Delta::OrHash).void }
      attr_writer :delta

      sig { returns(Symbol) }
      attr_accessor :type

      # Billing and rate-limit usage.
      #
      # Anthropic's API bills and rate-limits by token counts, as tokens represent the
      # underlying cost to our systems.
      #
      # Under the hood, the API transforms requests into a format suitable for the
      # model. The model's output then goes through a parsing stage before becoming an
      # API response. As a result, the token counts in `usage` will not match one-to-one
      # with the exact visible content of an API request or response.
      #
      # For example, `output_tokens` will be non-zero, even for an empty string response
      # from Claude.
      #
      # Total input tokens in a request is the summation of `input_tokens`,
      # `cache_creation_input_tokens`, and `cache_read_input_tokens`.
      sig { returns(Anthropic::MessageDeltaUsage) }
      attr_reader :usage

      sig { params(usage: Anthropic::MessageDeltaUsage::OrHash).void }
      attr_writer :usage

      sig do
        params(
          delta: Anthropic::RawMessageDeltaEvent::Delta::OrHash,
          usage: Anthropic::MessageDeltaUsage::OrHash,
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        delta:,
        # Billing and rate-limit usage.
        #
        # Anthropic's API bills and rate-limits by token counts, as tokens represent the
        # underlying cost to our systems.
        #
        # Under the hood, the API transforms requests into a format suitable for the
        # model. The model's output then goes through a parsing stage before becoming an
        # API response. As a result, the token counts in `usage` will not match one-to-one
        # with the exact visible content of an API request or response.
        #
        # For example, `output_tokens` will be non-zero, even for an empty string response
        # from Claude.
        #
        # Total input tokens in a request is the summation of `input_tokens`,
        # `cache_creation_input_tokens`, and `cache_read_input_tokens`.
        usage:,
        type: :message_delta
      )
      end

      sig do
        override.returns(
          {
            delta: Anthropic::RawMessageDeltaEvent::Delta,
            type: Symbol,
            usage: Anthropic::MessageDeltaUsage
          }
        )
      end
      def to_hash
      end

      class Delta < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::RawMessageDeltaEvent::Delta,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(T.nilable(Anthropic::StopReason::TaggedSymbol)) }
        attr_accessor :stop_reason

        sig { returns(T.nilable(String)) }
        attr_accessor :stop_sequence

        sig do
          params(
            stop_reason: T.nilable(Anthropic::StopReason::OrSymbol),
            stop_sequence: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(stop_reason:, stop_sequence:)
        end

        sig do
          override.returns(
            {
              stop_reason: T.nilable(Anthropic::StopReason::TaggedSymbol),
              stop_sequence: T.nilable(String)
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
