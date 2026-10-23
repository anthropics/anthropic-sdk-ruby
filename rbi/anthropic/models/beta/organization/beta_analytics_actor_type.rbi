# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # Kind of identity a row's usage is attributed to.
        module BetaAnalyticsActorType
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaAnalyticsActorType
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          API_ACTOR =
            T.let(
              :api_actor,
              Anthropic::Beta::Organization::BetaAnalyticsActorType::TaggedSymbol
            )
          FEDERATED_ACTOR =
            T.let(
              :federated_actor,
              Anthropic::Beta::Organization::BetaAnalyticsActorType::TaggedSymbol
            )
          SERVICE_ACCOUNT_ACTOR =
            T.let(
              :service_account_actor,
              Anthropic::Beta::Organization::BetaAnalyticsActorType::TaggedSymbol
            )
          USER_ACTOR =
            T.let(
              :user_actor,
              Anthropic::Beta::Organization::BetaAnalyticsActorType::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsActorType::TaggedSymbol
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
