# typed: strong

module Anthropic
  module Models
    module Beta
      module Vaults
        class BetaManagedAgentsDeletedCredential < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Vaults::BetaManagedAgentsDeletedCredential,
                Anthropic::Internal::AnyHash
              )
            end

          # The unique ID of the deleted credential (`vcrd_...`).
          sig { returns(String) }
          attr_accessor :id

          sig { returns(Symbol) }
          attr_accessor :type

          # Confirmation of a deleted credential.
          sig { params(id: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # The unique ID of the deleted credential (`vcrd_...`).
            id:,
            type: :vault_credential_deleted
          )
          end

          sig { override.returns({ id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
