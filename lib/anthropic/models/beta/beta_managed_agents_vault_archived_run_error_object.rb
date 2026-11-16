# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsVaultArchivedRunErrorObject < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, :vault_archived_error]
        required :type, const: :vault_archived_error

        # @!method initialize(message:, type: :vault_archived_error)
        #   A vault referenced by the deployment is archived.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, :vault_archived_error]
      end
    end

    BetaManagedAgentsVaultArchivedRunErrorObject = Beta::BetaManagedAgentsVaultArchivedRunErrorObject
  end
end
