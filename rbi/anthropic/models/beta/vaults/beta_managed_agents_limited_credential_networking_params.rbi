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

          # The destination hosts of the outbound requests that the credential's secret is
          # substituted into.
          #
          # Each entry is a bare hostname (`api.example.com`), an IPv4 address
          # (`192.0.2.1`), or a `*.` wildcard (`*.example.com`). URLs, ports, paths, and
          # IPv6 addresses aren't accepted. The list can have up to 16 entries.
          sig { returns(T::Array[String]) }
          attr_accessor :allowed_hosts

          sig { returns(Symbol) }
          attr_accessor :type

          # Substitute the secret only on requests to the listed hosts.
          sig do
            params(allowed_hosts: T::Array[String], type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The destination hosts of the outbound requests that the credential's secret is
            # substituted into.
            #
            # Each entry is a bare hostname (`api.example.com`), an IPv4 address
            # (`192.0.2.1`), or a `*.` wildcard (`*.example.com`). URLs, ports, paths, and
            # IPv6 addresses aren't accepted. The list can have up to 16 entries.
            allowed_hosts:,
            type: :limited
          )
          end

          sig do
            override.returns({ allowed_hosts: T::Array[String], type: Symbol })
          end
          def to_hash
          end
        end
      end
    end
  end
end
