# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsSkillActivity < Anthropic::Internal::Type::BaseModel
          # @!attribute chat_metrics
          #   Claude.ai activity metrics for a single skill on a given day.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillChatMetrics]
          required :chat_metrics, -> { Anthropic::Beta::Organization::BetaAnalyticsSkillChatMetrics }

          # @!attribute claude_code_metrics
          #   Claude Code activity metrics for a single skill on a given day.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillClaudeCodeMetrics]
          required :claude_code_metrics, -> { Anthropic::Beta::Organization::BetaAnalyticsSkillClaudeCodeMetrics }

          # @!attribute cowork_metrics
          #   Cowork activity metrics for a single skill on a given day.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillCoworkMetrics]
          required :cowork_metrics, -> { Anthropic::Beta::Organization::BetaAnalyticsSkillCoworkMetrics }

          # @!attribute distinct_user_count
          #   Number of distinct users who used the skill on the requested day, or, in
          #   date-range mode, over the requested window — recomputed as an exact distinct
          #   count over the window's per-member daily rows, never a sum of per-day values. A
          #   skill counts as used only when it is explicitly activated — the model (or the
          #   user, via the skill's slash command) invokes it, reading its instructions into
          #   context as part of that activation. Skills that are merely installed or listed
          #   as available, or whose content reaches the context without an activation
          #   (preloaded, hook-injected, or read as a plain file), are not counted.
          #
          #   @return [Integer]
          required :distinct_user_count, Integer

          # @!attribute office_metrics
          #   Office Agent activity metrics for a single skill on a given day, broken out by
          #   Office product.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillOfficeMetrics]
          required :office_metrics, -> { Anthropic::Beta::Organization::BetaAnalyticsSkillOfficeMetrics }

          # @!attribute skill_name
          #   Name of the skill
          #
          #   @return [String]
          required :skill_name, String

          # @!attribute attributed_list_price
          #   List-price (rate-card) value of the member requests attributed to this skill, as
          #   a decimal string in the minor unit of `currency` (cents for USD), from Claude
          #   Code, Cowork, and Office Agent request-level attribution — the value of requests
          #   that involved the skill, not the skill's incremental cost. Unlike
          #   `estimated_overage_spend` this reflects usage value regardless of how it was
          #   funded — seat-covered usage counts — but it is undiscounted and does not tie to
          #   billed spend or the organization's spend reporting. claude.ai chat usage carries
          #   no request-level attribution and contributes nothing: the field is null on
          #   `chat` product rows and on `office_agent` product cuts dated before 2026-06-18
          #   (the Office Agent attribution data-start), and on ungrouped rows it covers the
          #   Claude Code + Cowork + Office Agent share only (null when no attributable usage
          #   exists). Also null under the same conditions as `estimated_overage_spend` (spend
          #   reporting not enabled for this organization, `office_agent` product cuts before
          #   the 2026-06-18 data-start). "0" means attributable usage existed but none was
          #   attributed to this skill. Addable across days: date-range rollup mode returns
          #   the window's sum. On `group_by[]` and `filter[]` shapes both amounts can total
          #   below the ungrouped value for the same skill over the same date or range: spend
          #   attributed to a member–skill pair with no counted usage on that day is excluded
          #   from those cuts.
          #
          #   @return [String, nil]
          optional :attributed_list_price, String, nil?: true

          # @!attribute chat_cowork_unified_metrics
          #   Skill use recorded while members had Chat and Cowork unified (Cowork's features
          #   inside claude.ai chat) turned on, split into chat conversations and Cowork
          #   sessions. A count is null in date-range mode where it cannot be computed.
          #   Omitted from the response on deployments that do not offer Chat and Cowork
          #   unified.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillActivity::ChatCoworkUnifiedMetrics, nil]
          optional :chat_cowork_unified_metrics,
                   -> { Anthropic::Beta::Organization::BetaAnalyticsSkillActivity::ChatCoworkUnifiedMetrics },
                   nil?: true

          # @!attribute currency
          #   Currency for this row's monetary fields (`estimated_overage_spend` and
          #   `attributed_list_price`), as an uppercase ISO-4217 code. Always "USD" when
          #   either amount is populated; null whenever both amounts are null.
          #
          #   @return [String, nil]
          optional :currency, String, nil?: true

          # @!attribute enable_count
          #   Distinct accounts that enabled this skill on the requested day (claude.ai only —
          #   the skill analog of plugin `install_count`). The count is org-wide: null when
          #   enable reporting is not enabled for this organization, or when the request
          #   scopes to `user_id` / `rbac_group_id` / `product` via `group_by[]` or `filter[]`
          #   (an org-wide count would be misleading on per-cut rows). A distinct count, not
          #   an event count: summing across days double-counts members who enable the skill
          #   on more than one day, so it is also null in date-range rollup mode
          #   (`starting_date`/`ending_date`).
          #
          #   @return [Integer, nil]
          optional :enable_count, Integer, nil?: true

          # @!attribute estimated_overage_spend
          #   Estimated overage spend attributed to this skill, as a decimal string in the
          #   minor unit of `currency` (cents for USD; "1250" is $12.50, fractional cents
          #   possible) — an allocation of each member's daily post-discount, pre-credit
          #   metered overage spend (the same cost basis as the organization's spend reporting
          #   and the Cost & Usage API, so per-skill figures are directly comparable; spend
          #   with no skill attribution — including any member-day without skill invocations —
          #   is not represented, so skill rows sum to at most those totals) across the skills
          #   the member used. Overage only: usage covered by included seat allowances bills
          #   nothing and allocates $0 here — see `attributed_list_price` for the
          #   funding-independent usage-value companion. Claude Code, Cowork, and Office Agent
          #   spend use request-level skill attribution; claude.ai chat spend is approximated
          #   proportionally to skill-invoking messages. An estimate, not a billing number —
          #   and the cost of the requests/messages that involved the skill, not the skill's
          #   incremental cost (the same request would still have cost something without the
          #   skill active). "0" means no overage spend was attributed; null when spend
          #   reporting is not enabled for this organization, on `office_agent` product cuts
          #   dated before 2026-06-18 (the Office Agent attribution data-start). Addable
          #   across days: date-range rollup mode (`starting_date`/`ending_date`) returns the
          #   window's sum. With `group_by[]=user_id` each row carries the user's own
          #   attributed spend. On `group_by[]` and `filter[]` shapes both amounts can total
          #   below the ungrouped value for the same skill over the same date or range: spend
          #   attributed to a member–skill pair with no counted usage on that day is excluded
          #   from those cuts.
          #
          #   @return [String, nil]
          optional :estimated_overage_spend, String, nil?: true

          # @!attribute invocation_count
          #   Total number of times this skill was invoked on the requested day (the skill
          #   analog of plugin `invocation_count`). Unlike `distinct_user_count` — which
          #   answers '# of users' — this is the true '# of uses'. A skill counts as used only
          #   when it is explicitly activated — the model (or the user, via the skill's slash
          #   command) invokes it, reading its instructions into context as part of that
          #   activation. Skills that are merely installed or listed as available, or whose
          #   content reaches the context without an activation (preloaded, hook-injected, or
          #   read as a plain file), are not counted. Null when invocation reporting is not
          #   enabled for this organization. Sum across a date range for total uses in the
          #   window — date-range rollup mode (`starting_date`/`ending_date`) returns this sum
          #   directly.
          #
          #   @return [Integer, nil]
          optional :invocation_count, Integer, nil?: true

          # @!attribute product
          #   Product that produced this row's activity: one of `chat`, `claude_code`,
          #   `cowork`, `office_agent`, or `chat_cowork_unified` (Chat and Cowork unified).
          #   These are the canonical Cost & Usage product names; an `office_agent` row's
          #   per-surface breakdown is in its `office_metrics`. On `/plugins` only `cowork`,
          #   `claude_code` and `chat_cowork_unified` occur (the only surfaces with plugin
          #   attribution); on `/artifacts` only `chat`, `claude_code`, `cowork` and
          #   `chat_cowork_unified` occur (the surfaces that create artifacts);
          #   `/apps/chat/projects` does not support the product dimension (a `product` entry
          #   in `group_by[]` or `filter[]` there is rejected). Present only when the request
          #   grouped by `product`.
          #
          #   @return [String, nil]
          optional :product, String, nil?: true

          # @!attribute rbac_group_id
          #   Tagged RBAC group identifier (`rbac_group_...`), matching the spend-limits API
          #   spelling. Present only when the request grouped by `rbac_group_id`.
          #
          #   @return [String, nil]
          optional :rbac_group_id, String, nil?: true

          # @!attribute rbac_group_name
          #   Resolved RBAC group display name, alongside `rbac_group_id` when name resolution
          #   is available. Null if the group has been deleted or its name could not be
          #   resolved; `rbac_group_id` remains the stable key.
          #
          #   @return [String, nil]
          optional :rbac_group_name, String, nil?: true

          # @!attribute share_status
          #   Skill share status (claude.ai only): one of `private`, `organization`, or
          #   `public`. Null for skills used only in Claude Code or Office (no per-skill
          #   share-status concept) and when share-status reporting is not yet available for
          #   the organization. Filterable via `filter[]=share_status:{value}`.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsSkillActivity::ShareStatus, nil]
          optional :share_status,
                   enum: -> { Anthropic::Beta::Organization::BetaAnalyticsSkillActivity::ShareStatus },
                   nil?: true

          # @!attribute skill_display_name
          #   Human-readable display name for rows whose `skill_name` is an opaque skill id
          #   (user/organization skill types and plugin-delivered skills, whose user-defined
          #   names usage reports generally withhold). Organization-shared skills and skills
          #   delivered by the organization's own plugins (its plugin marketplaces and its
          #   library) resolve; plugin skill names are shown without their 'plugin:' prefix.
          #   The literal 'unknown' bucket row gets a fixed 'Unknown skill' label. For a
          #   member's own skill (private or personal-plugin) it is null, except when the
          #   skill's owner used it from Claude Code or Cowork in the requested period: then
          #   it shows the name that client reported at the time. Apart from that, the names
          #   of members' own skills are not disclosed to analytics-key holders. Also null for
          #   Anthropic-provided plugin skills (not resolved), for an organization skill or
          #   plugin whose name can no longer be found (for example, one since deleted), when
          #   `skill_name` is already a display name, or when display-name resolution is not
          #   enabled for this organization.
          #
          #   @return [String, nil]
          optional :skill_display_name, String, nil?: true

          # @!attribute user_id
          #   Tagged user identifier (e.g. `user_...`). Present only when the request grouped
          #   by `user_id`.
          #
          #   @return [String, nil]
          optional :user_id, String, nil?: true

          # @!method initialize(chat_metrics:, claude_code_metrics:, cowork_metrics:, distinct_user_count:, office_metrics:, skill_name:, attributed_list_price: nil, chat_cowork_unified_metrics: nil, currency: nil, enable_count: nil, estimated_overage_spend: nil, invocation_count: nil, product: nil, rbac_group_id: nil, rbac_group_name: nil, share_status: nil, skill_display_name: nil, user_id: nil)
          #   Per-skill activity data for a given day.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsSkillActivity} for more
          #   details.
          #
          #   @param chat_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillChatMetrics] Claude.ai activity metrics for a single skill on a given day.
          #
          #   @param claude_code_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillClaudeCodeMetrics] Claude Code activity metrics for a single skill on a given day.
          #
          #   @param cowork_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillCoworkMetrics] Cowork activity metrics for a single skill on a given day.
          #
          #   @param distinct_user_count [Integer] Number of distinct users who used the skill on the requested day, or, in date-ra
          #
          #   @param office_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillOfficeMetrics] Office Agent activity metrics for a single skill on a given day, broken out by O
          #
          #   @param skill_name [String] Name of the skill
          #
          #   @param attributed_list_price [String, nil] List-price (rate-card) value of the member requests attributed to this skill, as
          #
          #   @param chat_cowork_unified_metrics [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillActivity::ChatCoworkUnifiedMetrics, nil] Skill use recorded while members had Chat and Cowork unified (Cowork's features
          #
          #   @param currency [String, nil] Currency for this row's monetary fields (`estimated_overage_spend` and `attribut
          #
          #   @param enable_count [Integer, nil] Distinct accounts that enabled this skill on the requested day (claude.ai only —
          #
          #   @param estimated_overage_spend [String, nil] Estimated overage spend attributed to this skill, as a decimal string in the min
          #
          #   @param invocation_count [Integer, nil] Total number of times this skill was invoked on the requested day (the skill ana
          #
          #   @param product [String, nil] Product that produced this row's activity: one of `chat`, `claude_code`, `cowork
          #
          #   @param rbac_group_id [String, nil] Tagged RBAC group identifier (`rbac_group_...`), matching the spend-limits API s
          #
          #   @param rbac_group_name [String, nil] Resolved RBAC group display name, alongside `rbac_group_id` when name resolution
          #
          #   @param share_status [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsSkillActivity::ShareStatus, nil] Skill share status (claude.ai only): one of `private`, `organization`, or `publi
          #
          #   @param skill_display_name [String, nil] Human-readable display name for rows whose `skill_name` is an opaque skill id (u
          #
          #   @param user_id [String, nil] Tagged user identifier (e.g. `user_...`). Present only when the request grouped

          # @see Anthropic::Models::Beta::Organization::BetaAnalyticsSkillActivity#chat_cowork_unified_metrics
          class ChatCoworkUnifiedMetrics < Anthropic::Internal::Type::BaseModel
            # @!attribute chat
            #   A skill's use in chat conversations recorded while members had Chat and Cowork
            #   unified turned on.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedChatMetrics]
            required :chat, -> { Anthropic::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedChatMetrics }

            # @!attribute sessions
            #   A skill's use in Cowork sessions recorded while members had Chat and Cowork
            #   unified turned on.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedSessionsMetrics]
            required :sessions,
                     -> { Anthropic::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedSessionsMetrics }

            # @!method initialize(chat:, sessions:)
            #   Skill use recorded while members had Chat and Cowork unified (Cowork's features
            #   inside claude.ai chat) turned on, split into chat conversations and Cowork
            #   sessions. A count is null in date-range mode where it cannot be computed.
            #   Omitted from the response on deployments that do not offer Chat and Cowork
            #   unified.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::BetaAnalyticsSkillActivity::ChatCoworkUnifiedMetrics}
            #   for more details.
            #
            #   @param chat [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedChatMetrics] A skill's use in chat conversations recorded while members had
            #
            #   @param sessions [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedSessionsMetrics] A skill's use in Cowork sessions recorded while members had Chat
          end

          # Skill share status (claude.ai only): one of `private`, `organization`, or
          # `public`. Null for skills used only in Claude Code or Office (no per-skill
          # share-status concept) and when share-status reporting is not yet available for
          # the organization. Filterable via `filter[]=share_status:{value}`.
          #
          # @see Anthropic::Models::Beta::Organization::BetaAnalyticsSkillActivity#share_status
          module ShareStatus
            extend Anthropic::Internal::Type::Enum

            ORGANIZATION = :organization
            PRIVATE = :private
            PUBLIC = :public

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
