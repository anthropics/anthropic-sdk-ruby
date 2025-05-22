# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRawMessageDeltaEvent < Anthropic::Internal::Type::BaseModel
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

        # @!method initialize(delta:, usage:, type: :message_delta)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaRawMessageDeltaEvent} for more details.
        #
        #   @param delta [Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta]
        #
        #   @param usage [Anthropic::Models::Beta::BetaMessageDeltaUsage] Billing and rate-limit usage.
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

          # @!attribute stop_reason
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaStopReason, nil]
          required :stop_reason, enum: -> { Anthropic::Beta::BetaStopReason }, nil?: true

          # @!attribute stop_sequence
          #
          #   @return [String, nil]
          required :stop_sequence, String, nil?: true

          # @!method initialize(container:, stop_reason:, stop_sequence:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta} for more details.
          #
          #   @param container [Anthropic::Models::Beta::BetaContainer, nil] Information about the container used in the request (for the code execution tool
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
