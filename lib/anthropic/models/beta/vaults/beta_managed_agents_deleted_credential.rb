# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        # @see Anthropic::Resources::Beta::Vaults::Credentials#delete
        class BetaManagedAgentsDeletedCredential < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   The unique ID of the deleted credential (`vcrd_...`).
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #
          #   @return [Symbol, :vault_credential_deleted]
          required :type, const: :vault_credential_deleted

          # @!method initialize(id:, type: :vault_credential_deleted)
          #   Confirmation of a deleted credential.
          #
          #   @param id [String] The unique ID of the deleted credential (`vcrd_...`).
          #
          #   @param type [Symbol, :vault_credential_deleted]
        end
      end
    end
  end
end
