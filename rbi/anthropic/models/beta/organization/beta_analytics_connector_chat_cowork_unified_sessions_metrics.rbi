# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsConnectorChatCoworkUnifiedSessionsMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedSessionsMetrics,
                Anthropic::Internal::AnyHash
              )
            end

          # Same measure as `cowork_metrics.distinct_session_connector_used_count`, for
          # activity recorded while members had Chat and Cowork unified turned on.
          # Approximate (HLL, typical error <2%) in date-range mode. Null on aggregated rows
          # where a distinct count cannot be computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_session_connector_used_count

          # A connector's use in Cowork sessions recorded while members had Chat and Cowork
          # unified turned on.
          sig do
            params(
              distinct_session_connector_used_count: T.nilable(Integer)
            ).returns(T.attached_class)
          end
          def self.new(
            # Same measure as `cowork_metrics.distinct_session_connector_used_count`, for
            # activity recorded while members had Chat and Cowork unified turned on.
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
