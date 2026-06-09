# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsVaultArchivedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError::Type]
        required :type,
                 enum: -> { Anthropic::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError::Type }

        # @!method initialize(type:)
        #   A vault referenced by the deployment is archived.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          VAULT_ARCHIVED_ERROR = :vault_archived_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsVaultArchivedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError
  end
end
