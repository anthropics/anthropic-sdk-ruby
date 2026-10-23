# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsServiceAccountActor < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsServiceAccountActor,
                Anthropic::Internal::AnyHash
              )
            end

          # Tagged service account ID.
          sig { returns(String) }
          attr_accessor :service_account_id

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(service_account_id: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # Tagged service account ID.
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
