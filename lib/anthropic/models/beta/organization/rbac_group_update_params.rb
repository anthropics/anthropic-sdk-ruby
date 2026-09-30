# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::RBACGroups#update
        class RBACGroupUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute rbac_group_id
          #   ID of the RBAC Group.
          #
          #   @return [String]
          required :rbac_group_id, String

          # @!attribute name
          #   Name of the RBAC Group. Not uniqueness-enforced.
          #
          #   @return [String, nil]
          optional :name, String, nil?: true

          # @!method initialize(rbac_group_id:, name: nil, request_options: {})
          #   @param rbac_group_id [String] ID of the RBAC Group.
          #
          #   @param name [String, nil] Name of the RBAC Group. Not uniqueness-enforced.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
