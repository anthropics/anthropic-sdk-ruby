# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaFallbackCreditNotApplied < Anthropic::Internal::Type::BaseModel
        # @!attribute reason
        #   Why the reprice was not applied.
        #
        #   A closed enum; additions to the redemption-check vocabulary arrive as deliberate
        #   schema updates.
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaFallbackCreditNotApplied::Reason]
        required :reason, enum: -> { Anthropic::Beta::BetaFallbackCreditNotApplied::Reason }

        # @!attribute type
        #
        #   @return [Symbol, :not_applied]
        required :type, const: :not_applied

        # @!attribute remove_to_redeem
        #   Request fields to remove before retrying, so the retry can redeem this token.
        #
        #   Present exactly when `reason` is `variant_fields_present` — never null, never an
        #   empty array; absent otherwise. Fields are named only from your own request, and
        #   only after the sealed variant hash matched. A served best-effort retry has
        #   already been billed at normal price; nothing redeems retroactively, but a
        #   corrected re-send inside the token's five-minute window can still redeem.
        #
        #   @return [Array<String>, nil]
        optional :remove_to_redeem, Anthropic::Internal::Type::ArrayOf[String], nil?: true

        # @!method initialize(reason:, remove_to_redeem: nil, type: :not_applied)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaFallbackCreditNotApplied} for more details.
        #
        #   No reprice was applied; `reason` says why.
        #
        #   @param reason [Symbol, Anthropic::Models::Beta::BetaFallbackCreditNotApplied::Reason] Why the reprice was not applied.
        #
        #   @param remove_to_redeem [Array<String>, nil] Request fields to remove before retrying, so the retry can redeem this
        #
        #   @param type [Symbol, :not_applied]

        # Why the reprice was not applied.
        #
        # A closed enum; additions to the redemption-check vocabulary arrive as deliberate
        # schema updates.
        #
        # @see Anthropic::Models::Beta::BetaFallbackCreditNotApplied#reason
        module Reason
          extend Anthropic::Internal::Type::Enum

          BODY_MISMATCH = :body_mismatch
          CONTINUATION_EXCLUDED = :continuation_excluded
          CONTINUATION_ONLY = :continuation_only
          EXPIRED = :expired
          INVALID_TARGET_MODEL = :invalid_target_model
          NOT_ENABLED = :not_enabled
          REPRICE_UNAVAILABLE = :reprice_unavailable
          TEMPORARILY_UNAVAILABLE = :temporarily_unavailable
          VARIANT_FIELDS_PRESENT = :variant_fields_present
          WRONG_ORGANIZATION = :wrong_organization
          WRONG_PLATFORM = :wrong_platform
          WRONG_WORKSPACE = :wrong_workspace

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaFallbackCreditNotApplied = Beta::BetaFallbackCreditNotApplied
  end
end
