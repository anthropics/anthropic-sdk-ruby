# frozen_string_literal: true

module Anthropic
  module Models
    class BetaMonetaryAmount < Anthropic::Internal::Type::BaseModel
      # @!attribute amount
      #   Amount in minor units of the currency, as an integer decimal string with no
      #   leading zeros: "2500" is $25.00 and "50" is fifty cents. A string rather than a
      #   number so no float rounding is ever applied.
      #
      #   @return [String]
      required :amount, String

      # @!attribute currency
      #   Uppercase ISO-4217 currency code. `USD` is the only currency currently
      #   supported; the accepted set is closed and grows only when a new currency is
      #   priced.
      #
      #   @return [Symbol, Anthropic::Models::BetaCurrency]
      required :currency, enum: -> { Anthropic::BetaCurrency }

      # @!method initialize(amount:, currency:)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::BetaMonetaryAmount} for more details.
      #
      #   A monetary amount in a specific currency.
      #
      #   @param amount [String] Amount in minor units of the currency, as an integer decimal string with no lead
      #
      #   @param currency [Symbol, Anthropic::Models::BetaCurrency] Uppercase ISO-4217 currency code. `USD` is the only currency currently supported
    end
  end
end
