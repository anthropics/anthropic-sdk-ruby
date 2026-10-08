# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsConnectorActivity < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsConnectorActivity,
                Anthropic::Internal::AnyHash
              )
            end

          # Claude.ai activity metrics for a single connector on a given day.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsConnectorChatMetrics
            )
          end
          attr_reader :chat_metrics

          sig do
            params(
              chat_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsConnectorChatMetrics::OrHash
            ).void
          end
          attr_writer :chat_metrics

          # Claude Code activity metrics for a single connector on a given day.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsConnectorClaudeCodeMetrics
            )
          end
          attr_reader :claude_code_metrics

          sig do
            params(
              claude_code_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsConnectorClaudeCodeMetrics::OrHash
            ).void
          end
          attr_writer :claude_code_metrics

          # Name of the connector. Some rows carry an opaque connector id here instead of a
          # readable name; `connector_display_name` holds the resolved name for those rows.
          sig { returns(String) }
          attr_accessor :connector_name

          # Cowork activity metrics for a single connector on a given day.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsConnectorCoworkMetrics
            )
          end
          attr_reader :cowork_metrics

          sig do
            params(
              cowork_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsConnectorCoworkMetrics::OrHash
            ).void
          end
          attr_writer :cowork_metrics

          # Number of distinct users who used the connector on the requested day, or, in
          # date-range mode, over the requested window — recomputed as an exact distinct
          # count over the window's per-member daily rows, never a sum of per-day values.
          sig { returns(Integer) }
          attr_accessor :distinct_user_count

          # Office Agent activity metrics for a single connector on a given day, broken out
          # by Office product.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeMetrics
            )
          end
          attr_reader :office_metrics

          sig do
            params(
              office_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeMetrics::OrHash
            ).void
          end
          attr_writer :office_metrics

          # Connector use recorded while members had Chat and Cowork unified (Cowork's
          # features inside claude.ai chat) turned on, split into chat conversations and
          # Cowork sessions. A count is null in date-range mode where it cannot be computed.
          # Omitted from the response on deployments that do not offer Chat and Cowork
          # unified.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics
              )
            )
          end
          attr_reader :chat_cowork_unified_metrics

          sig do
            params(
              chat_cowork_unified_metrics:
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics::OrHash
                )
            ).void
          end
          attr_writer :chat_cowork_unified_metrics

          # Human-readable display name for rows whose `connector_name` is an opaque
          # connector id rather than a readable name, resolved at request time from the
          # organization's connectors (including connectors that have since been removed).
          # `connector_name` remains the row's stable key for sorting and pagination, and
          # `filter[]=connector_name:{value}` also matches these rows by display name.
          # Display names are not unique, and the same connector's claude.ai usage can
          # appear under a separate row with a readable `connector_name`. Null when
          # `connector_name` is already a readable name, when the id cannot be resolved to
          # one of the organization's connectors, or when display-name resolution is not
          # enabled for this organization.
          sig { returns(T.nilable(String)) }
          attr_accessor :connector_display_name

          # Number of distinct users whose use of this connector on the requested day ran on
          # their own individual credential, connected through their own consent flow.
          # Companion bucket to `managed_auth_distinct_user_count`, which carries the
          # measurement, attribution, and null rules. Users whose requests used no stored
          # credential count in neither bucket.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :individual_auth_distinct_user_count

          # Number of distinct users whose use of this connector on the requested day ran on
          # Enterprise Managed Auth (an organization-managed credential provisioned through
          # the organization's identity provider), read from the token record each request
          # used. Null, never 0, when managed-auth reporting is not enabled for the
          # organization, the value cannot be attributed to the row, no credentialed
          # requests and no managed-token mint events (a managed credential being
          # provisioned for a user's use of the connector) were observed that day, or the
          # day predates 2026-07-01, the first day the backing data exists (forward-only
          # data, no backfill). When credentialed requests or mint events were observed and
          # attributed, both managed-auth fields populate, reporting 0 for a bucket with no
          # users; the two counts are independent, not a partition — a user whose requests
          # that day used both kinds of credential counts in both. Mint events carry user
          # but not surface attribution, so they count as observed auth activity on
          # `user_id` and `rbac_group_id` cuts — attributed to the user the credential was
          # provisioned for — but never on a cut that references `product` (group or
          # filter). Date-range rollup mode (`starting_date`/`ending_date`) computes both
          # fields exactly over the window — distinct users with at least one qualifying day
          # — when the whole window starts on or after 2026-07-01, with the null-versus-0
          # and mint-event rules applying with the window in place of the day; a range
          # starting earlier reports every managed-auth field as null, never a
          # partial-window value.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :managed_auth_distinct_user_count

          # Product that produced this row's activity: one of `chat`, `claude_code`,
          # `cowork`, `office_agent`, or `chat_cowork_unified` (Chat and Cowork unified).
          # These are the canonical Cost & Usage product names; an `office_agent` row's
          # per-surface breakdown is in its `office_metrics`. On `/plugins` only `cowork`,
          # `claude_code` and `chat_cowork_unified` occur (the only surfaces with plugin
          # attribution); on `/artifacts` only `chat`, `claude_code`, `cowork` and
          # `chat_cowork_unified` occur (the surfaces that create artifacts);
          # `/apps/chat/projects` does not support the product dimension (a `product` entry
          # in `group_by[]` or `filter[]` there is rejected). Present only when the request
          # grouped by `product`.
          sig { returns(T.nilable(String)) }
          attr_accessor :product

          # Tagged RBAC group identifier (`rbac_group_...`), matching the spend-limits API
          # spelling. Present only when the request grouped by `rbac_group_id`.
          sig { returns(T.nilable(String)) }
          attr_accessor :rbac_group_id

          # Resolved RBAC group display name, alongside `rbac_group_id` when name resolution
          # is available. Null if the group has been deleted or its name could not be
          # resolved; `rbac_group_id` remains the stable key.
          sig { returns(T.nilable(String)) }
          attr_accessor :rbac_group_name

          # Number of connector tool calls on the requested day whose trusted read-only
          # annotation marked them read-only. Call count, not distinct users. Every call
          # recorded on a classified surface lands in exactly one of `read_call_count`,
          # `write_call_count`, or `unclassified_call_count`, so the three sum to the day's
          # classified calls. Classification is forward-only per surface: claude.ai from
          # 2026-06-01, Claude Code from 2026-05-30, Claude in Office from 2026-05-29,
          # Cowork from 2026-06-02 (Cowork clients predating annotation forwarding land in
          # `unclassified_call_count`). Null, never 0, when the value cannot be stated: the
          # read/write split is not enabled for this organization, or the day predates
          # 2026-05-29. For a date-range total, sum the per-day values, but treat a window
          # that extends before 2026-05-29 as null rather than summing only its covered days
          # — date-range rollup mode (`starting_date`/`ending_date`) applies both rules
          # server-side.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :read_call_count

          # Number of connector tool calls on the requested day with no trusted read-only
          # annotation — the annotation is optional in the MCP spec and is discarded when
          # connector access controls are active, so unclassified calls are common. This
          # field shows how much of the day's classified activity the read/write split
          # actually covers. Call count, not distinct users. One of the three
          # call-classification buckets; see `read_call_count` for the per-surface
          # data-start dates, null conditions, and date-range guidance.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :unclassified_call_count

          # Tagged user identifier (e.g. `user_...`). Present only when the request grouped
          # by `user_id`.
          sig { returns(T.nilable(String)) }
          attr_accessor :user_id

          # Number of connector tool calls on the requested day whose trusted read-only
          # annotation marked them not read-only. Call count, not distinct users. One of the
          # three call-classification buckets; see `read_call_count` for the per-surface
          # data-start dates, null conditions, and date-range guidance.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :write_call_count

          # Per-connector activity data for a given day.
          sig do
            params(
              chat_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsConnectorChatMetrics::OrHash,
              claude_code_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsConnectorClaudeCodeMetrics::OrHash,
              connector_name: String,
              cowork_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsConnectorCoworkMetrics::OrHash,
              distinct_user_count: Integer,
              office_metrics:
                Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeMetrics::OrHash,
              chat_cowork_unified_metrics:
                T.nilable(
                  Anthropic::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics::OrHash
                ),
              connector_display_name: T.nilable(String),
              individual_auth_distinct_user_count: T.nilable(Integer),
              managed_auth_distinct_user_count: T.nilable(Integer),
              product: T.nilable(String),
              rbac_group_id: T.nilable(String),
              rbac_group_name: T.nilable(String),
              read_call_count: T.nilable(Integer),
              unclassified_call_count: T.nilable(Integer),
              user_id: T.nilable(String),
              write_call_count: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(
            # Claude.ai activity metrics for a single connector on a given day.
            chat_metrics:,
            # Claude Code activity metrics for a single connector on a given day.
            claude_code_metrics:,
            # Name of the connector. Some rows carry an opaque connector id here instead of a
            # readable name; `connector_display_name` holds the resolved name for those rows.
            connector_name:,
            # Cowork activity metrics for a single connector on a given day.
            cowork_metrics:,
            # Number of distinct users who used the connector on the requested day, or, in
            # date-range mode, over the requested window — recomputed as an exact distinct
            # count over the window's per-member daily rows, never a sum of per-day values.
            distinct_user_count:,
            # Office Agent activity metrics for a single connector on a given day, broken out
            # by Office product.
            office_metrics:,
            # Connector use recorded while members had Chat and Cowork unified (Cowork's
            # features inside claude.ai chat) turned on, split into chat conversations and
            # Cowork sessions. A count is null in date-range mode where it cannot be computed.
            # Omitted from the response on deployments that do not offer Chat and Cowork
            # unified.
            chat_cowork_unified_metrics: nil,
            # Human-readable display name for rows whose `connector_name` is an opaque
            # connector id rather than a readable name, resolved at request time from the
            # organization's connectors (including connectors that have since been removed).
            # `connector_name` remains the row's stable key for sorting and pagination, and
            # `filter[]=connector_name:{value}` also matches these rows by display name.
            # Display names are not unique, and the same connector's claude.ai usage can
            # appear under a separate row with a readable `connector_name`. Null when
            # `connector_name` is already a readable name, when the id cannot be resolved to
            # one of the organization's connectors, or when display-name resolution is not
            # enabled for this organization.
            connector_display_name: nil,
            # Number of distinct users whose use of this connector on the requested day ran on
            # their own individual credential, connected through their own consent flow.
            # Companion bucket to `managed_auth_distinct_user_count`, which carries the
            # measurement, attribution, and null rules. Users whose requests used no stored
            # credential count in neither bucket.
            individual_auth_distinct_user_count: nil,
            # Number of distinct users whose use of this connector on the requested day ran on
            # Enterprise Managed Auth (an organization-managed credential provisioned through
            # the organization's identity provider), read from the token record each request
            # used. Null, never 0, when managed-auth reporting is not enabled for the
            # organization, the value cannot be attributed to the row, no credentialed
            # requests and no managed-token mint events (a managed credential being
            # provisioned for a user's use of the connector) were observed that day, or the
            # day predates 2026-07-01, the first day the backing data exists (forward-only
            # data, no backfill). When credentialed requests or mint events were observed and
            # attributed, both managed-auth fields populate, reporting 0 for a bucket with no
            # users; the two counts are independent, not a partition — a user whose requests
            # that day used both kinds of credential counts in both. Mint events carry user
            # but not surface attribution, so they count as observed auth activity on
            # `user_id` and `rbac_group_id` cuts — attributed to the user the credential was
            # provisioned for — but never on a cut that references `product` (group or
            # filter). Date-range rollup mode (`starting_date`/`ending_date`) computes both
            # fields exactly over the window — distinct users with at least one qualifying day
            # — when the whole window starts on or after 2026-07-01, with the null-versus-0
            # and mint-event rules applying with the window in place of the day; a range
            # starting earlier reports every managed-auth field as null, never a
            # partial-window value.
            managed_auth_distinct_user_count: nil,
            # Product that produced this row's activity: one of `chat`, `claude_code`,
            # `cowork`, `office_agent`, or `chat_cowork_unified` (Chat and Cowork unified).
            # These are the canonical Cost & Usage product names; an `office_agent` row's
            # per-surface breakdown is in its `office_metrics`. On `/plugins` only `cowork`,
            # `claude_code` and `chat_cowork_unified` occur (the only surfaces with plugin
            # attribution); on `/artifacts` only `chat`, `claude_code`, `cowork` and
            # `chat_cowork_unified` occur (the surfaces that create artifacts);
            # `/apps/chat/projects` does not support the product dimension (a `product` entry
            # in `group_by[]` or `filter[]` there is rejected). Present only when the request
            # grouped by `product`.
            product: nil,
            # Tagged RBAC group identifier (`rbac_group_...`), matching the spend-limits API
            # spelling. Present only when the request grouped by `rbac_group_id`.
            rbac_group_id: nil,
            # Resolved RBAC group display name, alongside `rbac_group_id` when name resolution
            # is available. Null if the group has been deleted or its name could not be
            # resolved; `rbac_group_id` remains the stable key.
            rbac_group_name: nil,
            # Number of connector tool calls on the requested day whose trusted read-only
            # annotation marked them read-only. Call count, not distinct users. Every call
            # recorded on a classified surface lands in exactly one of `read_call_count`,
            # `write_call_count`, or `unclassified_call_count`, so the three sum to the day's
            # classified calls. Classification is forward-only per surface: claude.ai from
            # 2026-06-01, Claude Code from 2026-05-30, Claude in Office from 2026-05-29,
            # Cowork from 2026-06-02 (Cowork clients predating annotation forwarding land in
            # `unclassified_call_count`). Null, never 0, when the value cannot be stated: the
            # read/write split is not enabled for this organization, or the day predates
            # 2026-05-29. For a date-range total, sum the per-day values, but treat a window
            # that extends before 2026-05-29 as null rather than summing only its covered days
            # — date-range rollup mode (`starting_date`/`ending_date`) applies both rules
            # server-side.
            read_call_count: nil,
            # Number of connector tool calls on the requested day with no trusted read-only
            # annotation — the annotation is optional in the MCP spec and is discarded when
            # connector access controls are active, so unclassified calls are common. This
            # field shows how much of the day's classified activity the read/write split
            # actually covers. Call count, not distinct users. One of the three
            # call-classification buckets; see `read_call_count` for the per-surface
            # data-start dates, null conditions, and date-range guidance.
            unclassified_call_count: nil,
            # Tagged user identifier (e.g. `user_...`). Present only when the request grouped
            # by `user_id`.
            user_id: nil,
            # Number of connector tool calls on the requested day whose trusted read-only
            # annotation marked them not read-only. Call count, not distinct users. One of the
            # three call-classification buckets; see `read_call_count` for the per-surface
            # data-start dates, null conditions, and date-range guidance.
            write_call_count: nil
          )
          end

          sig do
            override.returns(
              {
                chat_metrics:
                  Anthropic::Beta::Organization::BetaAnalyticsConnectorChatMetrics,
                claude_code_metrics:
                  Anthropic::Beta::Organization::BetaAnalyticsConnectorClaudeCodeMetrics,
                connector_name: String,
                cowork_metrics:
                  Anthropic::Beta::Organization::BetaAnalyticsConnectorCoworkMetrics,
                distinct_user_count: Integer,
                office_metrics:
                  Anthropic::Beta::Organization::BetaAnalyticsConnectorOfficeMetrics,
                chat_cowork_unified_metrics:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics
                  ),
                connector_display_name: T.nilable(String),
                individual_auth_distinct_user_count: T.nilable(Integer),
                managed_auth_distinct_user_count: T.nilable(Integer),
                product: T.nilable(String),
                rbac_group_id: T.nilable(String),
                rbac_group_name: T.nilable(String),
                read_call_count: T.nilable(Integer),
                unclassified_call_count: T.nilable(Integer),
                user_id: T.nilable(String),
                write_call_count: T.nilable(Integer)
              }
            )
          end
          def to_hash
          end

          class ChatCoworkUnifiedMetrics < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::BetaAnalyticsConnectorActivity::ChatCoworkUnifiedMetrics,
                  Anthropic::Internal::AnyHash
                )
              end

            # A connector's use in chat conversations recorded while members had Chat and
            # Cowork unified turned on.
            sig do
              returns(
                Anthropic::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedChatMetrics
              )
            end
            attr_reader :chat

            sig do
              params(
                chat:
                  Anthropic::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedChatMetrics::OrHash
              ).void
            end
            attr_writer :chat

            # A connector's use in Cowork sessions recorded while members had Chat and Cowork
            # unified turned on.
            sig do
              returns(
                Anthropic::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedSessionsMetrics
              )
            end
            attr_reader :sessions

            sig do
              params(
                sessions:
                  Anthropic::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedSessionsMetrics::OrHash
              ).void
            end
            attr_writer :sessions

            # Connector use recorded while members had Chat and Cowork unified (Cowork's
            # features inside claude.ai chat) turned on, split into chat conversations and
            # Cowork sessions. A count is null in date-range mode where it cannot be computed.
            # Omitted from the response on deployments that do not offer Chat and Cowork
            # unified.
            sig do
              params(
                chat:
                  Anthropic::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedChatMetrics::OrHash,
                sessions:
                  Anthropic::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedSessionsMetrics::OrHash
              ).returns(T.attached_class)
            end
            def self.new(
              # A connector's use in chat conversations recorded while members had Chat and
              # Cowork unified turned on.
              chat:,
              # A connector's use in Cowork sessions recorded while members had Chat and Cowork
              # unified turned on.
              sessions:
            )
            end

            sig do
              override.returns(
                {
                  chat:
                    Anthropic::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedChatMetrics,
                  sessions:
                    Anthropic::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedSessionsMetrics
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
