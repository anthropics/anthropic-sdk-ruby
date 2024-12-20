# frozen_string_literal: true

module Anthropic
  module Models
    class RawMessageDeltaEvent < Anthropic::BaseModel
      # @!attribute delta
      #
      #   @return [Anthropic::Models::RawMessageDeltaEvent::Delta]
      required :delta, -> { Anthropic::Models::RawMessageDeltaEvent::Delta }

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::RawMessageDeltaEvent::Type]
      required :type, enum: -> { Anthropic::Models::RawMessageDeltaEvent::Type }

      # @!attribute usage
      #   Billing and rate-limit usage.
      #
      # Anthropic's API bills and rate-limits by token counts, as tokens represent the underlying cost to our systems.
      #
      # Under the hood, the API transforms requests into a format suitable for the model. The model's output then goes through a parsing stage before becoming an API response. As a result, the token counts in `usage` will not match one-to-one with the exact visible content of an API request or response.
      #
      # For example, `output_tokens` will be non-zero, even for an empty string response from Claude.
      #
      #   @return [Anthropic::Models::MessageDeltaUsage]
      required :usage, -> { Anthropic::Models::MessageDeltaUsage }

      # @!parse
      #   # @param delta [Anthropic::Models::RawMessageDeltaEvent::Delta]
      #   #
      #   # @param type [String]
      #   #
      #   # @param usage [Anthropic::Models::MessageDeltaUsage] Billing and rate-limit usage.
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
      #   def initialize(delta:, type:, usage:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      class Delta < Anthropic::BaseModel
        # @!attribute stop_reason
        #
        #   @return [Symbol, Anthropic::Models::RawMessageDeltaEvent::Delta::StopReason]
        required :stop_reason, enum: -> { Anthropic::Models::RawMessageDeltaEvent::Delta::StopReason }

        # @!attribute stop_sequence
        #
        #   @return [String]
        required :stop_sequence, String

        # @!parse
        #   # @param stop_reason [String, nil]
        #   # @param stop_sequence [String, nil]
        #   #
        #   def initialize(stop_reason:, stop_sequence:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        #
        # ```ruby
        # case enum
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

      # @example
      #
      # ```ruby
      # case enum
      # in :message_delta
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        MESSAGE_DELTA = :message_delta

        finalize!
      end
    end
  end
end
