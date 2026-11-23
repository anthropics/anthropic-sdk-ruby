# typed: strong

module Anthropic
  module Models
    BetaWebhookExternalStorageFailedEventData =
      Beta::BetaWebhookExternalStorageFailedEventData

    module Beta
      class BetaWebhookExternalStorageFailedEventData < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebhookExternalStorageFailedEventData,
              Anthropic::Internal::AnyHash
            )
          end

        # ID (`estrg_...`) of the External Storage whose bucket failed Anthropic's check
        # or passes it again.
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
          # ID (`estrg_...`) of the External Storage whose bucket failed Anthropic's check
          # or passes it again.
          id:,
          organization_id:,
          type: :"external_storage.failed"
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
