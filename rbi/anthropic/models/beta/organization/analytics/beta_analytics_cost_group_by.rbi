# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          module BetaAnalyticsCostGroupBy
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ACTOR =
              T.let(
                :actor,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            ACTOR_TYPE =
              T.let(
                :actor_type,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            AGENT_ID =
              T.let(
                :agent_id,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            API_KEY_ID =
              T.let(
                :api_key_id,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            CLAUDE_TAG_CATEGORY =
              T.let(
                :claude_tag_category,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            CLAUDE_TAG_USER_ID =
              T.let(
                :claude_tag_user_id,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            CONTEXT_WINDOW =
              T.let(
                :context_window,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            COST_TYPE =
              T.let(
                :cost_type,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            DEPLOYMENT_ID =
              T.let(
                :deployment_id,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            ENVIRONMENT_ID =
              T.let(
                :environment_id,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            INFERENCE_GEO =
              T.let(
                :inference_geo,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            MODEL =
              T.let(
                :model,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            PRODUCT =
              T.let(
                :product,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            RBAC_GROUP_ID =
              T.let(
                :rbac_group_id,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            SERVICE_TIER =
              T.let(
                :service_tier,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            SESSION_ID =
              T.let(
                :session_id,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            SLACK_CHANNEL_ID =
              T.let(
                :slack_channel_id,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            SPEED =
              T.let(
                :speed,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            TOKEN_TYPE =
              T.let(
                :token_type,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            USER_PROFILE_ID =
              T.let(
                :user_profile_id,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )
            WORKSPACE_ID =
              T.let(
                :workspace_id,
                Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsCostGroupBy::TaggedSymbol
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
end
