# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::Vaults#delete
      class BetaManagedAgentsDeletedVault < Anthropic::Internal::Type::BaseModel
        # @!attribute id
        #   The unique ID of the deleted vault (`vlt_...`).
        #
        #   @return [String]
        required :id, String

        # @!attribute type
        #
        #   @return [Symbol, :vault_deleted]
        required :type, const: :vault_deleted

        # @!method initialize(id:, type: :vault_deleted)
        #   Confirmation of a deleted vault.
        #
        #   @param id [String] The unique ID of the deleted vault (`vlt_...`).
        #
        #   @param type [Symbol, :vault_deleted]
      end
    end

    BetaManagedAgentsDeletedVault = Beta::BetaManagedAgentsDeletedVault
  end
end
