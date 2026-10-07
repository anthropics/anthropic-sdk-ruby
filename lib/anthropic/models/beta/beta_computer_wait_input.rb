# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaComputerWaitInput < Anthropic::Internal::Type::BaseModel
        # @!attribute duration
        #   Duration to wait, in seconds.
        #
        #   @return [Integer]
        required :duration, Integer

        # @!method initialize(duration:)
        #   Wait for a specified duration.
        #
        #   @param duration [Integer] Duration to wait, in seconds.
      end
    end

    BetaComputerWaitInput = Beta::BetaComputerWaitInput
  end
end
