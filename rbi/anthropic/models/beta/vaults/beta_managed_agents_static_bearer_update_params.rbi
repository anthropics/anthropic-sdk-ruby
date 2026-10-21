# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsStaticBearerUpdateParams < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsStaticBearerUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          sig { returns(Symbol) }
          attr_accessor :type

          # The new static bearer token to replace the stored one.
          sig { returns(T.nilable(String)) }
          attr_accessor :token

          # Parameters for updating a static bearer token credential. The `mcp_server_url`
          # is immutable.
          sig do
            params(token: T.nilable(String), type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The new static bearer token to replace the stored one.
            token: nil,
            type: :static_bearer
          )
          end

          sig { override.returns({ type: Symbol, token: T.nilable(String) }) }
          def to_hash
          end
        end
      end
    end
  end
end
