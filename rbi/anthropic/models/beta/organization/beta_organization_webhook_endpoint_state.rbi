# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # Whether deliveries are sent to an organization webhook endpoint.
        module BetaOrganizationWebhookEndpointState
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaOrganizationWebhookEndpointState
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          DISABLED =
            T.let(
              :disabled,
              Anthropic::Beta::Organization::BetaOrganizationWebhookEndpointState::TaggedSymbol
            )
          ENABLED =
            T.let(
              :enabled,
              Anthropic::Beta::Organization::BetaOrganizationWebhookEndpointState::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaOrganizationWebhookEndpointState::TaggedSymbol
              ]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
