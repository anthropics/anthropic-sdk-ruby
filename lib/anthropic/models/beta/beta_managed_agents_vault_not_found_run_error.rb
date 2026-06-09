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
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundRunError::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsVaultNotFoundRunError::Type }

        # @!method initialize(message:, type:)
        #   A vault referenced by the deployment no longer exists.
        #
        #   @param message [String] Human-readable error description.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundRunError::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsVaultNotFoundRunError#type
        module Type
          extend Anthropic::Internal::Type::Enum

          VAULT_NOT_FOUND_ERROR = :vault_not_found_error

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsVaultNotFoundRunError = Beta::BetaManagedAgentsVaultNotFoundRunError
  end
end
