# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # raw_message_delta_event => {
    #   delta: Anthropic::Models::RawMessageDeltaEvent::Delta,
    #   type: :message_delta,
    #   usage: Anthropic::Models::MessageDeltaUsage
    # }
    # ```
    class RawMessageDeltaEvent < Anthropic::BaseModel
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
      #   @return [Anthropic::Models::MessageDeltaUsage]
      required :usage, -> { Anthropic::Models::MessageDeltaUsage }

      # @!parse
      #   # @param delta [Anthropic::Models::RawMessageDeltaEvent::Delta]
      #   # @param usage [Anthropic::Models::MessageDeltaUsage]
      #   # @param type [String]
      #   #
      #   def initialize(delta:, usage:, type: :message_delta, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      # ```ruby
      # delta => {
      #   stop_reason: Anthropic::Models::RawMessageDeltaEvent::Delta::StopReason,
      #   stop_sequence: String
      # }
      # ```
      class Delta < Anthropic::BaseModel
        # @!attribute stop_reason
        #
        #   @return [Symbol, Anthropic::Models::RawMessageDeltaEvent::Delta::StopReason, nil]
        required :stop_reason,
                 enum: -> {
                   Anthropic::Models::RawMessageDeltaEvent::Delta::StopReason
                 },
                 nil?: true

        # @!attribute stop_sequence
        #
        #   @return [String, nil]
        required :stop_sequence, String, nil?: true

        # @!parse
        #   # @param stop_reason [String, nil]
        #   # @param stop_sequence [String, nil]
        #   #
        #   def initialize(stop_reason:, stop_sequence:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        # ```ruby
        # case stop_reason
        # in :end_turn
        #   # ...
        # in :max_tokens
        #   # ...
        # in :stop_sequence
        #   # ...
        # in :tool_use
        #   # ...
        # end
        # ```
        class StopReason < Anthropic::Enum
          END_TURN = :end_turn
          MAX_TOKENS = :max_tokens
          STOP_SEQUENCE = :stop_sequence
          TOOL_USE = :tool_use

          finalize!
        end
      end
    end
  end
end
