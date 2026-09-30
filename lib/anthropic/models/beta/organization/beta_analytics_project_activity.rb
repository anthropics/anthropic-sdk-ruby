# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsProjectActivity < Anthropic::Internal::Type::BaseModel
          # @!attribute distinct_user_count
          #   Number of distinct users who used the project on the requested day, or, in
          #   date-range mode, over the requested window — recomputed as an exact distinct
          #   count over the window's per-member daily rows, never a sum of per-day values.
          #
          #   @return [Integer]
          required :distinct_user_count, Integer

          # @!attribute message_count
          #   Number of messages sent in the project on the requested day
          #
          #   @return [Integer]
          required :message_count, Integer

          # @!attribute project_id
          #   Tagged project identifier (e.g. `claude_proj_...`)
          #
          #   @return [String]
          required :project_id, String

          # @!attribute project_name
          #   Name of the project
          #
          #   @return [String]
          required :project_name, String

          # @!attribute created_at
          #   Project creation timestamp in RFC 3339 format. Null if the project was deleted
          #   before attribution was recorded.
          #
          #   @return [Time, nil]
          optional :created_at, Time, nil?: true

          # @!attribute created_by
          #   User who created the project. Null if the project was deleted before attribution
          #   was recorded, or if the creator's account no longer exists.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsUser, nil]
          optional :created_by, -> { Anthropic::Beta::Organization::BetaAnalyticsUser }, nil?: true

          # @!attribute distinct_conversation_count
          #   Number of distinct conversations in the project. Null on aggregated rows where a
          #   distinct count cannot be computed.
          #
          #   @return [Integer, nil]
          optional :distinct_conversation_count, Integer, nil?: true

          # @!attribute product
          #   Product that produced this row's activity: one of `chat`, `claude_code`,
          #   `cowork`, or `office_agent` (the canonical Cost & Usage product naming; an
          #   `office_agent` row's per-surface breakdown is in its `office_metrics`). On
          #   `/plugins` only `cowork` and `claude_code` occur (the only surfaces with plugin
          #   attribution); on `/artifacts` only `chat`, `claude_code`, and `cowork` occur
          #   (the surfaces that create artifacts); `/apps/chat/projects` does not support the
          #   product dimension (a `product` entry in `group_by[]` or `filter[]` there is
          #   rejected). Present only when the request grouped by `product`.
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

          # @!attribute user_id
          #   Tagged user identifier (e.g. `user_...`). Present only when the request grouped
          #   by `user_id`.
          #
          #   @return [String, nil]
          optional :user_id, String, nil?: true

          # @!method initialize(distinct_user_count:, message_count:, project_id:, project_name:, created_at: nil, created_by: nil, distinct_conversation_count: nil, product: nil, rbac_group_id: nil, rbac_group_name: nil, user_id: nil)
          #   Per-project activity data for a given day.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsProjectActivity} for more
          #   details.
          #
          #   @param distinct_user_count [Integer] Number of distinct users who used the project on the requested day, or, in date-
          #
          #   @param message_count [Integer] Number of messages sent in the project on the requested day
          #
          #   @param project_id [String] Tagged project identifier (e.g. `claude_proj_...`)
          #
          #   @param project_name [String] Name of the project
          #
          #   @param created_at [Time, nil] Project creation timestamp in RFC 3339 format. Null if the project was deleted b
          #
          #   @param created_by [Anthropic::Models::Beta::Organization::BetaAnalyticsUser, nil] User who created the project. Null if the project was deleted before attribution
          #
          #   @param distinct_conversation_count [Integer, nil] Number of distinct conversations in the project. Null on aggregated rows where a
          #
          #   @param product [String, nil] Product that produced this row's activity: one of `chat`, `claude_code`, `cowork
          #
          #   @param rbac_group_id [String, nil] Tagged RBAC group identifier (`rbac_group_...`), matching the spend-limits API s
          #
          #   @param rbac_group_name [String, nil] Resolved RBAC group display name, alongside `rbac_group_id` when name resolution
          #
          #   @param user_id [String, nil] Tagged user identifier (e.g. `user_...`). Present only when the request grouped
        end
      end
    end
  end
end
