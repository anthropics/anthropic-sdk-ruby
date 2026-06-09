# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError::Type]
        required :type,
                 enum: -> { Anthropic::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError::Type }

        # @!method initialize(type:)
        #   A vault referenced by the deployment no longer exists.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          VAULT_NOT_FOUND_ERROR = :vault_not_found_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError =
      Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError
  end
end
