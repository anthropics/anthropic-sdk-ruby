# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Users#retrieve
        class BetaOrganizationUser < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   ID of the User.
          #
          #   @return [String]
          required :id, String

          # @!attribute added_at
          #   RFC 3339 datetime string indicating when the User joined the Organization.
          #
          #   @return [Time]
          required :added_at, Time

          # @!attribute email
          #   Email of the User.
          #
          #   @return [String]
          required :email, String

          # @!attribute name
          #   Name of the User.
          #
          #   @return [String]
          required :name, String

          # @!attribute role
          #   Organization role of the User.
          #
          #   @return [Symbol, Anthropic::Models::Beta::BetaOrganizationRole]
          required :role, enum: -> { Anthropic::Beta::BetaOrganizationRole }

          # @!attribute type
          #   Object type.
          #
          #   For Users, this is always `"user"`.
          #
          #   @return [Symbol, :user]
          required :type, const: :user

          # @!method initialize(id:, added_at:, email:, name:, role:, type: :user)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaOrganizationUser} for more details.
          #
          #   @param id [String] ID of the User.
          #
          #   @param added_at [Time] RFC 3339 datetime string indicating when the User joined the Organization.
          #
          #   @param email [String] Email of the User.
          #
          #   @param name [String] Name of the User.
          #
          #   @param role [Symbol, Anthropic::Models::Beta::BetaOrganizationRole] Organization role of the User.
          #
          #   @param type [Symbol, :user] Object type.
        end
      end
    end
  end
end
