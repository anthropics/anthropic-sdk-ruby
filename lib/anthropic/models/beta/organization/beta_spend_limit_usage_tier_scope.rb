# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSpendLimitUsageTierScope < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #   Scope type. Always `usage_tier` for this scope.
          #
          #   @return [Symbol, :usage_tier]
          required :type, const: :usage_tier

          # @!method initialize(type: :usage_tier)
          #   Scope of the monthly spend cap Anthropic sets for a Claude Console organization
          #   from its usage tier, or a higher cap Anthropic granted the organization.
          #   Read-only; its `created_at` and `updated_at` are the organization's creation
          #   time, so `amount` can change while `updated_at` stays the same.
          #
          #   @param type [Symbol, :usage_tier] Scope type. Always `usage_tier` for this scope.
        end
      end
    end
  end
end
