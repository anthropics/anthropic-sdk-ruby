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
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeletedVault::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsDeletedVault::Type }

        # @!method initialize(id:, type:)
        #   Confirmation of a deleted vault.
        #
        #   @param id [String] The unique ID of the deleted vault (`vlt_...`).
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsDeletedVault::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsDeletedVault#type
        module Type
          extend Anthropic::Internal::Type::Enum

          VAULT_DELETED = :vault_deleted

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsDeletedVault = Beta::BetaManagedAgentsDeletedVault
  end
end
