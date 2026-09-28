# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginTargetRBACGroup < Anthropic::Internal::Type::BaseModel
          # @!attribute rbac_group_id
          #   The RBAC Group's ID.
          #
          #   @return [String]
          required :rbac_group_id, String

          # @!attribute type
          #   An RBAC Group.
          #
          #   @return [Symbol, :rbac_group]
          required :type, const: :rbac_group

          # @!method initialize(rbac_group_id:, type: :rbac_group)
          #   @param rbac_group_id [String] The RBAC Group's ID.
          #
          #   @param type [Symbol, :rbac_group] An RBAC Group.
        end
      end
    end
  end
end
