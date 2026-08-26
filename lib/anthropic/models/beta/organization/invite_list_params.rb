# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Invites#list
        class InviteListParams < Anthropic::Internal::Type::BaseModel
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
          #   Filter by the email address the Invite was sent to. Matches the same way as the
          #   Users list's `email` filter (normalized, case-insensitive).
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

          # @!attribute statuses
          #   Filter by Invite status. Repeatable; values are OR'ed together. Omit to return
          #   `pending`, `accepted`, and `expired` Invites alike.
          #
          #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::InviteListParams::Status>, nil]
          optional :statuses,
                   -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::InviteListParams::Status] }

          # @!method initialize(after_id: nil, before_id: nil, email: nil, limit: nil, roles: nil, statuses: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::InviteListParams} for more details.
          #
          #   @param after_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
          #
          #   @param before_id [String] ID of the object to use as a cursor for pagination. When provided, returns the p
          #
          #   @param email [String] Filter by the email address the Invite was sent to. Matches the same way as the
          #
          #   @param limit [Integer] Number of items to return per page.
          #
          #   @param roles [Array<String>] Filter to items whose `role` equals one of the supplied values. Repeatable; valu
          #
          #   @param statuses [Array<Symbol, Anthropic::Models::Beta::Organization::InviteListParams::Status>] Filter by Invite status. Repeatable; values are OR'ed together. Omit to return `
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          module Status
            extend Anthropic::Internal::Type::Enum

            ACCEPTED = :accepted
            EXPIRED = :expired
            PENDING = :pending

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
