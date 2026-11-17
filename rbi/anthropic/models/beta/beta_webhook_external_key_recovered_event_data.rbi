# typed: strong

module Anthropic
  module Models
    BetaWebhookExternalKeyRecoveredEventData =
      Beta::BetaWebhookExternalKeyRecoveredEventData

    module Beta
      class BetaWebhookExternalKeyRecoveredEventData < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaWebhookExternalKeyRecoveredEventData,
              Anthropic::Internal::AnyHash
            )
          end

        # ID (`ekey_...`) of the external key that stopped working or works again.
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
          # ID (`ekey_...`) of the external key that stopped working or works again.
          id:,
          organization_id:,
          type: :"external_key.recovered"
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
