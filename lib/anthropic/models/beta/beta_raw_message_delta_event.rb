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
        #   Changes the API made to the request's input before showing it to the model: one
        #   entry per change, in request order. Today the only entry type is
        #   `thinking_dropped` — a `thinking`, `redacted_thinking` or `connector_text` block
        #   from the request's `messages` that was removed from the prompt instead of being
        #   shown to the model because it failed a binding check. More entry types may be
        #   added over time; ignore types you do not recognize.
        #
        #   Requires `anthropic-beta: thinking-binding-controls-2026-08-01`. Present on
        #   every such response from a model that supports extended thinking, as `[]` when
        #   nothing was changed; without the beta, blocks are removed all the same but
        #   nothing is reported. Removed blocks contribute nothing to `usage.input_tokens`.
        #   When streaming, the array is final in `message_start`; the final `message_delta`
        #   event carries it only when a server-side model fallback happened mid-stream, in
        #   which case it holds the serving model's entries and replaces the one in
        #   `message_start`.
        #
        #   @return [Array<Anthropic::Models::Beta::BetaThinkingDroppedInputTransformation>, nil]
        optional :input_transformations,
                 -> {
                   Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::BetaThinkingDroppedInputTransformation]
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
        #   @param input_transformations [Array<Anthropic::Models::Beta::BetaThinkingDroppedInputTransformation>, nil] Changes the API made to the request's input before showing it to the model:
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
      end
    end

    BetaRawMessageDeltaEvent = Beta::BetaRawMessageDeltaEvent
  end
end
