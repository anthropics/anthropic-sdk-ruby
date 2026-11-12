# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class RBACRoleSourceCustom < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #   The organization's administrators can change and delete the RBAC Role.
        #
        #   @return [Symbol, :custom]
        required :type, const: :custom

        # @!method initialize(type: :custom)
        #   @param type [Symbol, :custom] The organization's administrators can change and delete the RBAC Role.
      end
    end
  end
end
