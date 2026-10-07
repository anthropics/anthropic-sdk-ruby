# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBrowserWaitInput < Anthropic::Internal::Type::BaseModel
        # @!attribute duration
        #   Seconds to wait (maximum 30).
        #
        #   @return [Float]
        required :duration, Float

        # @!attribute tab_id
        #   Tab to act on. Defaults to the active tab when omitted.
        #
        #   @return [String, nil]
        optional :tab_id, String, nil?: true

        # @!method initialize(duration:, tab_id: nil)
        #   Pause for the given duration.
        #
        #   @param duration [Float] Seconds to wait (maximum 30).
        #
        #   @param tab_id [String, nil] Tab to act on. Defaults to the active tab when omitted.
      end
    end

    BetaBrowserWaitInput = Beta::BetaBrowserWaitInput
  end
end
