# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsUsageUsersItem < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem,
                Anthropic::Internal::AnyHash
              )
            end

          # The user this row's usage or cost is attributed to. Always a `user_actor`.
          sig { returns(Anthropic::Beta::Organization::BetaAnalyticsUserActor) }
          attr_reader :actor

          sig do
            params(
              actor:
                Anthropic::Beta::Organization::BetaAnalyticsUserActor::OrHash
            ).void
          end
          attr_writer :actor

          # The number of input tokens for cache creation.
          sig { returns(Anthropic::Beta::BetaCacheCreation) }
          attr_reader :cache_creation

          sig do
            params(
              cache_creation: Anthropic::Beta::BetaCacheCreation::OrHash
            ).void
          end
          attr_writer :cache_creation

          # The number of input tokens read from the cache.
          sig { returns(Integer) }
          attr_accessor :cache_read_input_tokens

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

          # End of the row's UTC time bucket (exclusive), as an RFC 3339 timestamp; equal to
          # `starting_at` plus one `bucket_width`. Null unless `bucket_width` is set.
          sig { returns(T.nilable(Time)) }
          attr_accessor :ending_at

          # Inference region of the usage or cost. Null unless `inference_geo` is in
          # `group_by[]`; it can also be null on grouped rows where the region is not set
          # (the rows that `inference_geos[]=not_available` matches).
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem::InferenceGeo::TaggedSymbol
              )
            )
          end
          attr_accessor :inference_geo

          # Model that produced the usage or cost, as a model name in the form the
          # `models[]` filter accepts (for example, `claude-opus-5`). Null unless `model` is
          # in `group_by[]`; it can also be null on grouped rows whose usage or cost is not
          # attributed to a specific model, such as code execution.
          sig { returns(T.nilable(String)) }
          attr_accessor :model

          # The number of output tokens generated.
          sig { returns(Integer) }
          attr_accessor :output_tokens

          # Product surface that produced the usage or cost. Null unless product is in
          # `group_by[]`; it can also be null on grouped rows whose usage cannot be
          # attributed to a known surface. Values include `chat`, `claude_code`, `cowork`,
          # `office_agent`, `claude_in_chrome`, `claude_design`, `claude-tag`, and
          # `chat_cowork_unified`. `claude-tag` is Claude Tag, the Claude product in Slack.
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

          # Number of API requests in this row's scope. For sandbox / code-execution events,
          # this counts execution spans rather than HTTP requests (these rows surface with
          # `product: null`).
          sig { returns(T.nilable(Integer)) }
          attr_accessor :requests

          # Server-side tool usage metrics.
          sig do
            returns(Anthropic::Beta::Organization::BetaAnalyticsServerToolUse)
          end
          attr_reader :server_tool_use

          sig do
            params(
              server_tool_use:
                Anthropic::Beta::Organization::BetaAnalyticsServerToolUse::OrHash
            ).void
          end
          attr_writer :server_tool_use

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
                Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem::Speed::TaggedSymbol
              )
            )
          end
          attr_accessor :speed

          # Start of the row's UTC time bucket (inclusive), as an RFC 3339 timestamp. Null
          # unless `bucket_width` is set; without `bucket_width`, each row aggregates the
          # full requested range.
          sig { returns(T.nilable(Time)) }
          attr_accessor :starting_at

          # Total token count across all token types. This is the value the default
          # `order_by` (`total_tokens`) sorts on.
          sig { returns(Integer) }
          attr_accessor :total_tokens

          # The number of uncached input tokens processed.
          sig { returns(Integer) }
          attr_accessor :uncached_input_tokens

          sig do
            params(
              actor:
                Anthropic::Beta::Organization::BetaAnalyticsUserActor::OrHash,
              cache_creation: Anthropic::Beta::BetaCacheCreation::OrHash,
              cache_read_input_tokens: Integer,
              claude_tag_category:
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory::OrSymbol
                ),
              claude_tag_user_id: T.nilable(String),
              context_window:
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsContextWindow::OrSymbol
                ),
              ending_at: T.nilable(Time),
              inference_geo:
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem::InferenceGeo::OrSymbol
                ),
              model: T.nilable(String),
              output_tokens: Integer,
              product: T.nilable(String),
              rbac_group_id: T.nilable(String),
              requests: T.nilable(Integer),
              server_tool_use:
                Anthropic::Beta::Organization::BetaAnalyticsServerToolUse::OrHash,
              slack_channel_id: T.nilable(String),
              speed:
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem::Speed::OrSymbol
                ),
              starting_at: T.nilable(Time),
              total_tokens: Integer,
              uncached_input_tokens: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # The user this row's usage or cost is attributed to. Always a `user_actor`.
            actor:,
            # The number of input tokens for cache creation.
            cache_creation:,
            # The number of input tokens read from the cache.
            cache_read_input_tokens:,
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
            # End of the row's UTC time bucket (exclusive), as an RFC 3339 timestamp; equal to
            # `starting_at` plus one `bucket_width`. Null unless `bucket_width` is set.
            ending_at:,
            # Inference region of the usage or cost. Null unless `inference_geo` is in
            # `group_by[]`; it can also be null on grouped rows where the region is not set
            # (the rows that `inference_geos[]=not_available` matches).
            inference_geo:,
            # Model that produced the usage or cost, as a model name in the form the
            # `models[]` filter accepts (for example, `claude-opus-5`). Null unless `model` is
            # in `group_by[]`; it can also be null on grouped rows whose usage or cost is not
            # attributed to a specific model, such as code execution.
            model:,
            # The number of output tokens generated.
            output_tokens:,
            # Product surface that produced the usage or cost. Null unless product is in
            # `group_by[]`; it can also be null on grouped rows whose usage cannot be
            # attributed to a known surface. Values include `chat`, `claude_code`, `cowork`,
            # `office_agent`, `claude_in_chrome`, `claude_design`, `claude-tag`, and
            # `chat_cowork_unified`. `claude-tag` is Claude Tag, the Claude product in Slack.
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
            # Number of API requests in this row's scope. For sandbox / code-execution events,
            # this counts execution spans rather than HTTP requests (these rows surface with
            # `product: null`).
            requests:,
            # Server-side tool usage metrics.
            server_tool_use:,
            # Slack channel the usage originated from. Populated only when `slack_channel_id`
            # is in `group_by[]`; null for usage outside Slack (and for rows recorded before
            # channel attribution was enabled).
            slack_channel_id:,
            # Inference speed mode of the usage or cost: `fast` or `standard`. Null unless
            # `speed` is in `group_by[]`.
            speed:,
            # Start of the row's UTC time bucket (inclusive), as an RFC 3339 timestamp. Null
            # unless `bucket_width` is set; without `bucket_width`, each row aggregates the
            # full requested range.
            starting_at:,
            # Total token count across all token types. This is the value the default
            # `order_by` (`total_tokens`) sorts on.
            total_tokens:,
            # The number of uncached input tokens processed.
            uncached_input_tokens:
          )
          end

          sig do
            override.returns(
              {
                actor: Anthropic::Beta::Organization::BetaAnalyticsUserActor,
                cache_creation: Anthropic::Beta::BetaCacheCreation,
                cache_read_input_tokens: Integer,
                claude_tag_category:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsClaudeTagCategory::TaggedSymbol
                  ),
                claude_tag_user_id: T.nilable(String),
                context_window:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsContextWindow::TaggedSymbol
                  ),
                ending_at: T.nilable(Time),
                inference_geo:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem::InferenceGeo::TaggedSymbol
                  ),
                model: T.nilable(String),
                output_tokens: Integer,
                product: T.nilable(String),
                rbac_group_id: T.nilable(String),
                requests: T.nilable(Integer),
                server_tool_use:
                  Anthropic::Beta::Organization::BetaAnalyticsServerToolUse,
                slack_channel_id: T.nilable(String),
                speed:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem::Speed::TaggedSymbol
                  ),
                starting_at: T.nilable(Time),
                total_tokens: Integer,
                uncached_input_tokens: Integer
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
                  Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem::InferenceGeo
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            GLOBAL =
              T.let(
                :global,
                Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem::InferenceGeo::TaggedSymbol
              )
            US =
              T.let(
                :us,
                Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem::InferenceGeo::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem::InferenceGeo::TaggedSymbol
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
                  Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem::Speed
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FAST =
              T.let(
                :fast,
                Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem::Speed::TaggedSymbol
              )
            STANDARD =
              T.let(
                :standard,
                Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem::Speed::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaAnalyticsUsageUsersItem::Speed::TaggedSymbol
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
