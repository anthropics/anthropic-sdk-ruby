# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsConnectorClaudeCodeMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsConnectorClaudeCodeMetrics,
                Anthropic::Internal::AnyHash
              )
            end

          # Number of distinct Claude Code sessions in which the connector was used.
          # Approximate (HLL, typical error <2%) in date-range mode. Null on aggregated rows
          # where a distinct count cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_session_connector_used_count

          # Claude Code activity metrics for a single connector on a given day.
          sig do
            params(
              distinct_session_connector_used_count: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of distinct Claude Code sessions in which the connector was used.
            # Approximate (HLL, typical error <2%) in date-range mode. Null on aggregated rows
            # where a distinct count cannot be computed.
            distinct_session_connector_used_count:
          )
          end

          sig do
            override.returns(
              { distinct_session_connector_used_count: T.nilable(Integer) }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
