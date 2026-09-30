# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::Organization#retrieve
    class OrganizationInfo < Anthropic::Internal::Type::BaseModel
      # @!attribute id
      #   ID of the Organization.
      #
      #   @return [String]
      required :id, String

      # @!attribute name
      #   Name of the Organization.
      #
      #   @return [String]
      required :name, String

      # @!attribute type
      #   Object type.
      #
      #   For Organizations, this is always `"organization"`.
      #
      #   @return [Symbol, :organization]
      required :type, const: :organization

      # @!method initialize(id:, name:, type: :organization)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::OrganizationInfo} for more details.
      #
      #   @param id [String] ID of the Organization.
      #
      #   @param name [String] Name of the Organization.
      #
      #   @param type [Symbol, :organization] Object type.
    end
  end
end
