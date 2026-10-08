# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsArtifactActivity < Anthropic::Internal::Type::BaseModel
          # @!attribute artifact_type
          #   Canonical artifact MIME type (e.g. `text/markdown`, `application/vnd.ant.react`,
          #   `image/svg+xml`), or `other`. Claude Code and Cowork artifacts report as
          #   `text/html`.
          #
          #   @return [String]
          required :artifact_type, String

          # @!attribute artifacts_created_count
          #   Number of artifacts created in this bucket on the requested day
          #
          #   @return [Integer]
          required :artifacts_created_count, Integer

          # @!attribute distinct_user_count
          #   Number of distinct users who created artifacts in this bucket on the requested
          #   day
          #
          #   @return [Integer]
          required :distinct_user_count, Integer

          # @!attribute is_shared
          #   Whether the artifacts in this bucket have ever been shared (a Claude Code /
          #   Cowork artifact is shared once anyone beyond its creator may open it: named
          #   members, the whole organization, or anyone with the link).
          #
          #   @return [Boolean]
          required :is_shared, Anthropic::Internal::Type::Boolean

          # @!attribute published_artifacts_created_count
          #   Number of those artifacts that have been published (for Claude Code / Cowork
          #   artifacts: open to anyone with the link); never exceeds
          #   `artifacts_created_count`
          #
          #   @return [Integer]
          required :published_artifacts_created_count, Integer

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

          # @!attribute user_id
          #   Tagged user identifier (e.g. `user_...`). Present only when the request grouped
          #   by `user_id`.
          #
          #   @return [String, nil]
          optional :user_id, String, nil?: true

          # @!method initialize(artifact_type:, artifacts_created_count:, distinct_user_count:, is_shared:, published_artifacts_created_count:, product: nil, rbac_group_id: nil, rbac_group_name: nil, user_id: nil)
          #   Artifact-creation activity for one (`artifact_type`, `is_shared`) bucket on a
          #   given day.
          #
          #   Artifacts form a small finite cube — the canonical MIME type (8 values incl.
          #   `other`) crossed with shared-vs-private — so the response is the full set of
          #   non-empty buckets, not a ranked/paginated list. Claude Code and Cowork artifacts
          #   report under `text/html` and are counted from 2026-08-17 onward; earlier days
          #   contain claude.ai chat artifacts only. With `group_by[]=product` / `user_id` /
          #   `rbac_group_id` each row is further split by the flat group keys and counts are
          #   scoped to that cut.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsArtifactActivity} for more
          #   details.
          #
          #   @param artifact_type [String] Canonical artifact MIME type (e.g. `text/markdown`, `application/vnd.ant.react`,
          #
          #   @param artifacts_created_count [Integer] Number of artifacts created in this bucket on the requested day
          #
          #   @param distinct_user_count [Integer] Number of distinct users who created artifacts in this bucket on the requested d
          #
          #   @param is_shared [Boolean] Whether the artifacts in this bucket have ever been shared (a Claude Code / Cowo
          #
          #   @param published_artifacts_created_count [Integer] Number of those artifacts that have been published (for Claude Code / Cowork art
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
