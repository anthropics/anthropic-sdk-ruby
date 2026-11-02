# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # A dimension to group plugin activity by.
        module BetaAnalyticsPluginGroupBy
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaAnalyticsPluginGroupBy
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PRODUCT =
            T.let(
              :product,
              Anthropic::Beta::Organization::BetaAnalyticsPluginGroupBy::TaggedSymbol
            )
          RBAC_GROUP_ID =
            T.let(
              :rbac_group_id,
              Anthropic::Beta::Organization::BetaAnalyticsPluginGroupBy::TaggedSymbol
            )
          USER_ID =
            T.let(
              :user_id,
              Anthropic::Beta::Organization::BetaAnalyticsPluginGroupBy::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsPluginGroupBy::TaggedSymbol
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
