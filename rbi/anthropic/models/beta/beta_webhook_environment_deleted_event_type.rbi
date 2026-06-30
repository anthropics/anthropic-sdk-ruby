# typed: strong

module Anthropic
  module Models
    BetaWebhookEnvironmentDeletedEventType =
      Beta::BetaWebhookEnvironmentDeletedEventType

    module Beta
      module BetaWebhookEnvironmentDeletedEventType
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(
              Symbol,
              Anthropic::Beta::BetaWebhookEnvironmentDeletedEventType
            )
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        ENVIRONMENT_DELETED =
          T.let(
            :"environment.deleted",
            Anthropic::Beta::BetaWebhookEnvironmentDeletedEventType::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::Beta::BetaWebhookEnvironmentDeletedEventType::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
