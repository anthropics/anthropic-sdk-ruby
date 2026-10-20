# typed: strong

module Anthropic
  module Models
    BetaWebhookUserProfileEnforcementActionOpenedEventData =
      Beta::BetaWebhookUserProfileEnforcementActionOpenedEventData

    module Beta
      class BetaWebhookUserProfileEnforcementActionOpenedEventData < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebhookUserProfileEnforcementActionOpenedEventData,
              Anthropic::Internal::AnyHash
            )
          end

        # ID of the user profile the enforcement action is on.
        sig { returns(String) }
        attr_accessor :id

        # ID (`enac_...`) of the enforcement action that was opened or resolved.
        sig { returns(String) }
        attr_accessor :enforcement_action_id

        sig { returns(String) }
        attr_accessor :organization_id

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            enforcement_action_id: String,
            organization_id: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # ID of the user profile the enforcement action is on.
          id:,
          # ID (`enac_...`) of the enforcement action that was opened or resolved.
          enforcement_action_id:,
          organization_id:,
          type: :"user_profile.enforcement_action_opened"
        )
        end

        sig do
          override.returns(
            {
              id: String,
              enforcement_action_id: String,
              organization_id: String,
              type: Symbol
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
