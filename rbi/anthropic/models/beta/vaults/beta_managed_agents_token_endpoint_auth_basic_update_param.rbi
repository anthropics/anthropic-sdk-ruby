# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsTokenEndpointAuthBasicUpdateParam < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsTokenEndpointAuthBasicUpdateParam,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # A new OAuth client secret to replace the stored one.
          #
          # The credential must already use `client_secret_basic` or `client_secret_post`.
          # It keeps its current `token_endpoint_auth` type, even if the `type` sent with
          # this secret is the other one.
          sig { returns(T.nilable(String)) }
          attr_accessor :client_secret

          # Updated HTTP Basic authentication parameters for the token endpoint.
          sig do
            params(client_secret: T.nilable(String), type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # A new OAuth client secret to replace the stored one.
            #
            # The credential must already use `client_secret_basic` or `client_secret_post`.
            # It keeps its current `token_endpoint_auth` type, even if the `type` sent with
            # this secret is the other one.
            client_secret: nil,
            type: :client_secret_basic
          )
          end

          sig do
            override.returns({ type: Symbol, client_secret: T.nilable(String) })
          end
          def to_hash
          end
        end
      end
    end
  end
end
