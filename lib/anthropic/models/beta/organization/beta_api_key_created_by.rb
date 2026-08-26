# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAPIKeyCreatedBy < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   ID of the actor that created the object.
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #   Type of the actor that created the object.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaAPIKeyCreatedBy::Type]
          required :type, enum: -> { Anthropic::Beta::Organization::BetaAPIKeyCreatedBy::Type }

          # @!method initialize(id:, type:)
          #   @param id [String] ID of the actor that created the object.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Organization::BetaAPIKeyCreatedBy::Type] Type of the actor that created the object.

          # Type of the actor that created the object.
          #
          # @see Anthropic::Models::Beta::Organization::BetaAPIKeyCreatedBy#type
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
end
