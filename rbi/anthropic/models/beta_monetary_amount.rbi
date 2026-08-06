# typed: strong

module Anthropic
  module Models
    class BetaMonetaryAmount < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::BetaMonetaryAmount, Anthropic::Internal::AnyHash)
        end

      # Amount in minor units of the currency, as an integer decimal string with no
      # leading zeros: "2500" is $25.00 and "50" is fifty cents. A string rather than a
      # number so no float rounding is ever applied.
      sig { returns(String) }
      attr_accessor :amount

      # Uppercase ISO-4217 currency code. `USD` is the only currency currently
      # supported; the accepted set is closed and grows only when a new currency is
      # priced.
      sig { returns(Anthropic::BetaCurrency::OrSymbol) }
      attr_accessor :currency

      # A monetary amount in a specific currency.
      sig do
        params(
          amount: String,
          currency: Anthropic::BetaCurrency::OrSymbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Amount in minor units of the currency, as an integer decimal string with no
        # leading zeros: "2500" is $25.00 and "50" is fifty cents. A string rather than a
        # number so no float rounding is ever applied.
        amount:,
        # Uppercase ISO-4217 currency code. `USD` is the only currency currently
        # supported; the accepted set is closed and grows only when a new currency is
        # priced.
        currency:
      )
      end

      sig do
        override.returns(
          { amount: String, currency: Anthropic::BetaCurrency::OrSymbol }
        )
      end
      def to_hash
      end
    end
  end
end
