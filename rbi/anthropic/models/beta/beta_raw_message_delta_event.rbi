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

        # Changes the API made to the request's input before showing it to the model, and
        # blocks that failed a binding check but were left unchanged: one entry per block,
        # in request order. Two entry types today. `thinking_dropped` — a `thinking`,
        # `redacted_thinking` or `connector_text` block from the request's `messages` that
        # was removed from the prompt instead of being shown to the model because it
        # failed a binding check. `thinking_mismatch_allowed` — a `thinking` or
        # `redacted_thinking` block that failed the conversation check (the conversation
        # before it differs from the one it was created in, or it carries no record of one
        # on a model that requires it) and was shown to the model all the same, because
        # that check is not enforced for this request. More entry types may be added over
        # time; ignore types you do not recognize.
        #
        # Requires `anthropic-beta: thinking-binding-controls-2026-08-01`. Present on
        # every such response from a model that supports extended thinking, as `[]` when
        # there is no entry to report; without the beta, blocks are removed or left in
        # place all the same but nothing is reported. Removed blocks contribute nothing to
        # `usage.input_tokens`; blocks left in place count as sent. When streaming, the
        # array is final in `message_start`; the final `message_delta` event carries it
        # only when a server-side model fallback happened mid-stream, in which case it
        # holds the serving model's entries and replaces the one in `message_start`.
        sig do
          returns(
            T.nilable(
              T::Array[
                Anthropic::Beta::BetaRawMessageDeltaEvent::InputTransformation::Variants
              ]
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
                  T.any(
                    Anthropic::Beta::BetaThinkingDroppedInputTransformation::OrHash,
                    Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation::OrHash
                  )
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
          # Changes the API made to the request's input before showing it to the model, and
          # blocks that failed a binding check but were left unchanged: one entry per block,
          # in request order. Two entry types today. `thinking_dropped` — a `thinking`,
          # `redacted_thinking` or `connector_text` block from the request's `messages` that
          # was removed from the prompt instead of being shown to the model because it
          # failed a binding check. `thinking_mismatch_allowed` — a `thinking` or
          # `redacted_thinking` block that failed the conversation check (the conversation
          # before it differs from the one it was created in, or it carries no record of one
          # on a model that requires it) and was shown to the model all the same, because
          # that check is not enforced for this request. More entry types may be added over
          # time; ignore types you do not recognize.
          #
          # Requires `anthropic-beta: thinking-binding-controls-2026-08-01`. Present on
          # every such response from a model that supports extended thinking, as `[]` when
          # there is no entry to report; without the beta, blocks are removed or left in
          # place all the same but nothing is reported. Removed blocks contribute nothing to
          # `usage.input_tokens`; blocks left in place count as sent. When streaming, the
          # array is final in `message_start`; the final `message_delta` event carries it
          # only when a server-side model fallback happened mid-stream, in which case it
          # holds the serving model's entries and replaces the one in `message_start`.
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
                    Anthropic::Beta::BetaRawMessageDeltaEvent::InputTransformation::Variants
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

        module InputTransformation
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaThinkingDroppedInputTransformation,
                Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::BetaRawMessageDeltaEvent::InputTransformation::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            THINKING_DROPPED =
              T.let(
                :thinking_dropped,
                Anthropic::Beta::BetaRawMessageDeltaEvent::InputTransformation::Type::TaggedSymbol
              )
            THINKING_MISMATCH_ALLOWED =
              T.let(
                :thinking_mismatch_allowed,
                Anthropic::Beta::BetaRawMessageDeltaEvent::InputTransformation::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::BetaRawMessageDeltaEvent::InputTransformation::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaRawMessageDeltaEvent::InputTransformation::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: T.any(Symbol, String),
              path: String,
              reason:
                T.any(
                  Anthropic::Beta::BetaThinkingDroppedInputTransformation::Reason::OrSymbol,
                  Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation::Reason::OrSymbol
                )
            ).returns(
              Anthropic::Beta::BetaRawMessageDeltaEvent::InputTransformation::Variants
            )
          end
          def self.new(
            type:,
            # Where the removed block was in your request, as `messages.{i}.content.{j}`: `i`
            # indexes the `messages` array you sent and `j` that message's `content` array —
            # the same form error messages use.
            path:,
            # Which binding check removed the block: `model_binding_mismatch` — it was created
            # by a model whose reasoning the requested model may not read;
            # `prefix_binding_mismatch` — the conversation before it differs from the
            # conversation it was created in (the rest of that turn's consecutive thinking
            # blocks are removed with it, each with this reason);
            # `organization_binding_mismatch` — it was created under a different organization
            # (an Anthropic organization, AWS account or Google Cloud project) and this
            # organization is not one of its additional organizations;
            # `end_user_binding_mismatch` — it was created for a different end user, or was
            # removed by the consumer-organization binding. A block that would fail several
            # checks reports one reason, in this order of precedence:
            # `organization_binding_mismatch`, `end_user_binding_mismatch`,
            # `model_binding_mismatch`, `prefix_binding_mismatch`.
            reason:
          )
          end
        end
      end
    end
  end
end
