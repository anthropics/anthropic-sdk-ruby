# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsVaultNotFoundRunError < Anthropic::Internal::Type::BaseModel
        # @!attribute message
        #   Human-readable error description.
        #
        #   @return [String]
        required :message, String

        # @!attribute type
        #
        #   @return [Symbol, :vault_not_found_error]
        required :type, const: :vault_not_found_error

        # @!method initialize(message:, type: :vault_not_found_error)
        #   A vault referenced by the deployment no longer exists.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, :vault_not_found_error]
      end
    end

    BetaManagedAgentsVaultNotFoundRunError = Beta::BetaManagedAgentsVaultNotFoundRunError
  end
end
