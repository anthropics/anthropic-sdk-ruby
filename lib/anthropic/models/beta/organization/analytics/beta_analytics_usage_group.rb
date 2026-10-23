# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          class BetaAnalyticsUsageGroup < Anthropic::Internal::Type::BaseModel
            # @!attribute actor
            #   The identity the usage is attributed to: the user if one is attributed, else the
            #   service account, else the federated (cloud-platform) identity, else the API key.
            #   Populated only when `actor` is in `group_by[]`; null for usage with no
            #   attributable identity, and for users' and federated identities' usage when the
            #   reader is a member who can see only some workspaces. Distinct identities the
            #   server cannot render also read null, each as its own row.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsReportUserActor, Anthropic::Models::Beta::Organization::BetaAnalyticsServiceAccountActor, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActor, Anthropic::Models::Beta::Organization::BetaAnalyticsAPIActor, nil]
            required :actor, union: -> { Anthropic::Beta::Organization::BetaAnalyticsActor }, nil?: true

            # @!attribute actor_type
            #   Kind of identity the usage is attributed to; matches `actor.type` when `actor`
            #   is set. Populated only when `actor_type` is in `group_by[]`.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsActorType, nil]
            required :actor_type,
                     enum: -> {
                       Anthropic::Beta::Organization::BetaAnalyticsActorType
                     },
                     nil?: true

            # @!attribute agent_id
            #   Claude Managed Agents agent whose session incurred the usage. Populated only
            #   when `agent_id` is in `group_by[]`; null for usage outside a managed session.
            #
            #   @return [String, nil]
            required :agent_id, String, nil?: true

            # @!attribute api_key_id
            #   API key that authenticated the requests, as a tagged API key ID, whichever
            #   identity `actor` resolves to. Populated only when `api_key_id` is in
            #   `group_by[]`; null for usage not authenticated by an API key.
            #
            #   @return [String, nil]
            required :api_key_id, String, nil?: true

            # @!attribute claude_tag_category
            #   Claude Tag (Claude in Slack) spend category: `engaged` (a person addressed
            #   Claude in a channel or thread), `proactive` (Claude responded without being
            #   addressed), `scheduled` (a scheduled routine ran), `monitoring` (Claude watching
            #   a channel it was asked to monitor), or `dm` (direct messages with Claude).
            #   Populated only when `claude_tag_category` is in `group_by[]`; null for usage
            #   that is not Claude Tag. Direct-message usage is billed to the individual user
            #   and is reported under that user's product, not under `claude_tag`. New
            #   categories may be added over time.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsClaudeTagCategory, nil]
            required :claude_tag_category,
                     enum: -> { Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory },
                     nil?: true

            # @!attribute claude_tag_user_id
            #   Slack user ID (for example `U0123ABCDEF`) of the member the Claude Tag (Claude
            #   in Slack) usage is attributed to, not a claude.ai user ID. Populated only when
            #   `claude_tag_user_id` is in `group_by[]`; null for usage that is not Claude Tag
            #   and for Claude Tag usage that is not attributed to a single user (for example
            #   `monitoring`, and `proactive` usage Claude initiated), so per-user rows can sum
            #   to less than the Claude Tag total. Cannot be combined with
            #   `group_by[]=rbac_group_id` or the `rbac_group_ids[]` filter.
            #
            #   @return [String, nil]
            required :claude_tag_user_id, String, nil?: true

            # @!attribute context_window
            #   Context-window pricing tier of the usage or cost. Null unless `context_window`
            #   is in `group_by[]`; it can also be null on grouped rows with no context-window
            #   tier, such as code execution.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsContextWindow, nil]
            required :context_window,
                     enum: -> { Anthropic::Beta::Organization::BetaAnalyticsContextWindow },
                     nil?: true

            # @!attribute deployment_id
            #   Deployment that started the Claude Managed Agents session. Populated only when
            #   `deployment_id` is in `group_by[]`; null for usage outside a managed session and
            #   for sessions no deployment started.
            #
            #   @return [String, nil]
            required :deployment_id, String, nil?: true

            # @!attribute environment_id
            #   Claude Managed Agents environment the session ran in. Populated only when
            #   `environment_id` is in `group_by[]`; null for usage outside a managed session.
            #
            #   @return [String, nil]
            required :environment_id, String, nil?: true

            # @!attribute inference_geo
            #   Inference region of the usage or cost. Null unless `inference_geo` is in
            #   `group_by[]`; it can also be null on grouped rows where the region is not set
            #   (the rows that `inference_geos[]=not_available` matches).
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsUsageCostInferenceGeo, nil]
            required :inference_geo,
                     enum: -> { Anthropic::Beta::Organization::BetaAnalyticsUsageCostInferenceGeo },
                     nil?: true

            # @!attribute model
            #   Model that produced the usage or cost, as a model name in the form the
            #   `models[]` filter accepts (for example, `claude-opus-5-5`). Null unless `model`
            #   is in `group_by[]`; it can also be null on grouped rows whose usage or cost is
            #   not attributed to a specific model, such as code execution.
            #
            #   @return [String, nil]
            required :model, String, nil?: true

            # @!attribute product
            #   Product surface that produced the usage or cost. Null unless product is in
            #   `group_by[]`; it can also be null on grouped rows whose usage cannot be
            #   attributed to a known surface. Values include `chat`, `claude_code`, `cowork`,
            #   `office_agent`, `claude_in_chrome`, `claude_design`, `claude_tag`, and
            #   `chat_cowork_unified`. `claude_tag` is Claude Tag, the Claude product in Slack.
            #   `chat_cowork_unified` is Chat and Cowork unified, Cowork's features inside
            #   claude.ai chat: chat and Cowork usage by a member who has it turned on is
            #   reported under this value instead of `chat` or `cowork`. It is accepted as a
            #   filter only on deployments that offer Chat and Cowork unified. Some unattributed
            #   usage is reported as "other".
            #
            #   @return [String, nil]
            required :product, String, nil?: true

            # @!attribute rbac_group_id
            #   RBAC group (team) the usage is attributed to, in the public tagged
            #   `rbac_group_...` spelling — the same spelling the activity resources use for
            #   this key, so the same team has one id across resources and it round-trips as an
            #   `rbac_group_ids[]` filter value. Populated only when `rbac_group_id` is in
            #   `group_by[]`. Any-membership semantics: a user in several groups contributes
            #   their full usage to each of those groups' rows, so the named-group rows overlap
            #   and their sum can exceed the org total. A null value is the single unassigned
            #   row: users in no group on that (UTC) day. For the true org total, run the same
            #   query without `group_by[]`.
            #
            #   @return [String, nil]
            required :rbac_group_id, String, nil?: true

            # @!attribute service_tier
            #   Service tier the usage was served at. Populated only when `service_tier` is in
            #   `group_by[]`; null for usage with no service tier (for example, code execution)
            #   and for Claude Enterprise usage.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsServiceTier, nil]
            required :service_tier,
                     enum: -> {
                       Anthropic::Beta::Organization::BetaAnalyticsServiceTier
                     },
                     nil?: true

            # @!attribute session_id
            #   Claude Managed Agents session that incurred the usage. Populated only when
            #   `session_id` is in `group_by[]`; null for usage outside a managed session.
            #
            #   @return [String, nil]
            required :session_id, String, nil?: true

            # @!attribute slack_channel_id
            #   Slack channel the usage originated from. Populated only when `slack_channel_id`
            #   is in `group_by[]`; null for usage outside Slack (and for rows recorded before
            #   channel attribution was enabled).
            #
            #   @return [String, nil]
            required :slack_channel_id, String, nil?: true

            # @!attribute speed
            #   Inference speed mode of the usage or cost: `fast` or `standard`. Null unless
            #   `speed` is in `group_by[]`.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsSpeed, nil]
            required :speed, enum: -> { Anthropic::Beta::Organization::BetaAnalyticsSpeed }, nil?: true

            # @!attribute user_profile_id
            #   User profile the usage was attributed to, as a tagged `uprof_` ID. Populated
            #   only when `user_profile_id` is in `group_by[]`; null for usage that named no
            #   profile and for Claude Enterprise usage.
            #
            #   @return [String, nil]
            required :user_profile_id, String, nil?: true

            # @!attribute workspace_id
            #   Workspace the usage occurred in, as a tagged workspace ID, including the
            #   organization's default workspace. Populated only when `workspace_id` is in
            #   `group_by[]`; null for Claude Enterprise usage.
            #
            #   @return [String, nil]
            required :workspace_id, String, nil?: true

            # @!method initialize(actor:, actor_type:, agent_id:, api_key_id:, claude_tag_category:, claude_tag_user_id:, context_window:, deployment_id:, environment_id:, inference_geo:, model:, product:, rbac_group_id:, service_tier:, session_id:, slack_channel_id:, speed:, user_profile_id:, workspace_id:)
            #   The dimension values one usage row is broken out by; each is null unless its
            #   dimension is in `group_by[]`.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Analytics::BetaAnalyticsUsageGroup} for
            #   more details.
            #
            #   @param actor [Anthropic::Models::Beta::Organization::BetaAnalyticsReportUserActor, Anthropic::Models::Beta::Organization::BetaAnalyticsServiceAccountActor, Anthropic::Models::Beta::Organization::BetaAnalyticsFederatedActor, Anthropic::Models::Beta::Organization::BetaAnalyticsAPIActor, nil] The identity the usage is attributed to: the user if one is attributed, else the
            #
            #   @param actor_type [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsActorType, nil] Kind of identity the usage is attributed to; matches `actor.type` when `actor` i
            #
            #   @param agent_id [String, nil] Claude Managed Agents agent whose session incurred the usage. Populated only whe
            #
            #   @param api_key_id [String, nil] API key that authenticated the requests, as a tagged API key ID, whichever ident
            #
            #   @param claude_tag_category [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsClaudeTagCategory, nil] Claude Tag (Claude in Slack) spend category: `engaged` (a person addressed Claud
            #
            #   @param claude_tag_user_id [String, nil] Slack user ID (for example `U0123ABCDEF`) of the member the Claude Tag (Claude i
            #
            #   @param context_window [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsContextWindow, nil] Context-window pricing tier of the usage or cost. Null unless `context_window` i
            #
            #   @param deployment_id [String, nil] Deployment that started the Claude Managed Agents session. Populated only when `
            #
            #   @param environment_id [String, nil] Claude Managed Agents environment the session ran in. Populated only when `envir
            #
            #   @param inference_geo [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsUsageCostInferenceGeo, nil] Inference region of the usage or cost. Null unless `inference_geo` is in
            #   `group\_
            #
            #   @param model [String, nil] Model that produced the usage or cost, as a model name in the form the `models[]
            #
            #   @param product [String, nil] Product surface that produced the usage or cost. Null unless product is in `grou
            #
            #   @param rbac_group_id [String, nil] RBAC group (team) the usage is attributed to, in the public tagged `rbac*group*.
            #
            #   @param service_tier [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsServiceTier, nil] Service tier the usage was served at. Populated only when `service_tier` is in `
            #
            #   @param session_id [String, nil] Claude Managed Agents session that incurred the usage. Populated only when `sess
            #
            #   @param slack_channel_id [String, nil] Slack channel the usage originated from. Populated only when `slack_channel_id`
            #
            #   @param speed [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsSpeed, nil] Inference speed mode of the usage or cost: `fast` or `standard`. Null unless `sp
            #
            #   @param user_profile_id [String, nil] User profile the usage was attributed to, as a tagged `uprof_` ID. Populated onl
            #
            #   @param workspace_id [String, nil] Workspace the usage occurred in, as a tagged workspace ID, including the organiz
          end
        end
      end
    end
  end
end
