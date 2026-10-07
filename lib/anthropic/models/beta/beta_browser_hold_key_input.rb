# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserHoldKeyInput < Anthropic::Internal::Type::BaseModel
        # @!attribute duration
        #   Seconds to hold the key down (maximum 30).
        #
        #   @return [Float]
        required :duration, Float

        # @!attribute text
        #   The key or chord to hold.
        #
        #   @return [String]
        required :text, String

        # @!attribute tab_id
        #   Tab to act on. Defaults to the active tab when omitted.
        #
        #   @return [String, nil]
        optional :tab_id, String, nil?: true

        # @!method initialize(duration:, text:, tab_id: nil)
        #   Hold a key or key chord down for a duration, then release it. Uses the same key
        #   names and "+" chord syntax as the key action.
        #
        #   @param duration [Float] Seconds to hold the key down (maximum 30).
        #
        #   @param text [String] The key or chord to hold.
        #
        #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
      end
    end

    BetaBrowserHoldKeyInput = Beta::BetaBrowserHoldKeyInput
  end
end
