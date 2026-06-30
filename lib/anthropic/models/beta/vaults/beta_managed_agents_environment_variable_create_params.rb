# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsEnvironmentVariableCreateParams < Anthropic::Internal::Type::BaseModel
          # @!attribute networking
          #   Outbound hosts the secret value is substituted on.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams]
          required :networking, union: -> { Anthropic::Beta::Vaults::BetaManagedAgentsCredentialNetworkingParams }

          # @!attribute secret_name
          #   Name of the environment variable. Immutable after create.
          #
          #   @return [String]
          required :secret_name, String

          # @!attribute secret_value
          #   Secret value. Write-only; never returned in responses.
          #
          #   @return [String]
          required :secret_value, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams::Type }

          # @!attribute injection_location
          #   Where in the outbound request the secret value may be substituted.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsInjectionLocationParams, nil]
          optional :injection_location, -> { Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationParams }

          # @!method initialize(networking:, secret_name:, secret_value:, type:, injection_location: nil)
          #   Parameters for creating an environment variable credential.
          #
          #   @param networking [Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams] Outbound hosts the secret value is substituted on.
          #
          #   @param secret_name [String] Name of the environment variable. Immutable after create.
          #
          #   @param secret_value [String] Secret value. Write-only; never returned in responses.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams::Type]
          #
          #   @param injection_location [Anthropic::Models::Beta::Vaults::BetaManagedAgentsInjectionLocationParams] Where in the outbound request the secret value may be substituted.

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams#type
          module Type
            extend Anthropic::Internal::Type::Enum

            ENVIRONMENT_VARIABLE = :environment_variable

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
