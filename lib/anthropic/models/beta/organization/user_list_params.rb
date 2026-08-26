# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Users#list
        class UserListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute after_id
          #   ID of the object to use as a cursor for pagination. When provided, returns the
          #   page of results immediately after this object.
          #
          #   @return [String, nil]
          optional :after_id, String

          # @!attribute before_id
          #   ID of the object to use as a cursor for pagination. When provided, returns the
          #   page of results immediately before this object.
          #
          #   @return [String, nil]
          optional :before_id, String

          # @!attribute email
          #   Filter by user email.
          #
          #   @return [String, nil]
          optional :email, String

          # @!attribute limit
          #   Number of items to return per page.
          #
          #   Defaults to `20`. Ranges from `1` to `1000`.
          #
          #   @return [Integer, nil]
          optional :limit, Integer

          # @!attribute roles
          #   Filter to items whose `role` equals one of the supplied values. Repeatable;
          #   values are OR'ed together.
          #
          #   Accepted values depend on the organization type: Console and API organizations
          #   accept `user`, `developer`, `billing`, `admin`, and `claude_code_user`; Claude
          #   Enterprise organizations accept `user`, `owner`, `primary_owner`,
          #   `membership_admin`, and `managed`.
          #
          #   @return [Array<String>, nil]
          optional :roles, Anthropic::Internal::Type::ArrayOf[String]

          # @!method initialize(after_id: nil, before_id: nil, email: nil, limit: nil, roles: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::UserListParams} for more details.
          #
          #   @param after_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
          #
          #   @param before_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
          #
          #   @param email [String] Filter by user email.
          #
          #   @param limit [Integer] Number of items to return per page.
          #
          #   @param roles [Array<String>] Filter to items whose `role` equals one of the supplied values. Repeatable; valu
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
