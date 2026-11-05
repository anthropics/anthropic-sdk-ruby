# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTargetStoreHeldError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :conflict_error]
        required :type, const: :conflict_error

        # @!attribute message
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(message: nil, type: :conflict_error)
        #   Returned with status 409 when a request to create a dream sets `output_behavior`
        #   to `update_existing` and another dream that writes into the same memory store
        #   hasn't fully stopped.
        #
        #   The other dream is `pending` or `running`, or it has just stopped and is still
        #   finishing its last writes. `message` gives the ID of the other dream when the
        #   server can identify it. If that dream has already reached `completed`, `failed`,
        #   or `canceled`, retry after a short wait. Otherwise, wait for the other dream to
        #   end or cancel it, then retry. The response sets the `x-should-retry` header to
        #   `false`.
        #
        #   @param message [String]
        #   @param type [Symbol, :conflict_error]
      end
    end

    BetaTargetStoreHeldError = Beta::BetaTargetStoreHeldError
  end
end
