# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsEnvironmentVariableUpdateParams < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableUpdateParams::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableUpdateParams::Type }

          # @!attribute injection_location
          #   Updated injection location.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsInjectionLocationUpdateParams, nil]
          optional :injection_location,
                   -> { Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationUpdateParams }

          # @!attribute networking
          #   Updated networking scope. Full replacement.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams, nil]
          optional :networking,
                   union: -> { Anthropic::Beta::Vaults::BetaManagedAgentsCredentialNetworkingParams },
                   nil?: true

          # @!attribute secret_value
          #   Updated secret value.
          #
          #   @return [String, nil]
          optional :secret_value, String, nil?: true

          # @!method initialize(type:, injection_location: nil, networking: nil, secret_value: nil)
          #   Parameters for updating an environment variable credential. `secret_name` is
          #   immutable.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableUpdateParams::Type]
          #
          #   @param injection_location [Anthropic::Models::Beta::Vaults::BetaManagedAgentsInjectionLocationUpdateParams] Updated injection location.
          #
          #   @param networking [Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams, nil] Updated networking scope. Full replacement.
          #
          #   @param secret_value [String, nil] Updated secret value.

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableUpdateParams#type
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
