# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaSpendLimitRBACGroupScope < Anthropic::Internal::Type::BaseModel
          # @!attribute rbac_group_id
          #
          #   @return [String]
          required :rbac_group_id, String

          # @!attribute type
          #
          #   @return [Symbol, :rbac_group]
          required :type, const: :rbac_group

          # @!method initialize(rbac_group_id:, type: :rbac_group)
          #   @param rbac_group_id [String]
          #   @param type [Symbol, :rbac_group]
        end
      end
    end
  end
end
