# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsAPIActor < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsAPIActor,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the API key (an `apikey_...` value). This identifies the key, not the
          # secret.
          sig { returns(String) }
          attr_accessor :api_key_id

          sig { returns(Symbol) }
          attr_accessor :type

          # A direct caller of the public API, identified by the API key that authenticated
          # the request.
          sig do
            params(api_key_id: String, type: Symbol).returns(T.attached_class)
          end
          def self.new(
            # ID of the API key (an `apikey_...` value). This identifies the key, not the
            # secret.
            api_key_id:,
            type: :api_actor
          )
          end

          sig { override.returns({ api_key_id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
