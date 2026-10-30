# typed: strong

module Anthropic
  module Models
    module Organization
      class AnalyticsProjectActivity < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::AnalyticsProjectActivity,
              Anthropic::Internal::AnyHash
            )
          end

        # Project creation timestamp in RFC 3339 format. Null if the project was deleted
        # before attribution was recorded.
        sig { returns(T.nilable(Time)) }
        attr_accessor :created_at

        # User who created the project. Null if the project was deleted before attribution
        # was recorded, or if the creator's account no longer exists.
        sig { returns(T.nilable(Anthropic::Organization::AnalyticsUser)) }
        attr_reader :created_by

        sig do
          params(
            created_by:
              T.nilable(Anthropic::Organization::AnalyticsUser::OrHash)
          ).void
        end
        attr_writer :created_by

        # Number of distinct conversations in the project. Null on aggregated rows where a
        # distinct count cannot be computed.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :distinct_conversation_count

        # Number of distinct users who used the project on the requested day, or, in
        # date-range mode, over the requested window — recomputed as an exact distinct
        # count over the window's per-member daily rows, never a sum of per-day values.
        sig { returns(Integer) }
        attr_accessor :distinct_user_count

        # Number of messages sent in the project on the requested day
        sig { returns(Integer) }
        attr_accessor :message_count

        # Tagged project identifier (e.g. `claude_proj_...`)
        sig { returns(String) }
        attr_accessor :project_id

        # Name of the project
        sig { returns(String) }
        attr_accessor :project_name

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

        # Per-project activity data for a given day.
        sig do
          params(
            created_at: T.nilable(Time),
            created_by:
              T.nilable(Anthropic::Organization::AnalyticsUser::OrHash),
            distinct_conversation_count: T.nilable(Integer),
            distinct_user_count: Integer,
            message_count: Integer,
            project_id: String,
            project_name: String,
            rbac_group_id: T.nilable(String),
            rbac_group_name: T.nilable(String),
            user_id: T.nilable(String)
          ).returns(T.attached_class)
        end
        def self.new(
          # Project creation timestamp in RFC 3339 format. Null if the project was deleted
          # before attribution was recorded.
          created_at:,
          # User who created the project. Null if the project was deleted before attribution
          # was recorded, or if the creator's account no longer exists.
          created_by:,
          # Number of distinct conversations in the project. Null on aggregated rows where a
          # distinct count cannot be computed.
          distinct_conversation_count:,
          # Number of distinct users who used the project on the requested day, or, in
          # date-range mode, over the requested window — recomputed as an exact distinct
          # count over the window's per-member daily rows, never a sum of per-day values.
          distinct_user_count:,
          # Number of messages sent in the project on the requested day
          message_count:,
          # Tagged project identifier (e.g. `claude_proj_...`)
          project_id:,
          # Name of the project
          project_name:,
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
              created_at: T.nilable(Time),
              created_by: T.nilable(Anthropic::Organization::AnalyticsUser),
              distinct_conversation_count: T.nilable(Integer),
              distinct_user_count: Integer,
              message_count: Integer,
              project_id: String,
              project_name: String,
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
