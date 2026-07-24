# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaFallbackCreditTokenParam < Anthropic::Internal::Type::BaseModel
        # @!attribute token
        #   The opaque `fallback_credit_token` from a prior refusal's `stop_details` — the
        #   same string the bare-string form carries.
        #
        #   @return [String]
        required :token, String

        # @!attribute mode
        #   How a failing token affects the retry. `strict` (the default, and the
        #   bare-string behavior): a failing redemption is a 400 and the retry is not
        #   served. `best_effort`: the retry is served either way — a token-layer failure no
        #   longer rejects the request; the retry proceeds at normal price and the outcome
        #   is reported on the response's `usage.fallback_credit`. Two failures stay hard in
        #   both modes: a malformed token, and combining `fallback_credit_token` with
        #   `fallbacks`.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaFallbackCreditTokenParam::Mode, nil]
        optional :mode, enum: -> { Anthropic::Beta::BetaFallbackCreditTokenParam::Mode }

        # @!method initialize(token:, mode: nil)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaFallbackCreditTokenParam} for more details.
        #
        #   Object form of `fallback_credit_token`: the token plus a redemption mode.
        #
        #   Requires `anthropic-beta: fallback-credit-2026-07-01`; without that header the
        #   field accepts the bare string only. The bare string and the mode-less object are
        #   equivalent (both select `strict`), so wrapping an existing token changes nothing
        #   by itself.
        #
        #   @param token [String] The opaque `fallback_credit_token` from a prior refusal's `stop_details` — the s
        #
        #   @param mode [Symbol, Anthropic::Models::Beta::BetaFallbackCreditTokenParam::Mode] How a failing token affects the retry. `strict` (the default, and the bare-strin

        # How a failing token affects the retry. `strict` (the default, and the
        # bare-string behavior): a failing redemption is a 400 and the retry is not
        # served. `best_effort`: the retry is served either way — a token-layer failure no
        # longer rejects the request; the retry proceeds at normal price and the outcome
        # is reported on the response's `usage.fallback_credit`. Two failures stay hard in
        # both modes: a malformed token, and combining `fallback_credit_token` with
        # `fallbacks`.
        #
        # @see Anthropic::Models::Beta::BetaFallbackCreditTokenParam#mode
        module Mode
          extend Anthropic::Internal::Type::Enum

          STRICT = :strict
          BEST_EFFORT = :best_effort

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaFallbackCreditTokenParam = Beta::BetaFallbackCreditTokenParam
  end
end
