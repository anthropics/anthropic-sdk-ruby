# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsCostBucketedResult < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult,
                Anthropic::Internal::AnyHash
              )
            end

          # Amount (post-discount, pre-credit) in fractional cents.
          sig { returns(String) }
          attr_accessor :amount

          # Claude Tag (Claude in Slack) spend category: `engaged` (a person addressed
          # Claude in a channel or thread), `proactive` (Claude responded without being
          # addressed), `scheduled` (a scheduled routine ran), `monitoring` (Claude watching
          # a channel it was asked to monitor), or `dm` (direct messages with Claude).
          # Populated only when `claude_tag_category` is in `group_by[]`; null for usage
          # that is not Claude Tag. Direct-message usage is billed to the individual user
          # and is reported under that user's product, not under `claude-tag`. New
          # categories may be added over time.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory::TaggedSymbol
              )
            )
          end
          attr_accessor :claude_tag_category

          # Slack user ID (for example `U0123ABCDEF`) of the member the Claude Tag (Claude
          # in Slack) usage is attributed to, not a claude.ai user ID. Populated only when
          # `claude_tag_user_id` is in `group_by[]`; null for usage that is not Claude Tag
          # and for Claude Tag usage that is not attributed to a single user (for example
          # `monitoring`, and `proactive` usage Claude initiated), so per-user rows can sum
          # to less than the Claude Tag total. Cannot be combined with
          # `group_by[]=rbac_group_id` or the `rbac_group_ids[]` filter.
          sig { returns(T.nilable(String)) }
          attr_accessor :claude_tag_user_id

          # Context-window pricing tier of the usage or cost. Null unless `context_window`
          # is in `group_by[]`; it can also be null on grouped rows with no context-window
          # tier, such as code execution.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaAnalyticsContextWindow::TaggedSymbol
              )
            )
          end
          attr_accessor :context_window

          # Cost component when `group_by[]=cost_type`; null otherwise (amount is the
          # combined total).
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaAnalyticsCostType::TaggedSymbol
              )
            )
          end
          attr_accessor :cost_type

          # Currency code for the cost amount. Currently always `"USD"`.
          sig { returns(String) }
          attr_accessor :currency

          # Inference region of the usage or cost. Null unless `inference_geo` is in
          # `group_by[]`; it can also be null on grouped rows where the region is not set
          # (the rows that `inference_geos[]=not_available` matches).
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult::InferenceGeo::TaggedSymbol
              )
            )
          end
          attr_accessor :inference_geo

          # List-price amount (pre-discount) in fractional cents.
          sig { returns(String) }
          attr_accessor :list_amount

          # Model that produced the usage or cost, as a model name in the form the
          # `models[]` filter accepts (for example, `claude-opus-5`). Null unless `model` is
          # in `group_by[]`; it can also be null on grouped rows whose usage or cost is not
          # attributed to a specific model, such as code execution.
          sig { returns(T.nilable(String)) }
          attr_accessor :model

          # Product surface that produced the usage or cost. Null unless product is in
          # `group_by[]`; it can also be null on grouped rows whose usage cannot be
          # attributed to a known surface. Values include `chat`, `claude_code`, `cowork`,
          # `office_agent`, `claude_in_chrome`, `claude_design`, and `claude-tag`.
          # `claude-tag` is Claude Tag, the Claude product in Slack. Some unattributed usage
          # is reported as "other".
          sig { returns(T.nilable(String)) }
          attr_accessor :product

          # RBAC group (team) the usage is attributed to, in the public tagged
          # `rbac_group_...` spelling — the same spelling the activity resources use for
          # this key, so the same team has one id across resources and it round-trips as an
          # `rbac_group_ids[]` filter value. Populated only when `rbac_group_id` is in
          # `group_by[]`. Any-membership semantics: a user in several groups contributes
          # their full usage to each of those groups' rows, so the named-group rows overlap
          # and their sum can exceed the org total. A null value is the single unassigned
          # row: users in no group on that (UTC) day. For the true org total, run the same
          # query without `group_by[]`.
          sig { returns(T.nilable(String)) }
          attr_accessor :rbac_group_id

          # Number of API requests in this row's scope. Null when `group_by` includes
          # `cost_type` or `token_type` (the count has no per-component attribution; read it
          # from the ungrouped response). For sandbox / code-execution events, this counts
          # execution spans rather than HTTP requests (these rows surface with
          # `product: null`).
          sig { returns(T.nilable(Integer)) }
          attr_accessor :requests

          # Slack channel the usage originated from. Populated only when `slack_channel_id`
          # is in `group_by[]`; null for usage outside Slack (and for rows recorded before
          # channel attribution was enabled).
          sig { returns(T.nilable(String)) }
          attr_accessor :slack_channel_id

          # Inference speed mode of the usage or cost: `fast` or `standard`. Null unless
          # `speed` is in `group_by[]`.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult::Speed::TaggedSymbol
              )
            )
          end
          attr_accessor :speed

          # Token type when `group_by[]=token_type` and `cost_type=tokens`; null otherwise.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaAnalyticsTokenType::TaggedSymbol
              )
            )
          end
          attr_accessor :token_type

          sig do
            params(
              amount: String,
              claude_tag_category:
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory::OrSymbol
                ),
              claude_tag_user_id: T.nilable(String),
              context_window:
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsContextWindow::OrSymbol
                ),
              cost_type:
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsCostType::OrSymbol
                ),
              currency: String,
              inference_geo:
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult::InferenceGeo::OrSymbol
                ),
              list_amount: String,
              model: T.nilable(String),
              product: T.nilable(String),
              rbac_group_id: T.nilable(String),
              requests: T.nilable(Integer),
              slack_channel_id: T.nilable(String),
              speed:
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult::Speed::OrSymbol
                ),
              token_type:
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsTokenType::OrSymbol
                )
            ).returns(T.attached_class)
          end
          def self.new(
            # Amount (post-discount, pre-credit) in fractional cents.
            amount:,
            # Claude Tag (Claude in Slack) spend category: `engaged` (a person addressed
            # Claude in a channel or thread), `proactive` (Claude responded without being
            # addressed), `scheduled` (a scheduled routine ran), `monitoring` (Claude watching
            # a channel it was asked to monitor), or `dm` (direct messages with Claude).
            # Populated only when `claude_tag_category` is in `group_by[]`; null for usage
            # that is not Claude Tag. Direct-message usage is billed to the individual user
            # and is reported under that user's product, not under `claude-tag`. New
            # categories may be added over time.
            claude_tag_category:,
            # Slack user ID (for example `U0123ABCDEF`) of the member the Claude Tag (Claude
            # in Slack) usage is attributed to, not a claude.ai user ID. Populated only when
            # `claude_tag_user_id` is in `group_by[]`; null for usage that is not Claude Tag
            # and for Claude Tag usage that is not attributed to a single user (for example
            # `monitoring`, and `proactive` usage Claude initiated), so per-user rows can sum
            # to less than the Claude Tag total. Cannot be combined with
            # `group_by[]=rbac_group_id` or the `rbac_group_ids[]` filter.
            claude_tag_user_id:,
            # Context-window pricing tier of the usage or cost. Null unless `context_window`
            # is in `group_by[]`; it can also be null on grouped rows with no context-window
            # tier, such as code execution.
            context_window:,
            # Cost component when `group_by[]=cost_type`; null otherwise (amount is the
            # combined total).
            cost_type:,
            # Currency code for the cost amount. Currently always `"USD"`.
            currency:,
            # Inference region of the usage or cost. Null unless `inference_geo` is in
            # `group_by[]`; it can also be null on grouped rows where the region is not set
            # (the rows that `inference_geos[]=not_available` matches).
            inference_geo:,
            # List-price amount (pre-discount) in fractional cents.
            list_amount:,
            # Model that produced the usage or cost, as a model name in the form the
            # `models[]` filter accepts (for example, `claude-opus-5`). Null unless `model` is
            # in `group_by[]`; it can also be null on grouped rows whose usage or cost is not
            # attributed to a specific model, such as code execution.
            model:,
            # Product surface that produced the usage or cost. Null unless product is in
            # `group_by[]`; it can also be null on grouped rows whose usage cannot be
            # attributed to a known surface. Values include `chat`, `claude_code`, `cowork`,
            # `office_agent`, `claude_in_chrome`, `claude_design`, and `claude-tag`.
            # `claude-tag` is Claude Tag, the Claude product in Slack. Some unattributed usage
            # is reported as "other".
            product:,
            # RBAC group (team) the usage is attributed to, in the public tagged
            # `rbac_group_...` spelling — the same spelling the activity resources use for
            # this key, so the same team has one id across resources and it round-trips as an
            # `rbac_group_ids[]` filter value. Populated only when `rbac_group_id` is in
            # `group_by[]`. Any-membership semantics: a user in several groups contributes
            # their full usage to each of those groups' rows, so the named-group rows overlap
            # and their sum can exceed the org total. A null value is the single unassigned
            # row: users in no group on that (UTC) day. For the true org total, run the same
            # query without `group_by[]`.
            rbac_group_id:,
            # Number of API requests in this row's scope. Null when `group_by` includes
            # `cost_type` or `token_type` (the count has no per-component attribution; read it
            # from the ungrouped response). For sandbox / code-execution events, this counts
            # execution spans rather than HTTP requests (these rows surface with
            # `product: null`).
            requests:,
            # Slack channel the usage originated from. Populated only when `slack_channel_id`
            # is in `group_by[]`; null for usage outside Slack (and for rows recorded before
            # channel attribution was enabled).
            slack_channel_id:,
            # Inference speed mode of the usage or cost: `fast` or `standard`. Null unless
            # `speed` is in `group_by[]`.
            speed:,
            # Token type when `group_by[]=token_type` and `cost_type=tokens`; null otherwise.
            token_type:
          )
          end

          sig do
            override.returns(
              {
                amount: String,
                claude_tag_category:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory::TaggedSymbol
                  ),
                claude_tag_user_id: T.nilable(String),
                context_window:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsContextWindow::TaggedSymbol
                  ),
                cost_type:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsCostType::TaggedSymbol
                  ),
                currency: String,
                inference_geo:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult::InferenceGeo::TaggedSymbol
                  ),
                list_amount: String,
                model: T.nilable(String),
                product: T.nilable(String),
                rbac_group_id: T.nilable(String),
                requests: T.nilable(Integer),
                slack_channel_id: T.nilable(String),
                speed:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult::Speed::TaggedSymbol
                  ),
                token_type:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsTokenType::TaggedSymbol
                  )
              }
            )
          end
          def to_hash
          end

          # Inference region of the usage or cost. Null unless `inference_geo` is in
          # `group_by[]`; it can also be null on grouped rows where the region is not set
          # (the rows that `inference_geos[]=not_available` matches).
          module InferenceGeo
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult::InferenceGeo
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GLOBAL =
              T.let(
                :global,
                Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult::InferenceGeo::TaggedSymbol
              )
            US =
              T.let(
                :us,
                Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult::InferenceGeo::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult::InferenceGeo::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          # Inference speed mode of the usage or cost: `fast` or `standard`. Null unless
          # `speed` is in `group_by[]`.
          module Speed
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult::Speed
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FAST =
              T.let(
                :fast,
                Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult::Speed::TaggedSymbol
              )
            STANDARD =
              T.let(
                :standard,
                Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult::Speed::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaAnalyticsCostBucketedResult::Speed::TaggedSymbol
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
