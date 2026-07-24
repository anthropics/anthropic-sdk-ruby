# typed: strong

module Anthropic
  module Models
    BetaFallbackCreditTokenParam = Beta::BetaFallbackCreditTokenParam

    module Beta
      class BetaFallbackCreditTokenParam < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaFallbackCreditTokenParam,
              Anthropic::Internal::AnyHash
            )
          end

        # The opaque `fallback_credit_token` from a prior refusal's `stop_details` — the
        # same string the bare-string form carries.
        sig { returns(String) }
        attr_accessor :token

        # How a failing token affects the retry. `strict` (the default, and the
        # bare-string behavior): a failing redemption is a 400 and the retry is not
        # served. `best_effort`: the retry is served either way — a token-layer failure no
        # longer rejects the request; the retry proceeds at normal price and the outcome
        # is reported on the response's `usage.fallback_credit`. Two failures stay hard in
        # both modes: a malformed token, and combining `fallback_credit_token` with
        # `fallbacks`.
        sig do
          returns(
            T.nilable(
              Anthropic::Beta::BetaFallbackCreditTokenParam::Mode::OrSymbol
            )
          )
        end
        attr_reader :mode

        sig do
          params(
            mode: Anthropic::Beta::BetaFallbackCreditTokenParam::Mode::OrSymbol
          ).void
        end
        attr_writer :mode

        # Object form of `fallback_credit_token`: the token plus a redemption mode.
        #
        # Requires `anthropic-beta: fallback-credit-2026-07-01`; without that header the
        # field accepts the bare string only. The bare string and the mode-less object are
        # equivalent (both select `strict`), so wrapping an existing token changes nothing
        # by itself.
        sig do
          params(
            token: String,
            mode: Anthropic::Beta::BetaFallbackCreditTokenParam::Mode::OrSymbol
          ).returns(T.attached_class)
        end
        def self.new(
          # The opaque `fallback_credit_token` from a prior refusal's `stop_details` — the
          # same string the bare-string form carries.
          token:,
          # How a failing token affects the retry. `strict` (the default, and the
          # bare-string behavior): a failing redemption is a 400 and the retry is not
          # served. `best_effort`: the retry is served either way — a token-layer failure no
          # longer rejects the request; the retry proceeds at normal price and the outcome
          # is reported on the response's `usage.fallback_credit`. Two failures stay hard in
          # both modes: a malformed token, and combining `fallback_credit_token` with
          # `fallbacks`.
          mode: nil
        )
        end

        sig do
          override.returns(
            {
              token: String,
              mode:
                Anthropic::Beta::BetaFallbackCreditTokenParam::Mode::OrSymbol
            }
          )
        end
        def to_hash
        end

        # How a failing token affects the retry. `strict` (the default, and the
        # bare-string behavior): a failing redemption is a 400 and the retry is not
        # served. `best_effort`: the retry is served either way — a token-layer failure no
        # longer rejects the request; the retry proceeds at normal price and the outcome
        # is reported on the response's `usage.fallback_credit`. Two failures stay hard in
        # both modes: a malformed token, and combining `fallback_credit_token` with
        # `fallbacks`.
        module Mode
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Beta::BetaFallbackCreditTokenParam::Mode)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          STRICT =
            T.let(
              :strict,
              Anthropic::Beta::BetaFallbackCreditTokenParam::Mode::TaggedSymbol
            )
          BEST_EFFORT =
            T.let(
              :best_effort,
              Anthropic::Beta::BetaFallbackCreditTokenParam::Mode::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::BetaFallbackCreditTokenParam::Mode::TaggedSymbol
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
