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
        #   Human-readable description of the conflict, naming the dream that holds the
        #   target store when the server can identify it.
        #
        #   @return [String, nil]
        optional :message, String

        # @!method initialize(message: nil, type: :conflict_error)
        #   The `output_behavior.memory_store_id` target is still held by a prior
        #   `{type: "update_existing"}` dream — one that is `pending` or `running`, or was
        #   canceled with its final writes still landing. Rarely the named dream has just
        #   finished (`completed`/`failed`) and its execution is still closing; an immediate
        #   retry then almost always succeeds. The message names the holding dream when the
        #   server can identify it (rarely omitted); poll it to a terminal state or cancel
        #   it, then retry. Carried with `x-should-retry: false`.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaTargetStoreHeldError} for more details.
        #
        #   @param message [String] Human-readable description of the conflict, naming the dream that holds the targ
        #
        #   @param type [Symbol, :conflict_error]
      end
    end

    BetaTargetStoreHeldError = Beta::BetaTargetStoreHeldError
  end
end
