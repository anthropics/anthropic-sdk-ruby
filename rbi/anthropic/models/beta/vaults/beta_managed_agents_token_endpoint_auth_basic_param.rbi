# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthBasicParam < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicParam,
                Anthropic::Internal::AnyHash
              )
            end

          # The OAuth client secret, sent to `token_endpoint` with HTTP Basic
          # authentication.
          sig { returns(String) }
          attr_accessor :client_secret

          sig { returns(Symbol) }
          attr_accessor :type

          # Token endpoint uses HTTP Basic authentication with client credentials.
          sig do
            params(client_secret: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The OAuth client secret, sent to `token_endpoint` with HTTP Basic
            # authentication.
            client_secret:,
            type: :client_secret_basic
          )
          end

          sig { override.returns({ client_secret: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
