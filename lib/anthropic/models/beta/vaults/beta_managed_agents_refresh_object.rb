# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsRefreshObject < Anthropic::Internal::Type::BaseModel
          # @!attribute http_response
          #   The captured HTTP error response from the token endpoint. Populated only when
          #   `status` is `failed`.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsRefreshHTTPResponse, nil]
          required :http_response,
                   -> {
                     Anthropic::Beta::Vaults::BetaManagedAgentsRefreshHTTPResponse
                   },
                   nil?: true

          # @!attribute status
          #   Outcome of the refresh attempt.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsRefreshObject::Status]
          required :status, enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsRefreshObject::Status }

          # @!method initialize(http_response:, status:)
          #   Outcome of a refresh-token exchange attempted during credential validation.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::BetaManagedAgentsRefreshObject} for more
          #   details.
          #
          #   @param http_response [Anthropic::Models::Beta::Vaults::BetaManagedAgentsRefreshHTTPResponse, nil] The captured HTTP error response from the token endpoint. Populated only when `s
          #
          #   @param status [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsRefreshObject::Status] Outcome of the refresh attempt.

          # Outcome of the refresh attempt.
          #
          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsRefreshObject#status
          module Status
            extend Anthropic::Internal::Type::Enum

            # The token endpoint returned a new access token.
            SUCCEEDED = :succeeded

            # The token endpoint returned an error response. See `http_response` for detail.
            FAILED = :failed

            # The token endpoint could not be reached (DNS, TLS, or connection error).
            CONNECT_ERROR = :connect_error

            # No refresh token is stored for the credential, so no exchange was attempted.
            NO_REFRESH_TOKEN = :no_refresh_token

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
