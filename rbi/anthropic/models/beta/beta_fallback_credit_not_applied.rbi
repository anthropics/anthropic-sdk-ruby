# typed: strong

module Anthropic
  module Models
    BetaFallbackCreditNotApplied = Beta::BetaFallbackCreditNotApplied

    module Beta
      class BetaFallbackCreditNotApplied < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaFallbackCreditNotApplied,
              Anthropic::Internal::AnyHash
            )
          end

        # Why the reprice was not applied.
        #
        # A closed enum; additions to the redemption-check vocabulary arrive as deliberate
        # schema updates.
        sig do
          returns(
            Anthropic::Beta::BetaFallbackCreditNotApplied::Reason::TaggedSymbol
          )
        end
        attr_accessor :reason

        sig { returns(Symbol) }
        attr_accessor :type

        # Request fields to remove before retrying, so the retry can redeem this token.
        #
        # Present exactly when `reason` is `variant_fields_present` — never null, never an
        # empty array; absent otherwise. Fields are named only from your own request, and
        # only after the sealed variant hash matched. A served best-effort retry has
        # already been billed at normal price; nothing redeems retroactively, but a
        # corrected re-send inside the token's five-minute window can still redeem.
        sig { returns(T.nilable(T::Array[String])) }
        attr_accessor :remove_to_redeem

        # No reprice was applied; `reason` says why.
        sig do
          params(
            reason:
              Anthropic::Beta::BetaFallbackCreditNotApplied::Reason::OrSymbol,
            remove_to_redeem: T.nilable(T::Array[String]),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Why the reprice was not applied.
          #
          # A closed enum; additions to the redemption-check vocabulary arrive as deliberate
          # schema updates.
          reason:,
          # Request fields to remove before retrying, so the retry can redeem this token.
          #
          # Present exactly when `reason` is `variant_fields_present` — never null, never an
          # empty array; absent otherwise. Fields are named only from your own request, and
          # only after the sealed variant hash matched. A served best-effort retry has
          # already been billed at normal price; nothing redeems retroactively, but a
          # corrected re-send inside the token's five-minute window can still redeem.
          remove_to_redeem: nil,
          type: :not_applied
        )
        end

        sig do
          override.returns(
            {
              reason:
                Anthropic::Beta::BetaFallbackCreditNotApplied::Reason::TaggedSymbol,
              type: Symbol,
              remove_to_redeem: T.nilable(T::Array[String])
            }
          )
        end
        def to_hash
        end

        # Why the reprice was not applied.
        #
        # A closed enum; additions to the redemption-check vocabulary arrive as deliberate
        # schema updates.
        module Reason
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::BetaFallbackCreditNotApplied::Reason
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          BODY_MISMATCH =
            T.let(
              :body_mismatch,
              Anthropic::Beta::BetaFallbackCreditNotApplied::Reason::TaggedSymbol
            )
          CONTINUATION_EXCLUDED =
            T.let(
              :continuation_excluded,
              Anthropic::Beta::BetaFallbackCreditNotApplied::Reason::TaggedSymbol
            )
          CONTINUATION_ONLY =
            T.let(
              :continuation_only,
              Anthropic::Beta::BetaFallbackCreditNotApplied::Reason::TaggedSymbol
            )
          EXPIRED =
            T.let(
              :expired,
              Anthropic::Beta::BetaFallbackCreditNotApplied::Reason::TaggedSymbol
            )
          INVALID_TARGET_MODEL =
            T.let(
              :invalid_target_model,
              Anthropic::Beta::BetaFallbackCreditNotApplied::Reason::TaggedSymbol
            )
          NOT_ENABLED =
            T.let(
              :not_enabled,
              Anthropic::Beta::BetaFallbackCreditNotApplied::Reason::TaggedSymbol
            )
          REPRICE_UNAVAILABLE =
            T.let(
              :reprice_unavailable,
              Anthropic::Beta::BetaFallbackCreditNotApplied::Reason::TaggedSymbol
            )
          TEMPORARILY_UNAVAILABLE =
            T.let(
              :temporarily_unavailable,
              Anthropic::Beta::BetaFallbackCreditNotApplied::Reason::TaggedSymbol
            )
          VARIANT_FIELDS_PRESENT =
            T.let(
              :variant_fields_present,
              Anthropic::Beta::BetaFallbackCreditNotApplied::Reason::TaggedSymbol
            )
          WRONG_ORGANIZATION =
            T.let(
              :wrong_organization,
              Anthropic::Beta::BetaFallbackCreditNotApplied::Reason::TaggedSymbol
            )
          WRONG_PLATFORM =
            T.let(
              :wrong_platform,
              Anthropic::Beta::BetaFallbackCreditNotApplied::Reason::TaggedSymbol
            )
          WRONG_WORKSPACE =
            T.let(
              :wrong_workspace,
              Anthropic::Beta::BetaFallbackCreditNotApplied::Reason::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaFallbackCreditNotApplied::Reason::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
