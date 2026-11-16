# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaRBACRoleSourceBuiltIn < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #   Anthropic provisions the RBAC Role, and the organization's administrators cannot
          #   change or delete it.
          #
          #   @return [Symbol, :built_in]
          required :type, const: :built_in

          # @!method initialize(type: :built_in)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaRBACRoleSourceBuiltIn} for more
          #   details.
          #
          #   @param type [Symbol, :built_in] Anthropic provisions the RBAC Role, and the organization's administrators cannot
        end
      end
    end
  end
end
