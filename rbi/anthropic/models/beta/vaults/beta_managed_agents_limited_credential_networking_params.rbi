# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsLimitedCredentialNetworkingParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Hostnames on which the secret will be substituted. Each entry is a bare hostname
          # (`api.example.com`), an IPv4 address (`192.0.2.1`), or a `*.`-prefixed wildcard
          # (`*.example.com`). URLs, ports, paths, and IPv6 addresses are not accepted. At
          # most 16 entries.
          sig { returns(T::Array[String]) }
          attr_accessor :allowed_hosts

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Substitute the secret only on requests to the listed hosts.
          sig do
            params(
              allowed_hosts: T::Array[String],
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Hostnames on which the secret will be substituted. Each entry is a bare hostname
            # (`api.example.com`), an IPv4 address (`192.0.2.1`), or a `*.`-prefixed wildcard
            # (`*.example.com`). URLs, ports, paths, and IPv6 addresses are not accepted. At
            # most 16 entries.
            allowed_hosts:,
            type:
          )
          end

          sig do
            override.returns(
              {
                allowed_hosts: T::Array[String],
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams::Type::OrSymbol
              }
            )
          end
          def to_hash
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            LIMITED =
              T.let(
                :limited,
                Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingParams::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
