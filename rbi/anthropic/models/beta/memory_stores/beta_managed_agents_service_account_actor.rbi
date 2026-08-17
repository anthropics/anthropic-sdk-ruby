# typed: strong

module Anthropic
  module Models
    module Beta
      module MemoryStores
        class BetaManagedAgentsServiceAccountActor < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::MemoryStores::BetaManagedAgentsServiceAccountActor,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the service account that performed the write (a `svac_...` value).
          sig { returns(String) }
          attr_accessor :service_account_id

          sig { returns(Symbol) }
          attr_accessor :type

          # Attribution for a write made by a workload authenticated as a service account,
          # for example via Workload Identity Federation.
          sig do
            params(service_account_id: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # ID of the service account that performed the write (a `svac_...` value).
            service_account_id:,
            type: :service_account_actor
          )
          end

          sig { override.returns({ service_account_id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
