# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The RBAC Group is not one of the organization's groups.
        class BetaRBACGroupNotFoundError < Anthropic::Errors::NotFoundError
          # @!method error_code
          #   @return [Symbol, :rbac_group_not_found]

          # @return [Anthropic::Models::Beta::Organization::BetaRBACGroupNotFoundErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaRBACGroupNotFoundErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
