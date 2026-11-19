# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          class BetaRBACGroupOrderLimitExceededErrorDetails < Anthropic::Internal::Type::BaseModel
            # @!attribute error_code
            #
            #   @return [Symbol, :rbac_group_order_limit_exceeded]
            required :error_code, const: :rbac_group_order_limit_exceeded

            # @!method initialize(error_code: :rbac_group_order_limit_exceeded)
            #   The RBAC Group order already has the most groups allowed. Delete another group's
            #   settings first.
            #
            #   @param error_code [Symbol, :rbac_group_order_limit_exceeded]
          end
        end
      end
    end
  end
end
