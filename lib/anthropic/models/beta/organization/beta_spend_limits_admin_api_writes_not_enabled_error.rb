# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The organization cannot retrieve, set or delete spend limits with an Admin API
        # credential.
        class BetaSpendLimitsAdminAPIWritesNotEnabledError < Anthropic::Errors::PermissionDeniedError
          # @!method error_code
          #   @return [Symbol, :spend_limits_admin_api_writes_not_enabled]

          # @return [Anthropic::Models::Beta::Organization::BetaSpendLimitsAdminAPIWritesNotEnabledErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaSpendLimitsAdminAPIWritesNotEnabledErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
