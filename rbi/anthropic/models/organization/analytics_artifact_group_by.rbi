# typed: strong

module Anthropic
  module Models
    module Organization
      # A dimension to group artifact activity by.
      module AnalyticsArtifactGroupBy
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::Organization::AnalyticsArtifactGroupBy)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        PRODUCT =
          T.let(
            :product,
            Anthropic::Organization::AnalyticsArtifactGroupBy::TaggedSymbol
          )
        RBAC_GROUP_ID =
          T.let(
            :rbac_group_id,
            Anthropic::Organization::AnalyticsArtifactGroupBy::TaggedSymbol
          )
        USER_ID =
          T.let(
            :user_id,
            Anthropic::Organization::AnalyticsArtifactGroupBy::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[
              Anthropic::Organization::AnalyticsArtifactGroupBy::TaggedSymbol
            ]
          )
        end
        def self.values
        end
      end
    end
  end
end
