# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaOrganizationWebhookEndpointSigningSecret < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaOrganizationWebhookEndpointSigningSecret,
                Anthropic::Internal::AnyHash
              )
            end

          # The new signing secret. Deliveries are signed with it from now on, and no other
          # response returns it.
          sig { returns(String) }
          attr_accessor :signing_secret

          # An organization webhook endpoint's new signing secret.
          sig { params(signing_secret: String).returns(T.attached_class) }
          def self.new(
            # The new signing secret. Deliveries are signed with it from now on, and no other
            # response returns it.
            signing_secret:
          )
          end

          sig { override.returns({ signing_secret: String }) }
          def to_hash
          end
        end
      end
    end
  end
end
