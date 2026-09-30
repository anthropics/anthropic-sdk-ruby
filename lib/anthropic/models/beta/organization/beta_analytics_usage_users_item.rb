# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsUsageUsersItem < Anthropic::Internal::Type::BaseModel
          # @!attribute actor
          #   The user this row's usage or cost is attributed to. Always a `user_actor`.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsUserActor]
          required :actor, -> { Anthropic::Beta::Organization::BetaAnalyticsUserActor }

          # @!attribute cache_creation
          #   The number of input tokens for cache creation.
          #
          #   @return [Anthropic::Models::Beta::BetaCacheCreation]
          required :cache_creation, -> { Anthropic::Beta::BetaCacheCreation }

          # @!attribute cache_read_input_tokens
          #   The number of input tokens read from the cache.
          #
          #   @return [Integer]
          required :cache_read_input_tokens, Integer

          # @!attribute claude_tag_category
          #   Claude Tag (Claude in Slack) spend category: `engaged` (a person addressed
          #   Claude in a channel or thread), `proactive` (Claude responded without being
          #   addressed), `scheduled` (a scheduled routine ran), `monitoring` (Claude watching
          #   a channel it was asked to monitor), or `dm` (direct messages with Claude).
          #   Populated only when `claude_tag_category` is in `group_by[]`; null for usage
          #   that is not Claude Tag. Direct-message usage is billed to the individual user
          #   and is reported under that user's product, not under `claude-tag`. New
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

          # @!attribute ending_at
          #   End of the row's UTC time bucket (exclusive), as an RFC 3339 timestamp; equal to
          #   `starting_at` plus one `bucket_width`. Null unless `bucket_width` is set.
          #
          #   @return [Time, nil]
          required :ending_at, Time, nil?: true

          # @!attribute inference_geo
          #   Inference region of the usage or cost. Null unless `inference_geo` is in
          #   `group_by[]`; it can also be null on grouped rows where the region is not set
          #   (the rows that `inference_geos[]=not_available` matches).
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsUsageUsersItem::InferenceGeo, nil]
          required :inference_geo,
                   enum: -> { Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem::InferenceGeo },
                   nil?: true

          # @!attribute model
          #   Model that produced the usage or cost, as a model name in the form the
          #   `models[]` filter accepts (for example, `claude-opus-5`). Null unless `model` is
          #   in `group_by[]`; it can also be null on grouped rows whose usage or cost is not
          #   attributed to a specific model, such as code execution.
          #
          #   @return [String, nil]
          required :model, String, nil?: true

          # @!attribute output_tokens
          #   The number of output tokens generated.
          #
          #   @return [Integer]
          required :output_tokens, Integer

          # @!attribute product
          #   Product surface that produced the usage or cost. Null unless product is in
          #   `group_by[]`; it can also be null on grouped rows whose usage cannot be
          #   attributed to a known surface. Values include `chat`, `claude_code`, `cowork`,
          #   `office_agent`, `claude_in_chrome`, `claude_design`, and `claude-tag`.
          #   `claude-tag` is Claude Tag, the Claude product in Slack. Some unattributed usage
          #   is reported as "other".
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

          # @!attribute requests
          #   Number of API requests in this row's scope. For sandbox / code-execution events,
          #   this counts execution spans rather than HTTP requests (these rows surface with
          #   `product: null`).
          #
          #   @return [Integer, nil]
          required :requests, Integer, nil?: true

          # @!attribute server_tool_use
          #   Server-side tool usage metrics.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsServerToolUse]
          required :server_tool_use, -> { Anthropic::Beta::Organization::BetaAnalyticsServerToolUse }

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
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsUsageUsersItem::Speed, nil]
          required :speed,
                   enum: -> { Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem::Speed },
                   nil?: true

          # @!attribute starting_at
          #   Start of the row's UTC time bucket (inclusive), as an RFC 3339 timestamp. Null
          #   unless `bucket_width` is set; without `bucket_width`, each row aggregates the
          #   full requested range.
          #
          #   @return [Time, nil]
          required :starting_at, Time, nil?: true

          # @!attribute total_tokens
          #   Total token count across all token types. This is the value the default
          #   `order_by` (`total_tokens`) sorts on.
          #
          #   @return [Integer]
          required :total_tokens, Integer

          # @!attribute uncached_input_tokens
          #   The number of uncached input tokens processed.
          #
          #   @return [Integer]
          required :uncached_input_tokens, Integer

          # @!method initialize(actor:, cache_creation:, cache_read_input_tokens:, claude_tag_category:, claude_tag_user_id:, context_window:, ending_at:, inference_geo:, model:, output_tokens:, product:, rbac_group_id:, requests:, server_tool_use:, slack_channel_id:, speed:, starting_at:, total_tokens:, uncached_input_tokens:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsUsageUsersItem} for more
          #   details.
          #
          #   @param actor [Anthropic::Models::Beta::Organization::BetaAnalyticsUserActor] The user this row's usage or cost is attributed to. Always a `user_actor`.
          #
          #   @param cache_creation [Anthropic::Models::Beta::BetaCacheCreation] The number of input tokens for cache creation.
          #
          #   @param cache_read_input_tokens [Integer] The number of input tokens read from the cache.
          #
          #   @param claude_tag_category [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsClaudeTagCategory, nil] Claude Tag (Claude in Slack) spend category: `engaged` (a person addressed Claud
          #
          #   @param claude_tag_user_id [String, nil] Slack user ID (for example `U0123ABCDEF`) of the member the Claude Tag (Claude i
          #
          #   @param context_window [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsContextWindow, nil] Context-window pricing tier of the usage or cost. Null unless `context_window` i
          #
          #   @param ending_at [Time, nil] End of the row's UTC time bucket (exclusive), as an RFC 3339 timestamp; equal to
          #
          #   @param inference_geo [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsUsageUsersItem::InferenceGeo, nil] Inference region of the usage or cost. Null unless `inference_geo` is in
          #   `group\_
          #
          #   @param model [String, nil] Model that produced the usage or cost, as a model name in the form the `models[]
          #
          #   @param output_tokens [Integer] The number of output tokens generated.
          #
          #   @param product [String, nil] Product surface that produced the usage or cost. Null unless product is in `grou
          #
          #   @param rbac_group_id [String, nil] RBAC group (team) the usage is attributed to, in the public tagged `rbac*group*.
          #
          #   @param requests [Integer, nil] Number of API requests in this row's scope. For sandbox / code-execution events,
          #
          #   @param server_tool_use [Anthropic::Models::Beta::Organization::BetaAnalyticsServerToolUse] Server-side tool usage metrics.
          #
          #   @param slack_channel_id [String, nil] Slack channel the usage originated from. Populated only when `slack_channel_id`
          #
          #   @param speed [Symbol, Anthropic::Models::Beta::Organization::BetaAnalyticsUsageUsersItem::Speed, nil] Inference speed mode of the usage or cost: `fast` or `standard`. Null unless `sp
          #
          #   @param starting_at [Time, nil] Start of the row's UTC time bucket (inclusive), as an RFC 3339 timestamp. Null u
          #
          #   @param total_tokens [Integer] Total token count across all token types. This is the value the default `order_b
          #
          #   @param uncached_input_tokens [Integer] The number of uncached input tokens processed.

          # Inference region of the usage or cost. Null unless `inference_geo` is in
          # `group_by[]`; it can also be null on grouped rows where the region is not set
          # (the rows that `inference_geos[]=not_available` matches).
          #
          # @see Anthropic::Models::Beta::Organization::BetaAnalyticsUsageUsersItem#inference_geo
          module InferenceGeo
            extend Anthropic::Internal::Type::Enum

            GLOBAL = :global
            US = :us

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Inference speed mode of the usage or cost: `fast` or `standard`. Null unless
          # `speed` is in `group_by[]`.
          #
          # @see Anthropic::Models::Beta::Organization::BetaAnalyticsUsageUsersItem#speed
          module Speed
            extend Anthropic::Internal::Type::Enum

            FAST = :fast
            STANDARD = :standard

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
