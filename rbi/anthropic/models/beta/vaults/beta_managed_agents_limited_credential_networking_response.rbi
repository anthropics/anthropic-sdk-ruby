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

          sig do
            returns(
              Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse::Type::TaggedSymbol
            )
          end
          attr_accessor :type

          # The secret is substituted only on requests to the listed hosts.
          sig do
            params(
              allowed_hosts: T::Array[String],
              type:
                Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The destination hosts of the outbound requests that the credential's secret is
            # substituted into.
            #
            # An entry matches the request host exactly. An entry such as `*.example.com`
            # matches any subdomain of `example.com` but not `example.com` itself.
            allowed_hosts:,
            type:
          )
          end

          sig do
            override.returns(
              {
                allowed_hosts: T::Array[String],
                type:
                  Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse::Type::TaggedSymbol
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
                  Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            LIMITED =
              T.let(
                :limited,
                Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Vaults::BetaManagedAgentsLimitedCredentialNetworkingResponse::Type::TaggedSymbol
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
