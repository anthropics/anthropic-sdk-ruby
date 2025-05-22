# typed: strong

module Anthropic
  module Models
    BetaRawMessageDeltaEvent = Beta::BetaRawMessageDeltaEvent

    module Beta
      class BetaRawMessageDeltaEvent < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaRawMessageDeltaEvent,
              Anthropic::Internal::AnyHash
            )
          end

        sig { returns(Anthropic::Beta::BetaRawMessageDeltaEvent::Delta) }
        attr_reader :delta

        sig do
          params(
            delta: Anthropic::Beta::BetaRawMessageDeltaEvent::Delta::OrHash
          ).void
        end
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
        sig { returns(Anthropic::Beta::BetaMessageDeltaUsage) }
        attr_reader :usage

        sig do
          params(usage: Anthropic::Beta::BetaMessageDeltaUsage::OrHash).void
        end
        attr_writer :usage

        sig do
          params(
            delta: Anthropic::Beta::BetaRawMessageDeltaEvent::Delta::OrHash,
            usage: Anthropic::Beta::BetaMessageDeltaUsage::OrHash,
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
              delta: Anthropic::Beta::BetaRawMessageDeltaEvent::Delta,
              type: Symbol,
              usage: Anthropic::Beta::BetaMessageDeltaUsage
            }
          )
        end
        def to_hash
        end

        class Delta < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaRawMessageDeltaEvent::Delta,
                Anthropic::Internal::AnyHash
              )
            end

          # Information about the container used in the request (for the code execution
          # tool)
          sig { returns(T.nilable(Anthropic::Beta::BetaContainer)) }
          attr_reader :container

          sig do
            params(
              container: T.nilable(Anthropic::Beta::BetaContainer::OrHash)
            ).void
          end
          attr_writer :container

          sig do
            returns(T.nilable(Anthropic::Beta::BetaStopReason::TaggedSymbol))
          end
          attr_accessor :stop_reason

          sig { returns(T.nilable(String)) }
          attr_accessor :stop_sequence

          sig do
            params(
              container: T.nilable(Anthropic::Beta::BetaContainer::OrHash),
              stop_reason: T.nilable(Anthropic::Beta::BetaStopReason::OrSymbol),
              stop_sequence: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Information about the container used in the request (for the code execution
            # tool)
            container:,
            stop_reason:,
            stop_sequence:
          )
          end

          sig do
            override.returns(
              {
                container: T.nilable(Anthropic::Beta::BetaContainer),
                stop_reason:
                  T.nilable(Anthropic::Beta::BetaStopReason::TaggedSymbol),
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
end
