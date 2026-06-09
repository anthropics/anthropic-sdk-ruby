# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsVaultArchivedRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedRunError::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsVaultArchivedRunError::Type }

        # @!method initialize(message:, type:)
        #   A vault referenced by the deployment is archived.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedRunError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedRunError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          VAULT_ARCHIVED_ERROR = :vault_archived_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsVaultArchivedRunError = Beta::BetaManagedAgentsVaultArchivedRunError
  end
end
