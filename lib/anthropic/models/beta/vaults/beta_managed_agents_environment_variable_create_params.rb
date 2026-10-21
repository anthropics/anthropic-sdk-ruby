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
          #   The secret to substitute into the agent's outbound requests. It's write-only and
          #   never returned in responses.
          #
          #   @return [String]
          required :secret_value, String

          # @!attribute type
          #
          #   @return [Symbol, :environment_variable]
          required :type, const: :environment_variable

          # @!attribute injection_location
          #   Where in the outbound request the secret value may be substituted.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsInjectionLocationParams, nil]
          optional :injection_location, -> { Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationParams }

          # @!method initialize(networking:, secret_name:, secret_value:, injection_location: nil, type: :environment_variable)
          #   Parameters for creating an environment variable credential.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableCreateParams}
          #   for more details.
          #
          #   @param networking [Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams] Outbound hosts the secret value is substituted on.
          #
          #   @param secret_name [String] Name of the environment variable. Immutable after create.
          #
          #   @param secret_value [String] The secret to substitute into the agent's outbound requests. It's write-only and
          #
          #   @param injection_location [Anthropic::Models::Beta::Vaults::BetaManagedAgentsInjectionLocationParams] Where in the outbound request the secret value may be substituted.
          #
          #   @param type [Symbol, :environment_variable]
        end
      end
    end
  end
end
