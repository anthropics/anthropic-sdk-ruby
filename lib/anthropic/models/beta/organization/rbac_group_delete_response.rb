# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::RBACGroups#delete
        class RBACGroupDeleteResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   ID of the RBAC Group.
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #   Deleted object type.
          #
          #   For RBAC Groups, this is always `"rbac_group_deleted"`.
          #
          #   @return [Symbol, :rbac_group_deleted]
          required :type, const: :rbac_group_deleted

          # @!method initialize(id:, type: :rbac_group_deleted)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::RBACGroupDeleteResponse} for more
          #   details.
          #
          #   @param id [String] ID of the RBAC Group.
          #
          #   @param type [Symbol, :rbac_group_deleted] Deleted object type.
        end
      end
    end
  end
end
