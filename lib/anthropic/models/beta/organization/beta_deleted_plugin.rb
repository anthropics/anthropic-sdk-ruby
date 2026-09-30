# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Plugins#delete
        class BetaDeletedPlugin < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   The deleted Plugin's ID.
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #   Always `plugin_deleted`.
          #
          #   @return [Symbol, :plugin_deleted]
          required :type, const: :plugin_deleted

          # @!method initialize(id:, type: :plugin_deleted)
          #   @param id [String] The deleted Plugin's ID.
          #
          #   @param type [Symbol, :plugin_deleted] Always `plugin_deleted`.
        end
      end
    end
  end
end
