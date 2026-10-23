# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          class BetaAnalyticsUsageGroup < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Analytics::BetaAnalyticsUsageGroup,
                  Anthropic::Internal::AnyHash
                )
              end

            # The identity the usage is attributed to: the user if one is attributed, else the
            # service account, else the federated (cloud-platform) identity, else the API key.
            # Populated only when `actor` is in `group_by[]`; null for usage with no
            # attributable identity, and for users' and federated identities' usage when the
            # reader is a member who can see only some workspaces. Distinct identities the
            # server cannot render also read null, each as its own row.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsActor::Variants
                )
              )
            end
            attr_accessor :actor

            # Kind of identity the usage is attributed to; matches `actor.type` when `actor`
            # is set. Populated only when `actor_type` is in `group_by[]`.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsActorType::TaggedSymbol
                )
              )
            end
            attr_accessor :actor_type

            # Claude Managed Agents agent whose session incurred the usage. Populated only
            # when `agent_id` is in `group_by[]`; null for usage outside a managed session.
            sig { returns(T.nilable(String)) }
            attr_accessor :agent_id

            # API key that authenticated the requests, as a tagged API key ID, whichever
            # identity `actor` resolves to. Populated only when `api_key_id` is in
            # `group_by[]`; null for usage not authenticated by an API key.
            sig { returns(T.nilable(String)) }
            attr_accessor :api_key_id

            # Claude Tag (Claude in Slack) spend category: `engaged` (a person addressed
            # Claude in a channel or thread), `proactive` (Claude responded without being
            # addressed), `scheduled` (a scheduled routine ran), `monitoring` (Claude watching
            # a channel it was asked to monitor), or `dm` (direct messages with Claude).
            # Populated only when `claude_tag_category` is in `group_by[]`; null for usage
            # that is not Claude Tag. Direct-message usage is billed to the individual user
            # and is reported under that user's product, not under `claude_tag`. New
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

            # Deployment that started the Claude Managed Agents session. Populated only when
            # `deployment_id` is in `group_by[]`; null for usage outside a managed session and
            # for sessions no deployment started.
            sig { returns(T.nilable(String)) }
            attr_accessor :deployment_id

            # Claude Managed Agents environment the session ran in. Populated only when
            # `environment_id` is in `group_by[]`; null for usage outside a managed session.
            sig { returns(T.nilable(String)) }
            attr_accessor :environment_id

            # Inference region of the usage or cost. Null unless `inference_geo` is in
            # `group_by[]`; it can also be null on grouped rows where the region is not set
            # (the rows that `inference_geos[]=not_available` matches).
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsUsageCostInferenceGeo::TaggedSymbol
                )
              )
            end
            attr_accessor :inference_geo

            # Model that produced the usage or cost, as a model name in the form the
            # `models[]` filter accepts (for example, `claude-opus-5-5`). Null unless `model`
            # is in `group_by[]`; it can also be null on grouped rows whose usage or cost is
            # not attributed to a specific model, such as code execution.
            sig { returns(T.nilable(String)) }
            attr_accessor :model

            # Product surface that produced the usage or cost. Null unless product is in
            # `group_by[]`; it can also be null on grouped rows whose usage cannot be
            # attributed to a known surface. Values include `chat`, `claude_code`, `cowork`,
            # `office_agent`, `claude_in_chrome`, `claude_design`, `claude_tag`, and
            # `chat_cowork_unified`. `claude_tag` is Claude Tag, the Claude product in Slack.
            # `chat_cowork_unified` is Chat and Cowork unified, Cowork's features inside
            # claude.ai chat: chat and Cowork usage by a member who has it turned on is
            # reported under this value instead of `chat` or `cowork`. It is accepted as a
            # filter only on deployments that offer Chat and Cowork unified. Some unattributed
            # usage is reported as "other".
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

            # Service tier the usage was served at. Populated only when `service_tier` is in
            # `group_by[]`; null for usage with no service tier (for example, code execution)
            # and for Claude Enterprise usage.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsServiceTier::TaggedSymbol
                )
              )
            end
            attr_accessor :service_tier

            # Claude Managed Agents session that incurred the usage. Populated only when
            # `session_id` is in `group_by[]`; null for usage outside a managed session.
            sig { returns(T.nilable(String)) }
            attr_accessor :session_id

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
                  Anthropic::Beta::Organization::BetaAnalyticsSpeed::TaggedSymbol
                )
              )
            end
            attr_accessor :speed

            # User profile the usage was attributed to, as a tagged `uprof_` ID. Populated
            # only when `user_profile_id` is in `group_by[]`; null for usage that named no
            # profile and for Claude Enterprise usage.
            sig { returns(T.nilable(String)) }
            attr_accessor :user_profile_id

            # Workspace the usage occurred in, as a tagged workspace ID, including the
            # organization's default workspace. Populated only when `workspace_id` is in
            # `group_by[]`; null for Claude Enterprise usage.
            sig { returns(T.nilable(String)) }
            attr_accessor :workspace_id

            # The dimension values one usage row is broken out by; each is null unless its
            # dimension is in `group_by[]`.
            sig do
              params(
                actor:
                  T.nilable(
                    T.any(
                      Anthropic::Beta::Organization::BetaAnalyticsReportUserActor::OrHash,
                      Anthropic::Beta::Organization::BetaAnalyticsServiceAccountActor::OrHash,
                      Anthropic::Beta::Organization::BetaAnalyticsFederatedActor::OrHash,
                      Anthropic::Beta::Organization::BetaAnalyticsAPIActor::OrHash
                    )
                  ),
                actor_type:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsActorType::OrSymbol
                  ),
                agent_id: T.nilable(String),
                api_key_id: T.nilable(String),
                claude_tag_category:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory::OrSymbol
                  ),
                claude_tag_user_id: T.nilable(String),
                context_window:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsContextWindow::OrSymbol
                  ),
                deployment_id: T.nilable(String),
                environment_id: T.nilable(String),
                inference_geo:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsUsageCostInferenceGeo::OrSymbol
                  ),
                model: T.nilable(String),
                product: T.nilable(String),
                rbac_group_id: T.nilable(String),
                service_tier:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsServiceTier::OrSymbol
                  ),
                session_id: T.nilable(String),
                slack_channel_id: T.nilable(String),
                speed:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsSpeed::OrSymbol
                  ),
                user_profile_id: T.nilable(String),
                workspace_id: T.nilable(String)
              ).returns(T.attached_class)
            end
            def self.new(
              # The identity the usage is attributed to: the user if one is attributed, else the
              # service account, else the federated (cloud-platform) identity, else the API key.
              # Populated only when `actor` is in `group_by[]`; null for usage with no
              # attributable identity, and for users' and federated identities' usage when the
              # reader is a member who can see only some workspaces. Distinct identities the
              # server cannot render also read null, each as its own row.
              actor:,
              # Kind of identity the usage is attributed to; matches `actor.type` when `actor`
              # is set. Populated only when `actor_type` is in `group_by[]`.
              actor_type:,
              # Claude Managed Agents agent whose session incurred the usage. Populated only
              # when `agent_id` is in `group_by[]`; null for usage outside a managed session.
              agent_id:,
              # API key that authenticated the requests, as a tagged API key ID, whichever
              # identity `actor` resolves to. Populated only when `api_key_id` is in
              # `group_by[]`; null for usage not authenticated by an API key.
              api_key_id:,
              # Claude Tag (Claude in Slack) spend category: `engaged` (a person addressed
              # Claude in a channel or thread), `proactive` (Claude responded without being
              # addressed), `scheduled` (a scheduled routine ran), `monitoring` (Claude watching
              # a channel it was asked to monitor), or `dm` (direct messages with Claude).
              # Populated only when `claude_tag_category` is in `group_by[]`; null for usage
              # that is not Claude Tag. Direct-message usage is billed to the individual user
              # and is reported under that user's product, not under `claude_tag`. New
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
              # Deployment that started the Claude Managed Agents session. Populated only when
              # `deployment_id` is in `group_by[]`; null for usage outside a managed session and
              # for sessions no deployment started.
              deployment_id:,
              # Claude Managed Agents environment the session ran in. Populated only when
              # `environment_id` is in `group_by[]`; null for usage outside a managed session.
              environment_id:,
              # Inference region of the usage or cost. Null unless `inference_geo` is in
              # `group_by[]`; it can also be null on grouped rows where the region is not set
              # (the rows that `inference_geos[]=not_available` matches).
              inference_geo:,
              # Model that produced the usage or cost, as a model name in the form the
              # `models[]` filter accepts (for example, `claude-opus-5-5`). Null unless `model`
              # is in `group_by[]`; it can also be null on grouped rows whose usage or cost is
              # not attributed to a specific model, such as code execution.
              model:,
              # Product surface that produced the usage or cost. Null unless product is in
              # `group_by[]`; it can also be null on grouped rows whose usage cannot be
              # attributed to a known surface. Values include `chat`, `claude_code`, `cowork`,
              # `office_agent`, `claude_in_chrome`, `claude_design`, `claude_tag`, and
              # `chat_cowork_unified`. `claude_tag` is Claude Tag, the Claude product in Slack.
              # `chat_cowork_unified` is Chat and Cowork unified, Cowork's features inside
              # claude.ai chat: chat and Cowork usage by a member who has it turned on is
              # reported under this value instead of `chat` or `cowork`. It is accepted as a
              # filter only on deployments that offer Chat and Cowork unified. Some unattributed
              # usage is reported as "other".
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
              # Service tier the usage was served at. Populated only when `service_tier` is in
              # `group_by[]`; null for usage with no service tier (for example, code execution)
              # and for Claude Enterprise usage.
              service_tier:,
              # Claude Managed Agents session that incurred the usage. Populated only when
              # `session_id` is in `group_by[]`; null for usage outside a managed session.
              session_id:,
              # Slack channel the usage originated from. Populated only when `slack_channel_id`
              # is in `group_by[]`; null for usage outside Slack (and for rows recorded before
              # channel attribution was enabled).
              slack_channel_id:,
              # Inference speed mode of the usage or cost: `fast` or `standard`. Null unless
              # `speed` is in `group_by[]`.
              speed:,
              # User profile the usage was attributed to, as a tagged `uprof_` ID. Populated
              # only when `user_profile_id` is in `group_by[]`; null for usage that named no
              # profile and for Claude Enterprise usage.
              user_profile_id:,
              # Workspace the usage occurred in, as a tagged workspace ID, including the
              # organization's default workspace. Populated only when `workspace_id` is in
              # `group_by[]`; null for Claude Enterprise usage.
              workspace_id:
            )
            end

            sig do
              override.returns(
                {
                  actor:
                    T.nilable(
                      Anthropic::Beta::Organization::BetaAnalyticsActor::Variants
                    ),
                  actor_type:
                    T.nilable(
                      Anthropic::Beta::Organization::BetaAnalyticsActorType::TaggedSymbol
                    ),
                  agent_id: T.nilable(String),
                  api_key_id: T.nilable(String),
                  claude_tag_category:
                    T.nilable(
                      Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory::TaggedSymbol
                    ),
                  claude_tag_user_id: T.nilable(String),
                  context_window:
                    T.nilable(
                      Anthropic::Beta::Organization::BetaAnalyticsContextWindow::TaggedSymbol
                    ),
                  deployment_id: T.nilable(String),
                  environment_id: T.nilable(String),
                  inference_geo:
                    T.nilable(
                      Anthropic::Beta::Organization::BetaAnalyticsUsageCostInferenceGeo::TaggedSymbol
                    ),
                  model: T.nilable(String),
                  product: T.nilable(String),
                  rbac_group_id: T.nilable(String),
                  service_tier:
                    T.nilable(
                      Anthropic::Beta::Organization::BetaAnalyticsServiceTier::TaggedSymbol
                    ),
                  session_id: T.nilable(String),
                  slack_channel_id: T.nilable(String),
                  speed:
                    T.nilable(
                      Anthropic::Beta::Organization::BetaAnalyticsSpeed::TaggedSymbol
                    ),
                  user_profile_id: T.nilable(String),
                  workspace_id: T.nilable(String)
                }
              )
            end
            def to_hash
            end
          end
        end
      end
    end
  end
end
