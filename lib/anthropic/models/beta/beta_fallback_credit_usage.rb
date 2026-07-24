# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaFallbackCreditUsage < Anthropic::Internal::Type::BaseModel
        # @!attribute status
        #   Whether the fallback-credit reprice was applied to this response's billing.
        #
        #   A union discriminated on `type`. `redeemed`: the retry is billed as if the
        #   conversation had been on the retry model all along — including when the
        #   resulting shift is zero because there was nothing to move. `not_applied`: no
        #   reprice was applied; the arm's `reason` says why.
        #
        #   @return [Anthropic::Models::Beta::BetaFallbackCreditRedeemed, Anthropic::Models::Beta::BetaFallbackCreditNotApplied]
        required :status, union: -> { Anthropic::Beta::BetaFallbackCreditUsage::Status }

        # @!method initialize(status:)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaFallbackCreditUsage} for more details.
        #
        #   Outcome of the `fallback_credit_token` presented on this request.
        #
        #   @param status [Anthropic::Models::Beta::BetaFallbackCreditRedeemed, Anthropic::Models::Beta::BetaFallbackCreditNotApplied] Whether the fallback-credit reprice was applied to this response's billing.

        # Whether the fallback-credit reprice was applied to this response's billing.
        #
        # A union discriminated on `type`. `redeemed`: the retry is billed as if the
        # conversation had been on the retry model all along — including when the
        # resulting shift is zero because there was nothing to move. `not_applied`: no
        # reprice was applied; the arm's `reason` says why.
        #
        # @see Anthropic::Models::Beta::BetaFallbackCreditUsage#status
        module Status
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # The reprice was applied: the retry is billed as if the conversation
          # had been on the retry model all along.
          variant :redeemed, -> { Anthropic::Beta::BetaFallbackCreditRedeemed }

          # No reprice was applied; ``reason`` says why.
          variant :not_applied, -> { Anthropic::Beta::BetaFallbackCreditNotApplied }

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaFallbackCreditRedeemed, Anthropic::Models::Beta::BetaFallbackCreditNotApplied)]
        end
      end
    end

    BetaFallbackCreditUsage = Beta::BetaFallbackCreditUsage
  end
end
