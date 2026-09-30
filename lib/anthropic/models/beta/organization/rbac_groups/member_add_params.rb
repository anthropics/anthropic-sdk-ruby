# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACGroups
          # @see Anthropic::Resources::Beta::Organization::RBACGroups::Members#add
          class MemberAddParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute rbac_group_id
            #   ID of the RBAC Group.
            #
            #   @return [String]
            required :rbac_group_id, String

            # @!attribute user_id
            #   ID of the User.
            #
            #   @return [String]
            required :user_id, String

            # @!method initialize(rbac_group_id:, user_id:, request_options: {})
            #   @param rbac_group_id [String] ID of the RBAC Group.
            #
            #   @param user_id [String] ID of the User.
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
