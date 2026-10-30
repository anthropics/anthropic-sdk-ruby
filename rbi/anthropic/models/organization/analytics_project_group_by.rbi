# typed: strong

module Anthropic
  module Models
    module Organization
      # A dimension to group chat project activity by.
      module AnalyticsProjectGroupBy
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Organization::AnalyticsProjectGroupBy)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        RBAC_GROUP_ID =
          T.let(
            :rbac_group_id,
            Anthropic::Organization::AnalyticsProjectGroupBy::TaggedSymbol
          )
        USER_ID =
          T.let(
            :user_id,
            Anthropic::Organization::AnalyticsProjectGroupBy::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::Organization::AnalyticsProjectGroupBy::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
