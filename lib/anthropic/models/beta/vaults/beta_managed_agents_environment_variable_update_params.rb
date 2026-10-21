# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsEnvironmentVariableUpdateParams < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :environment_variable]
          required :type, const: :environment_variable

          # @!attribute injection_location
          #   Updated injection location.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsInjectionLocationUpdateParams, nil]
          optional :injection_location,
                   -> { Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationUpdateParams }

          # @!attribute networking
          #   The new networking scope, which replaces the stored one as a whole.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams, nil]
          optional :networking,
                   union: -> { Anthropic::Beta::Vaults::BetaManagedAgentsCredentialNetworkingParams },
                   nil?: true

          # @!attribute secret_value
          #   The new secret value to replace the stored one.
          #
          #   @return [String, nil]
          optional :secret_value, String, nil?: true

          # @!method initialize(injection_location: nil, networking: nil, secret_value: nil, type: :environment_variable)
          #   Parameters for updating an environment variable credential. `secret_name` is
          #   immutable.
          #
          #   @param injection_location [Anthropic::Models::Beta::Vaults::BetaManagedAgentsInjectionLocationUpdateParams] Updated injection location.
          #
          #   @param networking [Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams, nil] The new networking scope, which replaces the stored one as a whole.
          #
          #   @param secret_value [String, nil] The new secret value to replace the stored one.
          #
          #   @param type [Symbol, :environment_variable]
        end
      end
    end
  end
end
