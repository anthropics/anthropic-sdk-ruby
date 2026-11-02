# typed: strong

module Anthropic
  module Models
    module Organization
      # A dimension to group connector activity by.
      module AnalyticsConnectorGroupBy
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Organization::AnalyticsConnectorGroupBy)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PRODUCT =
          T.let(
            :product,
            Anthropic::Organization::AnalyticsConnectorGroupBy::TaggedSymbol
          )
        RBAC_GROUP_ID =
          T.let(
            :rbac_group_id,
            Anthropic::Organization::AnalyticsConnectorGroupBy::TaggedSymbol
          )
        USER_ID =
          T.let(
            :user_id,
            Anthropic::Organization::AnalyticsConnectorGroupBy::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::Organization::AnalyticsConnectorGroupBy::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
