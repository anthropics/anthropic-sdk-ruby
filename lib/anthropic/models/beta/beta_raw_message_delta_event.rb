# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRawMessageDeltaEvent < Anthropic::Internal::Type::BaseModel
        # @!attribute context_management
        #   Information about context management strategies applied during the request
        #
        #   @return [Anthropic::Models::Beta::BetaContextManagementResponse, nil]
        required :context_management, -> { Anthropic::Beta::BetaContextManagementResponse }, nil?: true

        # @!attribute delta
        #
        #   @return [Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta]
        required :delta, -> { Anthropic::Beta::BetaRawMessageDeltaEvent::Delta }

        # @!attribute type
        #
        #   @return [Symbol, :message_delta]
        required :type, const: :message_delta

        # @!attribute usage
        #   Billing and rate-limit usage.
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
        #
        #   @return [Anthropic::Models::Beta::BetaMessageDeltaUsage]
        required :usage, -> { Anthropic::Beta::BetaMessageDeltaUsage }

        # @!attribute input_transformations
        #   Changes the API made to the request's input before showing it to the model, and
        #   blocks that failed a binding check but were left unchanged: one entry per block,
        #   in request order. Two entry types today. `thinking_dropped` — a `thinking`,
        #   `redacted_thinking` or `connector_text` block from the request's `messages` that
        #   was removed from the prompt instead of being shown to the model because it
        #   failed a binding check. `thinking_mismatch_allowed` — a `thinking` or
        #   `redacted_thinking` block that failed the conversation check (the conversation
        #   before it differs from the one it was created in, or it carries no record of one
        #   on a model that requires it) and was shown to the model all the same, because
        #   that check is not enforced for this request. More entry types may be added over
        #   time; ignore types you do not recognize.
        #
        #   Requires `anthropic-beta: thinking-binding-controls-2026-08-01`. Present on
        #   every such response from a model that supports extended thinking, as `[]` when
        #   there is no entry to report; without the beta, blocks are removed or left in
        #   place all the same but nothing is reported. Removed blocks contribute nothing to
        #   `usage.input_tokens`; blocks left in place count as sent. When streaming, the
        #   array is final in `message_start`; the final `message_delta` event carries it
        #   only when a server-side model fallback happened mid-stream, in which case it
        #   holds the serving model's entries and replaces the one in `message_start`.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaThinkingDroppedInputTransformation, Anthropic::Models::Beta::BetaThinkingMismatchAllowedInputTransformation>, nil]
        optional :input_transformations,
                 -> {
                   Anthropic::Internal::Type::ArrayOf[union: Anthropic::Beta::BetaRawMessageDeltaEvent::InputTransformation]
                 },
                 nil?: true

        # @!method initialize(context_management:, delta:, usage:, input_transformations: nil, type: :message_delta)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaRawMessageDeltaEvent} for more details.
        #
        #   @param context_management [Anthropic::Models::Beta::BetaContextManagementResponse, nil] Information about context management strategies applied during the request
        #
        #   @param delta [Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta]
        #
        #   @param usage [Anthropic::Models::Beta::BetaMessageDeltaUsage] Billing and rate-limit usage.
        #
        #   @param input_transformations [Array<Anthropic::Models::Beta::BetaThinkingDroppedInputTransformation, Anthropic::Models::Beta::BetaThinkingMismatchAllowedInputTransformation>, nil] Changes the API made to the request's input before showing it to the model,
        #
        #   @param type [Symbol, :message_delta]

        # @see Anthropic::Models::Beta::BetaRawMessageDeltaEvent#delta
        class Delta < Anthropic::Internal::Type::BaseModel
          # @!attribute container
          #   Information about the container used in the request (for the code execution
          #   tool)
          #
          #   @return [Anthropic::Models::Beta::BetaContainer, nil]
          required :container, -> { Anthropic::Beta::BetaContainer }, nil?: true

          # @!attribute stop_details
          #   Structured information about a refusal.
          #
          #   @return [Anthropic::Models::Beta::BetaRefusalStopDetails, nil]
          required :stop_details, -> { Anthropic::Beta::BetaRefusalStopDetails }, nil?: true

          # @!attribute stop_reason
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaStopReason, nil]
          required :stop_reason, enum: -> { Anthropic::Beta::BetaStopReason }, nil?: true

          # @!attribute stop_sequence
          #
          #   @return [String, nil]
          required :stop_sequence, String, nil?: true

          # @!method initialize(container:, stop_details:, stop_reason:, stop_sequence:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta} for more details.
          #
          #   @param container [Anthropic::Models::Beta::BetaContainer, nil] Information about the container used in the request (for the code execution tool
          #
          #   @param stop_details [Anthropic::Models::Beta::BetaRefusalStopDetails, nil] Structured information about a refusal.
          #
          #   @param stop_reason [Symbol, Anthropic::Models::Beta::BetaStopReason, nil]
          #
          #   @param stop_sequence [String, nil]
        end

        module InputTransformation
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :thinking_dropped, -> { Anthropic::Beta::BetaThinkingDroppedInputTransformation }

          variant :thinking_mismatch_allowed, -> { Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation }

          module Type
            extend Anthropic::Internal::Type::Enum

            THINKING_DROPPED = :thinking_dropped
            THINKING_MISMATCH_ALLOWED = :thinking_mismatch_allowed

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaThinkingDroppedInputTransformation, Anthropic::Models::Beta::BetaThinkingMismatchAllowedInputTransformation)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::BetaRawMessageDeltaEvent::InputTransformation} for
          # more details.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :path Where the removed block was in your request, as `messages.{i}.content.{j}`:
          #
          #   @option args [Symbol, Anthropic::Models::Beta::BetaThinkingDroppedInputTransformation::Reason, Symbol, Anthropic::Models::Beta::BetaThinkingMismatchAllowedInputTransformation::Reason] :reason Which binding check removed the block: `model_binding_mismatch` — it was
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaThinkingDroppedInputTransformation, Anthropic::Models::Beta::BetaThinkingMismatchAllowedInputTransformation]
          def self.new(type:, **args)
            case type.to_sym
            when :thinking_dropped
              Anthropic::Beta::BetaThinkingDroppedInputTransformation.new(**args)
            when :thinking_mismatch_allowed
              Anthropic::Beta::BetaThinkingMismatchAllowedInputTransformation.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaRawMessageDeltaEvent = Beta::BetaRawMessageDeltaEvent
  end
end
