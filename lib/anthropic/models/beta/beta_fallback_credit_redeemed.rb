# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaFallbackCreditRedeemed < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :redeemed]
        required :type, const: :redeemed

        # @!method initialize(type: :redeemed)
        #   The reprice was applied: the retry is billed as if the conversation had been on
        #   the retry model all along.
        #
        #   @param type [Symbol, :redeemed]
      end
    end

    BetaFallbackCreditRedeemed = Beta::BetaFallbackCreditRedeemed
  end
end
