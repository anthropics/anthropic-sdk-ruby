# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        # @see Anthropic::Resources::Beta::Vaults::Credentials#delete
        class BetaManagedAgentsDeletedCredential < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   Unique identifier of the deleted credential.
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsDeletedCredential::Type]
          required :type, enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsDeletedCredential::Type }

          # @!method initialize(id:, type:)
          #   Confirmation of a deleted credential.
          #
          #   @param id [String] Unique identifier of the deleted credential.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsDeletedCredential::Type]

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsDeletedCredential#type
          module Type
            extend Anthropic::Internal::Type::Enum

            VAULT_CREDENTIAL_DELETED = :vault_credential_deleted

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
