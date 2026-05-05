# typed: strong

module Anthropic
  module Models
    BetaWebhookSessionThreadIdledEventData =
      Beta::BetaWebhookSessionThreadIdledEventData

    module Beta
      class BetaWebhookSessionThreadIdledEventData < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebhookSessionThreadIdledEventData,
              Anthropic::Internal::AnyHash
            )
          end

        # ID of the resource that triggered the event.
        sig { returns(String) }
        attr_accessor :id

        sig { returns(String) }
        attr_accessor :organization_id

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(String) }
        attr_accessor :workspace_id

        sig do
          params(
            id: String,
            organization_id: String,
            workspace_id: String,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # ID of the resource that triggered the event.
          id:,
          organization_id:,
          workspace_id:,
          type: :"session.thread_idled"
        )
        end

        sig do
          override.returns(
            {
              id: String,
              organization_id: String,
              type: Symbol,
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
