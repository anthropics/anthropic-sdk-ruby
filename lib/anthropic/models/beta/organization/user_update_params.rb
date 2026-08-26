# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Users#update
        class UserUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute user_id
          #   ID of the User.
          #
          #   @return [String]
          required :user_id, String

          # @!attribute role
          #   New role for the User.
          #
          #   The accepted values depend on the organization type. Console and API
          #   organizations accept `user`, `developer`, `billing`, and `claude_code_user`;
          #   `admin` cannot be assigned through the API. Claude Enterprise organizations
          #   accept `user` and `managed`.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::UserUpdateParams::Role]
          required :role, enum: -> { Anthropic::Beta::Organization::UserUpdateParams::Role }

          # @!method initialize(user_id:, role:, request_options: {})
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::UserUpdateParams} for more details.
          #
          #   @param user_id [String] ID of the User.
          #
          #   @param role [Symbol, Anthropic::Models::Beta::Organization::UserUpdateParams::Role] New role for the User.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

          # New role for the User.
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
