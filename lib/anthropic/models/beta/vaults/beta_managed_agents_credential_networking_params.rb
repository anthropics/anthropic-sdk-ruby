# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Vaults
        # Substitute the secret on any host the session's Environment network policy
        # permits egress to. The Environment's network policy is the only boundary on
        # where the secret can reach.
        module BetaManagedAgentsCredentialNetworkingParams
          extend Anthropic::Internal::Type::Union

          discriminator :type

          # Substitute the secret on any host the session's Environment network policy permits egress to. The Environment's network policy is the only boundary on where the secret can reach.
          variant :unrestricted,
                  -> { Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams }

          # Substitute the secret only on requests to the listed hosts.
          variant :limited, -> { Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams }

          module Type
            extend Anthropic::Internal::Type::Enum

            UNRESTRICTED = :unrestricted
            LIMITED = :limited

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Beta::Vaults::BetaManagedAgentsCredentialNetworkingParams}
          # for more details.
          #
          # @param type [Symbol, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [Array<String>] :allowed_hosts Hostnames on which the secret will be substituted. Each entry is a bare hostname
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams, Anthropic::Models::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams]
          def self.new(type:, **args)
            case type.to_sym
            when :unrestricted
              Anthropic::Beta::Vaults::BetaManagedAgentsUnrestrictedCredentialNetworkingParams.new(**args)
            when :limited
              Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end
      end
    end
  end
end
