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
        #   Outcome of the `fallback_credit_token` presented on this request.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaFallbackCreditUsage} for more details.
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

          module Type
            extend Anthropic::Internal::Type::Enum

            REDEEMED = :redeemed
            NOT_APPLIED = :not_applied

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::BetaFallbackCreditRedeemed, Anthropic::Models::Beta::BetaFallbackCreditNotApplied)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::BetaFallbackCreditUsage::Status} for more details.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Symbol, Anthropic::Models::Beta::BetaFallbackCreditNotApplied::Reason] :reason Why the reprice was not applied.
          #
          #   @option args [Array<String>, nil] :remove_to_redeem Request fields to remove before retrying, so the retry can redeem this
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::BetaFallbackCreditRedeemed, Anthropic::Models::Beta::BetaFallbackCreditNotApplied]
          def self.new(type:, **args)
            case type.to_sym
            when :redeemed
              Anthropic::Beta::BetaFallbackCreditRedeemed.new(**args)
            when :not_applied
              Anthropic::Beta::BetaFallbackCreditNotApplied.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end

    BetaFallbackCreditUsage = Beta::BetaFallbackCreditUsage
  end
end
