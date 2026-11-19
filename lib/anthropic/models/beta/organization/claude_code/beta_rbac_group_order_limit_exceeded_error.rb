# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          # The RBAC Group order already has the most groups allowed. Delete another group's
          # settings first.
          class BetaRBACGroupOrderLimitExceededError < Anthropic::Errors::BadRequestError
            # @!method error_code
            #   @return [Symbol, :rbac_group_order_limit_exceeded]

            # @return [Anthropic::Models::Beta::Organization::ClaudeCode::BetaRBACGroupOrderLimitExceededErrorDetails]
            def details
              Anthropic::Internal::Type::Converter.coerce(
                Anthropic::Beta::Organization::ClaudeCode::BetaRBACGroupOrderLimitExceededErrorDetails,
                Anthropic::Internal::Util.dig(body, [:error, :details])
              )
            end
          end
        end
      end
    end
  end
end
