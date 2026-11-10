# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsClaudeTagMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsClaudeTagMetrics,
                Anthropic::Internal::AnyHash
              )
            end

          # 1 on a day the user was active in Claude Tag in Slack, otherwise 0. Summed over
          # the window in date-range mode, so it is the number of active days; on grouped
          # rows, the total of each member's active days. Null when Claude Tag data cannot
          # be read for the request. Otherwise, 0 on a row filtered by project, and null on
          # any other row when no covered day was measured.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :active_day_count

          # Number of the user's Slack messages that made them active: @-mentions, direct
          # messages, group direct message asks, and thread posts Claude answered. Other
          # messages are not counted. Null when Claude Tag data cannot be read for the
          # request. Otherwise, 0 on a row filtered by project, and null on any other row
          # when no covered day was measured.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :active_message_count

          # Claude Tag activity metrics for a single linked user on a given day.
          sig do
            params(
              active_day_count: T.nilable(Integer),
              active_message_count: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(
            # 1 on a day the user was active in Claude Tag in Slack, otherwise 0. Summed over
            # the window in date-range mode, so it is the number of active days; on grouped
            # rows, the total of each member's active days. Null when Claude Tag data cannot
            # be read for the request. Otherwise, 0 on a row filtered by project, and null on
            # any other row when no covered day was measured.
            active_day_count:,
            # Number of the user's Slack messages that made them active: @-mentions, direct
            # messages, group direct message asks, and thread posts Claude answered. Other
            # messages are not counted. Null when Claude Tag data cannot be read for the
            # request. Otherwise, 0 on a row filtered by project, and null on any other row
            # when no covered day was measured.
            active_message_count:
          )
          end

          sig do
            override.returns(
              {
                active_day_count: T.nilable(Integer),
                active_message_count: T.nilable(Integer)
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
