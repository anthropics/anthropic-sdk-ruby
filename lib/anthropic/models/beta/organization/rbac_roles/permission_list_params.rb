# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module RBACRoles
          # @see Anthropic::Resources::Beta::Organization::RBACRoles::Permissions#list
          class PermissionListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute rbac_role_id
            #   ID of the RBAC Role.
            #
            #   @return [String]
            required :rbac_role_id, String

            # @!attribute limit
            #   Number of items to return per page.
            #
            #   Defaults to `20`. Ranges from `1` to `1000`.
            #
            #   @return [Integer, nil]
            optional :limit, Integer

            # @!attribute page
            #   Optionally set to the `next_page` token from the previous response.
            #
            #   @return [String, nil]
            optional :page, String, nil?: true

            # @!method initialize(rbac_role_id:, limit: nil, page: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::RBACRoles::PermissionListParams} for
            #   more details.
            #
            #   @param rbac_role_id [String] ID of the RBAC Role.
            #
            #   @param limit [Integer] Number of items to return per page.
            #
            #   @param page [String, nil] Optionally set to the `next_page` token from the previous response.
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
