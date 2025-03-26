# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaRawMessageDeltaEvent < Anthropic::BaseModel
        # @!attribute delta
        #
        #   @return [Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta]
        required :delta, -> { Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta }

        # @!attribute type
        #
        #   @return [Symbol, :message_delta]
        required :type, const: :message_delta

        # @!attribute usage
        #   Billing and rate-limit usage.
        #
        #     Anthropic's API bills and rate-limits by token counts, as tokens represent the
        #     underlying cost to our systems.
        #
        #     Under the hood, the API transforms requests into a format suitable for the
        #     model. The model's output then goes through a parsing stage before becoming an
        #     API response. As a result, the token counts in `usage` will not match one-to-one
        #     with the exact visible content of an API request or response.
        #
        #     For example, `output_tokens` will be non-zero, even for an empty string response
        #     from Claude.
        #
        #     Total input tokens in a request is the summation of `input_tokens`,
        #     `cache_creation_input_tokens`, and `cache_read_input_tokens`.
        #
        #   @return [Anthropic::Models::Beta::BetaMessageDeltaUsage]
        required :usage, -> { Anthropic::Models::Beta::BetaMessageDeltaUsage }

        # @!parse
        #   # @param delta [Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta]
        #   # @param usage [Anthropic::Models::Beta::BetaMessageDeltaUsage]
        #   # @param type [Symbol, :message_delta]
        #   #
        #   def initialize(delta:, usage:, type: :message_delta, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        class Delta < Anthropic::BaseModel
          # @!attribute stop_reason
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaStopReason, nil]
          required :stop_reason, enum: -> { Anthropic::Models::Beta::BetaStopReason }, nil?: true

          # @!attribute stop_sequence
          #
          #   @return [String, nil]
          required :stop_sequence, String, nil?: true

          # @!parse
          #   # @param stop_reason [Symbol, Anthropic::Models::Beta::BetaStopReason, nil]
          #   # @param stop_sequence [String, nil]
          #   #
          #   def initialize(stop_reason:, stop_sequence:, **) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void
        end
      end
    end

    BetaRawMessageDeltaEvent = Beta::BetaRawMessageDeltaEvent
  end
end
