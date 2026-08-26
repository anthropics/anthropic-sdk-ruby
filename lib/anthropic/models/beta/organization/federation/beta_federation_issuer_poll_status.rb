# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Federation
          class BetaFederationIssuerPollStatus < Anthropic::Internal::Type::BaseModel
            # @!attribute consecutive_failures
            #   Consecutive fetch failures since the last success.
            #
            #   @return [Integer]
            required :consecutive_failures, Integer

            # @!attribute last_fetched_at
            #   When the last successful fetch completed.
            #
            #   @return [Time, nil]
            required :last_fetched_at, Time, nil?: true

            # @!attribute next_poll_at
            #   When the next fetch is scheduled. Null if paused.
            #
            #   @return [Time, nil]
            required :next_poll_at, Time, nil?: true

            # @!method initialize(consecutive_failures:, last_fetched_at:, next_poll_at:)
            #   Status of automatic JWKS polling for a federation issuer.
            #
            #   Anthropic periodically fetches the issuer's signing keys in the background.
            #   These fields summarize the most recent fetches so the health of the JWKS
            #   endpoint can be monitored.
            #
            #   @param consecutive_failures [Integer] Consecutive fetch failures since the last success.
            #
            #   @param last_fetched_at [Time, nil] When the last successful fetch completed.
            #
            #   @param next_poll_at [Time, nil] When the next fetch is scheduled. Null if paused.
          end
        end
      end
    end
  end
end
