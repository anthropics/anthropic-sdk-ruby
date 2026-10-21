# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsVaultArchivedDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :vault_archived_error]
        required :type, const: :vault_archived_error

        # @!method initialize(type: :vault_archived_error)
        #   A vault referenced by the deployment is archived.
        #
        #   @param type [Symbol, :vault_archived_error]
      end
    end

    BetaManagedAgentsVaultArchivedDeploymentPausedReasonError =
      Beta::BetaManagedAgentsVaultArchivedDeploymentPausedReasonError
  end
end
