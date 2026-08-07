# typed: strong

module Anthropic
  module Models
    BetaFallbackCreditUsage = Beta::BetaFallbackCreditUsage

    module Beta
      class BetaFallbackCreditUsage < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaFallbackCreditUsage,
              Anthropic::Internal::AnyHash
            )
          end

        # Whether the fallback-credit reprice was applied to this response's billing.
        #
        # A union discriminated on `type`. `redeemed`: the retry is billed as if the
        # conversation had been on the retry model all along — including when the
        # resulting shift is zero because there was nothing to move. `not_applied`: no
        # reprice was applied; the arm's `reason` says why.
        sig do
          returns(Anthropic::Beta::BetaFallbackCreditUsage::Status::Variants)
        end
        attr_accessor :status

        # Outcome of the `fallback_credit_token` presented on this request.
        sig do
          params(
            status:
              T.any(
                Anthropic::Beta::BetaFallbackCreditRedeemed::OrHash,
                Anthropic::Beta::BetaFallbackCreditNotApplied::OrHash
              )
          ).returns(T.attached_class)
        end
        def self.new(
          # Whether the fallback-credit reprice was applied to this response's billing.
          #
          # A union discriminated on `type`. `redeemed`: the retry is billed as if the
          # conversation had been on the retry model all along — including when the
          # resulting shift is zero because there was nothing to move. `not_applied`: no
          # reprice was applied; the arm's `reason` says why.
          status:
        )
        end

        sig do
          override.returns(
            {
              status: Anthropic::Beta::BetaFallbackCreditUsage::Status::Variants
            }
          )
        end
        def to_hash
        end

        # Whether the fallback-credit reprice was applied to this response's billing.
        #
        # A union discriminated on `type`. `redeemed`: the retry is billed as if the
        # conversation had been on the retry model all along — including when the
        # resulting shift is zero because there was nothing to move. `not_applied`: no
        # reprice was applied; the arm's `reason` says why.
        module Status
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaFallbackCreditRedeemed,
                Anthropic::Beta::BetaFallbackCreditNotApplied
              )
            end

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaFallbackCreditUsage::Status::Variants
              ]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: T.any(Symbol, String),
              reason:
                Anthropic::Beta::BetaFallbackCreditNotApplied::Reason::OrSymbol,
              remove_to_redeem: T.nilable(T::Array[String])
            ).returns(
              Anthropic::Beta::BetaFallbackCreditUsage::Status::Variants
            )
          end
          def self.new(
            type:,
            # Why the reprice was not applied.
            #
            # A closed enum; additions to the redemption-check vocabulary arrive as deliberate
            # schema updates.
            reason: nil,
            # Request fields to remove before retrying, so the retry can redeem this token.
            #
            # Present exactly when `reason` is `variant_fields_present` — never null, never an
            # empty array; absent otherwise. Fields are named only from your own request, and
            # only after the sealed variant hash matched. A served best-effort retry has
            # already been billed at normal price; nothing redeems retroactively, but a
            # corrected re-send inside the token's five-minute window can still redeem.
            remove_to_redeem: nil
          )
          end
        end
      end
    end
  end
end
