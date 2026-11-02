# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # A dimension to group chat project activity by.
        module BetaAnalyticsProjectGroupBy
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaAnalyticsProjectGroupBy
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          RBAC_GROUP_ID =
            T.let(
              :rbac_group_id,
              Anthropic::Beta::Organization::BetaAnalyticsProjectGroupBy::TaggedSymbol
            )
          USER_ID =
            T.let(
              :user_id,
              Anthropic::Beta::Organization::BetaAnalyticsProjectGroupBy::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsProjectGroupBy::TaggedSymbol
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
