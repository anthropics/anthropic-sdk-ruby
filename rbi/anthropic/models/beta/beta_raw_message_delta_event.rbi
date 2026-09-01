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

        # Information about context management strategies applied during the request
        sig do
          returns(T.nilable(Anthropic::Beta::BetaContextManagementResponse))
        end
        attr_reader :context_management

        sig do
          params(
            context_management:
              T.nilable(Anthropic::Beta::BetaContextManagementResponse::OrHash)
          ).void
        end
        attr_writer :context_management

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

        # Changes the API made to the request's input before showing it to the model: one
        # entry per change, in request order. Today the only entry type is
        # `thinking_dropped` — a `thinking`, `redacted_thinking` or `connector_text` block
        # from the request's `messages` that was removed from the prompt instead of being
        # shown to the model because it failed a binding check. More entry types may be
        # added over time; ignore types you do not recognize.
        #
        # Requires `anthropic-beta: thinking-binding-controls-2026-08-01`. Present on
        # every such response from a model that supports extended thinking, as `[]` when
        # nothing was changed; without the beta, blocks are removed all the same but
        # nothing is reported. Removed blocks contribute nothing to `usage.input_tokens`.
        # When streaming, the array is final in `message_start`; the final `message_delta`
        # event carries it only when a server-side model fallback happened mid-stream, in
        # which case it holds the serving model's entries and replaces the one in
        # `message_start`.
        sig do
          returns(
            T.nilable(
              T::Array[Anthropic::Beta::BetaThinkingDroppedInputTransformation]
            )
          )
        end
        attr_accessor :input_transformations

        sig do
          params(
            context_management:
              T.nilable(Anthropic::Beta::BetaContextManagementResponse::OrHash),
            delta: Anthropic::Beta::BetaRawMessageDeltaEvent::Delta::OrHash,
            usage: Anthropic::Beta::BetaMessageDeltaUsage::OrHash,
            input_transformations:
              T.nilable(
                T::Array[
                  Anthropic::Beta::BetaThinkingDroppedInputTransformation::OrHash
                ]
              ),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Information about context management strategies applied during the request
          context_management:,
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
          # Changes the API made to the request's input before showing it to the model: one
          # entry per change, in request order. Today the only entry type is
          # `thinking_dropped` — a `thinking`, `redacted_thinking` or `connector_text` block
          # from the request's `messages` that was removed from the prompt instead of being
          # shown to the model because it failed a binding check. More entry types may be
          # added over time; ignore types you do not recognize.
          #
          # Requires `anthropic-beta: thinking-binding-controls-2026-08-01`. Present on
          # every such response from a model that supports extended thinking, as `[]` when
          # nothing was changed; without the beta, blocks are removed all the same but
          # nothing is reported. Removed blocks contribute nothing to `usage.input_tokens`.
          # When streaming, the array is final in `message_start`; the final `message_delta`
          # event carries it only when a server-side model fallback happened mid-stream, in
          # which case it holds the serving model's entries and replaces the one in
          # `message_start`.
          input_transformations: nil,
          type: :message_delta
        )
        end

        sig do
          override.returns(
            {
              context_management:
                T.nilable(Anthropic::Beta::BetaContextManagementResponse),
              delta: Anthropic::Beta::BetaRawMessageDeltaEvent::Delta,
              type: Symbol,
              usage: Anthropic::Beta::BetaMessageDeltaUsage,
              input_transformations:
                T.nilable(
                  T::Array[
                    Anthropic::Beta::BetaThinkingDroppedInputTransformation
                  ]
                )
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

          # Structured information about a refusal.
          sig { returns(T.nilable(Anthropic::Beta::BetaRefusalStopDetails)) }
          attr_reader :stop_details

          sig do
            params(
              stop_details:
                T.nilable(Anthropic::Beta::BetaRefusalStopDetails::OrHash)
            ).void
          end
          attr_writer :stop_details

          sig do
            returns(T.nilable(Anthropic::Beta::BetaStopReason::TaggedSymbol))
          end
          attr_accessor :stop_reason

          sig { returns(T.nilable(String)) }
          attr_accessor :stop_sequence

          sig do
            params(
              container: T.nilable(Anthropic::Beta::BetaContainer::OrHash),
              stop_details:
                T.nilable(Anthropic::Beta::BetaRefusalStopDetails::OrHash),
              stop_reason: T.nilable(Anthropic::Beta::BetaStopReason::OrSymbol),
              stop_sequence: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Information about the container used in the request (for the code execution
            # tool)
            container:,
            # Structured information about a refusal.
            stop_details:,
            stop_reason:,
            stop_sequence:
          )
          end

          sig do
            override.returns(
              {
                container: T.nilable(Anthropic::Beta::BetaContainer),
                stop_details:
                  T.nilable(Anthropic::Beta::BetaRefusalStopDetails),
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
