# typed: strong

module Anthropic
  module Models
    BetaWebhookEnvironmentDeletedEventData =
      Beta::BetaWebhookEnvironmentDeletedEventData

    module Beta
      class BetaWebhookEnvironmentDeletedEventData < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebhookEnvironmentDeletedEventData,
              Anthropic::Internal::AnyHash
            )
          end

        # ID of the environment that triggered the event.
        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :organization_id

        sig do
          returns(
            Anthropic::Beta::BetaWebhookEnvironmentDeletedEventType::TaggedSymbol
          )
        end
        attr_accessor :type

        sig { returns(String) }
        attr_accessor :workspace_id

        sig do
          params(
            id: String,
            organization_id: String,
            type:
              Anthropic::Beta::BetaWebhookEnvironmentDeletedEventType::OrSymbol,
            workspace_id: String
          ).returns(T.attached_class)
        end
        def self.new(
          # ID of the environment that triggered the event.
          id:,
          organization_id:,
          type:,
          workspace_id:
        )
        end

        sig do
          override.returns(
            {
              id: String,
              organization_id: String,
              type:
                Anthropic::Beta::BetaWebhookEnvironmentDeletedEventType::TaggedSymbol,
              workspace_id: String
            }
          )
        end
        def to_hash
        end
      end
    end
  end
end
