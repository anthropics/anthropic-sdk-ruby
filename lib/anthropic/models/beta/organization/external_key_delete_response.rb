# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::ExternalKeys#delete
        class ExternalKeyDeleteResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   ID of the deleted External Key.
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #
          #   @return [Symbol, :external_key_deleted]
          required :type, const: :external_key_deleted

          # @!method initialize(id:, type: :external_key_deleted)
          #   @param id [String] ID of the deleted External Key.
          #
          #   @param type [Symbol, :external_key_deleted]
        end
      end
    end
  end
end
