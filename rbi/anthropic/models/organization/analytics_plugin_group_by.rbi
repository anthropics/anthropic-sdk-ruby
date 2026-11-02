# typed: strong

module Anthropic
  module Models
    module Organization
      # A dimension to group plugin activity by.
      module AnalyticsPluginGroupBy
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Organization::AnalyticsPluginGroupBy)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PRODUCT =
          T.let(
            :product,
            Anthropic::Organization::AnalyticsPluginGroupBy::TaggedSymbol
          )
        RBAC_GROUP_ID =
          T.let(
            :rbac_group_id,
            Anthropic::Organization::AnalyticsPluginGroupBy::TaggedSymbol
          )
        USER_ID =
          T.let(
            :user_id,
            Anthropic::Organization::AnalyticsPluginGroupBy::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::Organization::AnalyticsPluginGroupBy::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
