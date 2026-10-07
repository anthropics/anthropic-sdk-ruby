# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaComputerCursorPositionInput < Anthropic::Internal::Type::BaseModel
        # @!method initialize
        #   Get the current (x, y) pixel coordinate of the cursor.
      end
    end

    BetaComputerCursorPositionInput = Beta::BetaComputerCursorPositionInput
  end
end
