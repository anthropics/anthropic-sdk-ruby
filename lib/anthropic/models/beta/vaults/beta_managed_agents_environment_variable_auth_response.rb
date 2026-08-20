# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsEnvironmentVariableAuthResponse < Anthropic::Internal::Type::BaseModel
          # @!attribute injection_location
          #   Where in the outbound request the secret value is substituted.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsInjectionLocationResponse]
          required :injection_location, -> { Anthropic::Beta::Vaults::BetaManagedAgentsInjectionLocationResponse }

          # @!attribute networking
          #   Outbound hosts the secret value is substituted on.
          #
          #   @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse]
          required :networking,
                   union: -> { Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse::Networking }

          # @!attribute secret_name
          #   Name of the environment variable.
          #
          #   @return [String]
          required :secret_name, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse::Type]
          required :type,
                   enum: -> { Anthropic::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse::Type }

          # @!method initialize(injection_location:, networking:, secret_name:, type:)
          #   Environment variable credential details. The secret value is never returned.
          #
          #   @param injection_location [Anthropic::Models::Beta::Vaults::BetaManagedAgentsInjectionLocationResponse] Where in the outbound request the secret value is substituted.
          #
          #   @param networking [Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse] Outbound hosts the secret value is substituted on.
          #
          #   @param secret_name [String] Name of the environment variable.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse::Type]

          # Outbound hosts the secret value is substituted on.
          #
          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse#networking
          module Networking
            extend Anthropic::Internal::Type::Union

            discriminator :type

            # The secret is substituted on any host the session's Environment network policy permits egress to.
            variant :unrestricted,
                    -> { Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse }

            # The secret is substituted only on requests to the listed hosts.
            variant :limited, -> { Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse }

            module Type
              extend Anthropic::Internal::Type::Enum

              UNRESTRICTED = :unrestricted
              LIMITED = :limited

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse::Networking}
            # for more details.
            #
            # @param type [Symbol, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [Array<String>] :allowed_hosts Hostnames on which the secret will be substituted. An entry matches the request
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse]
            def self.new(type:, **args)
              case type.to_sym
              when :unrestricted
                Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingResponse.new(**args)
              when :limited
                Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end

          # @see Anthropic::Models::Beta::Vaults::BetaManagedAgentsEnvironmentVariableAuthResponse#type
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
