# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSpendLimitsAdminAPIWritesNotEnabledErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :spend_limits_admin_api_writes_not_enabled]
          required :error_code, const: :spend_limits_admin_api_writes_not_enabled

          # @!method initialize(error_code: :spend_limits_admin_api_writes_not_enabled)
          #   The organization cannot retrieve, set or delete spend limits with an Admin API
          #   credential.
          #
          #   @param error_code [Symbol, :spend_limits_admin_api_writes_not_enabled]
        end
      end
    end
  end
end
