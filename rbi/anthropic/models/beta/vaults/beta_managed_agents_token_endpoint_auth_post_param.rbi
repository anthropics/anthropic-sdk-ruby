# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthPostParam < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthPostParam,
                Anthropic::Internal::AnyHash
              )
            end

          # The OAuth client secret, sent to `token_endpoint` in the POST body.
          sig { returns(String) }
          attr_accessor :client_secret

          sig { returns(Symbol) }
          attr_accessor :type

          # Token endpoint uses POST body authentication with client credentials.
          sig do
            params(client_secret: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The OAuth client secret, sent to `token_endpoint` in the POST body.
            client_secret:,
            type: :client_secret_post
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
