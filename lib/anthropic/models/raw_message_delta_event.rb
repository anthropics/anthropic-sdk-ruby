# frozen_string_literal: true

module Anthropic
  module Models
    class RawMessageDeltaEvent < Anthropic::Internal::Type::BaseModel
      # @!attribute delta
      #
      #   @return [Anthropic::Models::RawMessageDeltaEvent::Delta]
      required :delta, -> { Anthropic::Models::RawMessageDeltaEvent::Delta }

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
      #   @return [Anthropic::Models::MessageDeltaUsage]
      required :usage, -> { Anthropic::Models::MessageDeltaUsage }

      # @!parse
      #   # @param delta [Anthropic::Models::RawMessageDeltaEvent::Delta]
      #   # @param usage [Anthropic::Models::MessageDeltaUsage]
      #   # @param type [Symbol, :message_delta]
      #   #
      #   def initialize(delta:, usage:, type: :message_delta, **) = super

      # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void

      # @see Anthropic::Models::RawMessageDeltaEvent#delta
      class Delta < Anthropic::Internal::Type::BaseModel
        # @!attribute stop_reason
        #
        #   @return [Symbol, Anthropic::Models::StopReason, nil]
        required :stop_reason, enum: -> { Anthropic::Models::StopReason }, nil?: true

        # @!attribute stop_sequence
        #
        #   @return [String, nil]
        required :stop_sequence, String, nil?: true

        # @!parse
        #   # @param stop_reason [Symbol, Anthropic::Models::StopReason, nil]
        #   # @param stop_sequence [String, nil]
        #   #
        #   def initialize(stop_reason:, stop_sequence:, **) = super

        # def initialize: (Hash | Anthropic::Internal::Type::BaseModel) -> void
      end
    end
  end
end
