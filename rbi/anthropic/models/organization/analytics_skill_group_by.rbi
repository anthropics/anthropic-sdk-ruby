# typed: strong

module Anthropic
  module Models
    module Organization
      # A dimension to group skill activity by.
      module AnalyticsSkillGroupBy
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Organization::AnalyticsSkillGroupBy)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PRODUCT =
          T.let(
            :product,
            Anthropic::Organization::AnalyticsSkillGroupBy::TaggedSymbol
          )
        RBAC_GROUP_ID =
          T.let(
            :rbac_group_id,
            Anthropic::Organization::AnalyticsSkillGroupBy::TaggedSymbol
          )
        USER_ID =
          T.let(
            :user_id,
            Anthropic::Organization::AnalyticsSkillGroupBy::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::Organization::AnalyticsSkillGroupBy::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
