# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsFederatedActorAzureProvider < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsFederatedActorAzureProvider,
                Anthropic::Internal::AnyHash
              )
            end

          # The Azure subscription the organization is bound to.
          sig { returns(String) }
          attr_accessor :subscription_id

          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(subscription_id: String, type: Symbol).returns(
              T.attached_class
            )
          end
          def self.new(
            # The Azure subscription the organization is bound to.
            subscription_id:,
            type: :azure
          )
          end

          sig { override.returns({ subscription_id: String, type: Symbol }) }
          def to_hash
          end
        end
      end
    end
  end
end
