# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class APIKeyCreatedBy < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   ID of the actor that created the object.
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #   Type of the actor that created the object.
        #
        #   @return [Symbol, Anthropic::Models::Organization::APIKeyCreatedBy::Type]
        required :type, enum: -> { Anthropic::Organization::APIKeyCreatedBy::Type }

        # @!method initialize(id:, type:)
        #   @param id [String] ID of the actor that created the object.
        #
        #   @param type [Symbol, Anthropic::Models::Organization::APIKeyCreatedBy::Type] Type of the actor that created the object.

        # Type of the actor that created the object.
        #
        # @see Anthropic::Models::Organization::APIKeyCreatedBy#type
        module Type
          extend Anthropic::Internal::Type::Enum

          SERVICE_ACCOUNT = :service_account
          USER = :user

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
