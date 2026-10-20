# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaDeletedOrganizationWebhookEndpoint < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaDeletedOrganizationWebhookEndpoint,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the deleted webhook endpoint.
          sig { returns(String) }
          attr_accessor :id

          # Always `webhook_endpoint_deleted`.
          sig { returns(Symbol) }
          attr_accessor :type

          # A deleted organization webhook endpoint.
          sig { params(id: String, type: Symbol).returns(T.attached_class) }
          def self.new(
            # ID of the deleted webhook endpoint.
            id:,
            # Always `webhook_endpoint_deleted`.
            type: :webhook_endpoint_deleted
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
