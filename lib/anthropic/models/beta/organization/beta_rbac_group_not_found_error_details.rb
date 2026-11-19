# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaRBACGroupNotFoundErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :rbac_group_not_found]
          required :error_code, const: :rbac_group_not_found

          # @!method initialize(error_code: :rbac_group_not_found)
          #   The RBAC Group is not one of the organization's groups.
          #
          #   @param error_code [Symbol, :rbac_group_not_found]
        end
      end
    end
  end
end
