# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::RBACRoles#list
        class RBACRoleListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

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

          # @!method initialize(limit: nil, page: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::RBACRoleListParams} for more details.
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
