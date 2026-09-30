# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::RBACRoles#retrieve
        class RBACRoleRetrieveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute rbac_role_id
          #   ID of the RBAC Role.
          #
          #   @return [String]
          required :rbac_role_id, String

          # @!method initialize(rbac_role_id:, request_options: {})
          #   @param rbac_role_id [String] ID of the RBAC Role.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
