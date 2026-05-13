# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaDiagnosticsParam < Anthropic::Internal::Type::BaseModel
        # @!attribute previous_message_id
        #   The `id` (`msg_...`) from this client's previous /v1/messages response. The
        #   server compares that request's prompt fingerprint against this one and returns
        #   `diagnostics.cache_miss_reason` when the prompt-cache prefix could not be
        #   reused. Pass `null` on the first turn to opt in without a prior message to
        #   compare.
        #
        #   @return [String, nil]
        optional :previous_message_id, String, nil?: true

        # @!method initialize(previous_message_id: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaDiagnosticsParam} for more details.
        #
        #   Request-level diagnostics. Currently carries the previous response id for
        #   prompt-cache divergence reporting.
        #
        #   @param previous_message_id [String, nil] The `id` (`msg_...`) from this client's previous /v1/messages response. The serv
      end
    end

    BetaDiagnosticsParam = Beta::BetaDiagnosticsParam
  end
end
