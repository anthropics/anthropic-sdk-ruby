# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsLimitedCredentialNetworkingResponse < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse,
                Anthropic::Internal::AnyHash
              )
            end

          # The destination hosts of the outbound requests that the credential's secret is
          # substituted into.
          #
          # An entry matches the request host exactly. An entry such as `*.example.com`
          # matches any subdomain of `example.com` but not `example.com` itself.
          sig { returns(T::Array[String]) }
          attr_accessor :allowed_hosts

          sig { returns(Symbol) }
          attr_accessor :type

          # The secret is substituted only on requests to the listed hosts.
          sig do
            params(allowed_hosts: T::Array[String], type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The destination hosts of the outbound requests that the credential's secret is
            # substituted into.
            #
            # An entry matches the request host exactly. An entry such as `*.example.com`
            # matches any subdomain of `example.com` but not `example.com` itself.
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
