# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::RBACGroups#delete
        class RBACGroupDeleteParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute rbac_group_id
          #   ID of the RBAC Group.
          #
          #   @return [String]
          required :rbac_group_id, String

          # @!method initialize(rbac_group_id:, request_options: {})
          #   @param rbac_group_id [String] ID of the RBAC Group.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
