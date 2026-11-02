# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # A dimension to group user activity by.
        module BetaAnalyticsUserGroupBy
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaAnalyticsUserGroupBy
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          RBAC_GROUP_ID =
            T.let(
              :rbac_group_id,
              Anthropic::Beta::Organization::BetaAnalyticsUserGroupBy::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsUserGroupBy::TaggedSymbol
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
