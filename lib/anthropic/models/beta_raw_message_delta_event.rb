# frozen_string_literal: true

module Anthropic
  module Models
    class BetaRawMessageDeltaEvent < BaseModel
      # @!attribute [rw] delta
      #   @return [Anthropic::Models::BetaRawMessageDeltaEvent::Delta]
      required :delta, -> { Anthropic::Models::BetaRawMessageDeltaEvent::Delta }

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaRawMessageDeltaEvent::Type]
      required :type, enum: -> { Anthropic::Models::BetaRawMessageDeltaEvent::Type }

      # @!attribute [rw] usage
      #   Billing and rate-limit usage.
      #
      # Anthropic's API bills and rate-limits by token counts, as tokens represent the underlying cost to our systems.
      #
      # Under the hood, the API transforms requests into a format suitable for the model. The model's output then goes through a parsing stage before becoming an API response. As a result, the token counts in `usage` will not match one-to-one with the exact visible content of an API request or response.
      #
      # For example, `output_tokens` will be non-zero, even for an empty string response from Claude.
      #   @return [Anthropic::Models::BetaMessageDeltaUsage]
      required :usage, -> { Anthropic::Models::BetaMessageDeltaUsage }

      class Delta < BaseModel
        # @!attribute [rw] stop_reason
        #   @return [Symbol, Anthropic::Models::BetaRawMessageDeltaEvent::Delta::StopReason]
        required :stop_reason, enum: -> { Anthropic::Models::BetaRawMessageDeltaEvent::Delta::StopReason }

        # @!attribute [rw] stop_sequence
        #   @return [String]
        required :stop_sequence, String

        class StopReason < Anthropic::Enum
          END_TURN = :end_turn
          MAX_TOKENS = :max_tokens
          STOP_SEQUENCE = :stop_sequence
          TOOL_USE = :tool_use
        end

        # @!parse
        #   # Create a new instance of Delta from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String] :stop_reason
        #   #   @option data [String] :stop_sequence
        #   def initialize(data = {}) = super
      end

      class Type < Anthropic::Enum
        MESSAGE_DELTA = :message_delta
      end

      # @!parse
      #   # Create a new instance of BetaRawMessageDeltaEvent from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Object] :delta
      #   #   @option data [String] :type
      #   #   @option data [Object] :usage Billing and rate-limit usage.
      #   #
      #   #     Anthropic's API bills and rate-limits by token counts, as tokens represent the
      #   #     underlying cost to our systems.
      #   #
      #   #     Under the hood, the API transforms requests into a format suitable for the
      #   #     model. The model's output then goes through a parsing stage before becoming an
      #   #     API response. As a result, the token counts in `usage` will not match one-to-one
      #   #     with the exact visible content of an API request or response.
      #   #
      #   #     For example, `output_tokens` will be non-zero, even for an empty string response
      #   #     from Claude.
      #   def initialize(data = {}) = super
    end
  end
end
