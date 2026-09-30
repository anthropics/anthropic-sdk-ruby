# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsArtifactActivity < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsArtifactActivity,
                Anthropic::Internal::AnyHash
              )
            end

          # Canonical artifact MIME type (e.g. `text/markdown`, `application/vnd.ant.react`,
          # `image/svg+xml`), or `other`. Claude Code and Cowork artifacts report as
          # `text/html`.
          sig { returns(String) }
          attr_accessor :artifact_type

          # Number of artifacts created in this bucket on the requested day
          sig { returns(Integer) }
          attr_accessor :artifacts_created_count

          # Number of distinct users who created artifacts in this bucket on the requested
          # day
          sig { returns(Integer) }
          attr_accessor :distinct_user_count

          # Whether the artifacts in this bucket have ever been shared (a Claude Code /
          # Cowork artifact is shared once anyone beyond its creator may open it: named
          # members, the whole organization, or anyone with the link).
          sig { returns(T::Boolean) }
          attr_accessor :is_shared

          # Number of those artifacts that have been published (for Claude Code / Cowork
          # artifacts: open to anyone with the link); never exceeds
          # `artifacts_created_count`
          sig { returns(Integer) }
          attr_accessor :published_artifacts_created_count

          # Product that produced this row's activity: one of `chat`, `claude_code`,
          # `cowork`, or `office_agent` (the canonical Cost & Usage product naming; an
          # `office_agent` row's per-surface breakdown is in its `office_metrics`). On
          # `/plugins` only `cowork` and `claude_code` occur (the only surfaces with plugin
          # attribution); on `/artifacts` only `chat`, `claude_code`, and `cowork` occur
          # (the surfaces that create artifacts); `/apps/chat/projects` does not support the
          # product dimension (a `product` entry in `group_by[]` or `filter[]` there is
          # rejected). Present only when the request grouped by `product`.
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

          # Tagged user identifier (e.g. `user_...`). Present only when the request grouped
          # by `user_id`.
          sig { returns(T.nilable(String)) }
          attr_accessor :user_id

          # Artifact-creation activity for one (`artifact_type`, `is_shared`) bucket on a
          # given day.
          #
          # Artifacts form a small finite cube — the canonical MIME type (8 values incl.
          # `other`) crossed with shared-vs-private — so the response is the full set of
          # non-empty buckets, not a ranked/paginated list. Claude Code and Cowork artifacts
          # report under `text/html` and are counted from 2026-08-17 onward; earlier days
          # contain claude.ai chat artifacts only. With `group_by[]=product` / `user_id` /
          # `rbac_group_id` each row is further split by the flat group keys and counts are
          # scoped to that cut.
          sig do
            params(
              artifact_type: String,
              artifacts_created_count: Integer,
              distinct_user_count: Integer,
              is_shared: T::Boolean,
              published_artifacts_created_count: Integer,
              product: T.nilable(String),
              rbac_group_id: T.nilable(String),
              rbac_group_name: T.nilable(String),
              user_id: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Canonical artifact MIME type (e.g. `text/markdown`, `application/vnd.ant.react`,
            # `image/svg+xml`), or `other`. Claude Code and Cowork artifacts report as
            # `text/html`.
            artifact_type:,
            # Number of artifacts created in this bucket on the requested day
            artifacts_created_count:,
            # Number of distinct users who created artifacts in this bucket on the requested
            # day
            distinct_user_count:,
            # Whether the artifacts in this bucket have ever been shared (a Claude Code /
            # Cowork artifact is shared once anyone beyond its creator may open it: named
            # members, the whole organization, or anyone with the link).
            is_shared:,
            # Number of those artifacts that have been published (for Claude Code / Cowork
            # artifacts: open to anyone with the link); never exceeds
            # `artifacts_created_count`
            published_artifacts_created_count:,
            # Product that produced this row's activity: one of `chat`, `claude_code`,
            # `cowork`, or `office_agent` (the canonical Cost & Usage product naming; an
            # `office_agent` row's per-surface breakdown is in its `office_metrics`). On
            # `/plugins` only `cowork` and `claude_code` occur (the only surfaces with plugin
            # attribution); on `/artifacts` only `chat`, `claude_code`, and `cowork` occur
            # (the surfaces that create artifacts); `/apps/chat/projects` does not support the
            # product dimension (a `product` entry in `group_by[]` or `filter[]` there is
            # rejected). Present only when the request grouped by `product`.
            product: nil,
            # Tagged RBAC group identifier (`rbac_group_...`), matching the spend-limits API
            # spelling. Present only when the request grouped by `rbac_group_id`.
            rbac_group_id: nil,
            # Resolved RBAC group display name, alongside `rbac_group_id` when name resolution
            # is available. Null if the group has been deleted or its name could not be
            # resolved; `rbac_group_id` remains the stable key.
            rbac_group_name: nil,
            # Tagged user identifier (e.g. `user_...`). Present only when the request grouped
            # by `user_id`.
            user_id: nil
          )
          end

          sig do
            override.returns(
              {
                artifact_type: String,
                artifacts_created_count: Integer,
                distinct_user_count: Integer,
                is_shared: T::Boolean,
                published_artifacts_created_count: Integer,
                product: T.nilable(String),
                rbac_group_id: T.nilable(String),
                rbac_group_name: T.nilable(String),
                user_id: T.nilable(String)
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
