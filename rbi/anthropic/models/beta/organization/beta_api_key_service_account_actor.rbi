# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAPIKeyServiceAccountActor < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAPIKeyServiceAccountActor,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the Service Account the API key acts as.
          sig { returns(String) }
          attr_accessor :service_account_id

          # Principal type. Always `"service_account_actor"` for a Service Account.
          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(service_account_id: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # ID of the Service Account the API key acts as.
            service_account_id:,
            # Principal type. Always `"service_account_actor"` for a Service Account.
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
