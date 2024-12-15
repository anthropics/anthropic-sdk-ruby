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
        #   @return [Symbol, Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Type }

        # @!attribute usage
        #   Billing and rate-limit usage.
        #
        # Anthropic's API bills and rate-limits by token counts, as tokens represent the underlying cost to our systems.
        #
        # Under the hood, the API transforms requests into a format suitable for the model. The model's output then goes through a parsing stage before becoming an API response. As a result, the token counts in `usage` will not match one-to-one with the exact visible content of an API request or response.
        #
        # For example, `output_tokens` will be non-zero, even for an empty string response from Claude.
        #
        #   @return [Anthropic::Models::Beta::BetaMessageDeltaUsage]
        required :usage, -> { Anthropic::Models::Beta::BetaMessageDeltaUsage }

        # @!parse
        #   # @param delta [Object]
        #   #
        #   # @param type [String]
        #   #
        #   # @param usage [Object] Billing and rate-limit usage.
        #   #
        #   #   Anthropic's API bills and rate-limits by token counts, as tokens represent the
        #   #   underlying cost to our systems.
        #   #
        #   #   Under the hood, the API transforms requests into a format suitable for the
        #   #   model. The model's output then goes through a parsing stage before becoming an
        #   #   API response. As a result, the token counts in `usage` will not match one-to-one
        #   #   with the exact visible content of an API request or response.
        #   #
        #   #   For example, `output_tokens` will be non-zero, even for an empty string response
        #   #   from Claude.
        #   #
        #   def initialize(delta:, type:, usage:) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        class Delta < Anthropic::BaseModel
          # @!attribute stop_reason
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta::StopReason]
          required :stop_reason,
                   enum: -> {
                     Anthropic::Models::Beta::BetaRawMessageDeltaEvent::Delta::StopReason
                   }

          # @!attribute stop_sequence
          #
          #   @return [String]
          required :stop_sequence, String

          # @!parse
          #   # @param stop_reason [String]
          #   # @param stop_sequence [String]
          #   #
          #   def initialize(stop_reason:, stop_sequence:) = super

          # def initialize: (Hash | Anthropic::BaseModel) -> void

          class StopReason < Anthropic::Enum
            END_TURN = :end_turn
            MAX_TOKENS = :max_tokens
            STOP_SEQUENCE = :stop_sequence
            TOOL_USE = :tool_use
          end
        end

        class Type < Anthropic::Enum
          MESSAGE_DELTA = :message_delta
        end
      end
    end

    BetaRawMessageDeltaEvent = Beta::BetaRawMessageDeltaEvent
  end
end
