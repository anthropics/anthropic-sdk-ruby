# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsRefreshObject < Anthropic::Internal::Type::BaseModel
          # @!attribute http_response
          #   An HTTP response captured during a credential validation probe.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsRefreshHTTPResponse, nil]
          required :http_response,
                   -> {
                     Anthropic::Beta::Vaults::BetaManagedAgentsRefreshHTTPResponse
                   },
                   nil?: true

          # @!attribute status
          #   Outcome of a refresh-token exchange attempted during credential validation.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsRefreshObject::Status]
          required :status, enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsRefreshObject::Status }

          # @!method initialize(http_response:, status:)
          #   Outcome of a refresh-token exchange attempted during credential validation.
          #
          #   @param http_response [Anthropic::Models::Beta::Vaults::BetaManagedAgentsRefreshHTTPResponse, nil] An HTTP response captured during a credential validation probe.
          #
          #   @param status [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsRefreshObject::Status] Outcome of a refresh-token exchange attempted during credential validation.

          # Outcome of a refresh-token exchange attempted during credential validation.
          #
          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsRefreshObject#status
          module Status
            extend Anthropic::Internal::Type::Enum

            SUCCEEDED = :succeeded
            FAILED = :failed
            CONNECT_ERROR = :connect_error
            NO_REFRESH_TOKEN = :no_refresh_token

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
