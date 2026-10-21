# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError < Anthropic::Internal::Type::BaseModel
        # @!attribute type
        #
        #   @return [Symbol, :vault_not_found_error]
        required :type, const: :vault_not_found_error

        # @!method initialize(type: :vault_not_found_error)
        #   A vault referenced by the deployment no longer exists.
        #
        #   @param type [Symbol, :vault_not_found_error]
      end
    end

    BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError =
      Beta::BetaManagedAgentsVaultNotFoundDeploymentPausedReasonError
  end
end
