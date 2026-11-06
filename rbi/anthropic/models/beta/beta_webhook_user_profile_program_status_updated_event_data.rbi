# typed: strong

module Anthropic
  module Models
    BetaWebhookUserProfileProgramStatusUpdatedEventData =
      Beta::BetaWebhookUserProfileProgramStatusUpdatedEventData

    module Beta
      class BetaWebhookUserProfileProgramStatusUpdatedEventData < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebhookUserProfileProgramStatusUpdatedEventData,
              Anthropic::Internal::AnyHash
            )
          end

        # ID of the user profile that triggered the event.
        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :organization_id

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(id: String, organization_id: String, type: Symbol).returns(
            T.attached_class
          )
        end
        def self.new(
          # ID of the user profile that triggered the event.
          id:,
          organization_id:,
          type: :"user_profile.program_status_updated"
        )
        end

        sig do
          override.returns(
            { id: String, organization_id: String, type: Symbol }
          )
        end
        def to_hash
        end
      end
    end
  end
end
