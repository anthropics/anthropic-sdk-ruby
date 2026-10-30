# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # A dimension to group artifact activity by.
        module BetaAnalyticsArtifactGroupBy
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(
                Symbol,
                Anthropic::Beta::Organization::BetaAnalyticsArtifactGroupBy
              )
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          PRODUCT =
            T.let(
              :product,
              Anthropic::Beta::Organization::BetaAnalyticsArtifactGroupBy::TaggedSymbol
            )
          RBAC_GROUP_ID =
            T.let(
              :rbac_group_id,
              Anthropic::Beta::Organization::BetaAnalyticsArtifactGroupBy::TaggedSymbol
            )
          USER_ID =
            T.let(
              :user_id,
              Anthropic::Beta::Organization::BetaAnalyticsArtifactGroupBy::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[
                Anthropic::Beta::Organization::BetaAnalyticsArtifactGroupBy::TaggedSymbol
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
