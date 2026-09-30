# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSpendLimitSeatTierScope < Anthropic::Internal::Type::BaseModel
          # @!attribute seat_tier
          #
          #   @return [String]
          required :seat_tier, String

          # @!attribute type
          #
          #   @return [Symbol, :seat_tier]
          required :type, const: :seat_tier

          # @!method initialize(seat_tier:, type: :seat_tier)
          #   @param seat_tier [String]
          #   @param type [Symbol, :seat_tier]
        end
      end
    end
  end
end
