# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Invites#create
        class InviteCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute email
          #   Email of the User.
          #
          #   @return [String]
          required :email, String

          # @!attribute role
          #   Role for the invited User.
          #
          #   The accepted values depend on the organization type. Console and API
          #   organizations accept `user`, `developer`, `billing`, and `claude_code_user`;
          #   `admin` cannot be assigned through the API. Claude Enterprise organizations
          #   accept `user` and `managed`.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::InviteCreateParams::Role]
          required :role, enum: -> { Anthropic::Beta::Organization::InviteCreateParams::Role }

          # @!attribute rbac_group_ids
          #   RBAC group IDs to assign to the User when the Invite is accepted. A non-empty
          #   array is accepted only for a Claude Enterprise organization with RBAC groups,
          #   and requires the key to carry the `write:rbac_groups` scope.
          #
          #   @return [Array<String>, nil]
          optional :rbac_group_ids, Anthropic::Internal::Type::ArrayOf[String]

          # @!method initialize(email:, role:, rbac_group_ids: nil, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::InviteCreateParams} for more details.
          #
          #   @param email [String] Email of the User.
          #
          #   @param role [Symbol, Anthropic::Models::Beta::Organization::InviteCreateParams::Role] Role for the invited User.
          #
          #   @param rbac_group_ids [Array<String>] RBAC group IDs to assign to the User when the Invite is accepted. A non-empty ar
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          # Role for the invited User.
          #
          # The accepted values depend on the organization type. Console and API
          # organizations accept `user`, `developer`, `billing`, and `claude_code_user`;
          # `admin` cannot be assigned through the API. Claude Enterprise organizations
          # accept `user` and `managed`.
          module Role
            extend Anthropic::Internal::Type::Enum

            BILLING = :billing
            CLAUDE_CODE_USER = :claude_code_user
            DEVELOPER = :developer
            MANAGED = :managed
            USER = :user

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
