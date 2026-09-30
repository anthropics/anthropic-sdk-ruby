# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsOfficeProductMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsOfficeProductMetrics,
                Anthropic::Internal::AnyHash
              )
            end

          # Number of MCP connector invocations
          sig { returns(Integer) }
          attr_accessor :connectors_used_count

          # Number of distinct MCP connectors used. Approximate (HLL, typical error <2%) in
          # date-range mode. Null on aggregated rows where a distinct count cannot be
          # computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_connectors_used_count

          # Number of distinct Office Agent sessions. Approximate (HLL, typical error <2%)
          # in date-range mode. Null on aggregated rows where a distinct count cannot be
          # computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_session_count

          # Number of distinct skills used. Approximate (HLL, typical error <2%) in
          # date-range mode. Null on aggregated rows where a distinct count cannot be
          # computed.
          sig { returns(T.nilable(Integer)) }
          attr_accessor :distinct_skills_used_count

          # Number of messages sent
          sig { returns(Integer) }
          attr_accessor :message_count

          # Number of skill invocations
          sig { returns(Integer) }
          attr_accessor :skills_used_count

          # Office Agent activity metrics for a single user on a given day within one Office
          # product.
          sig do
            params(
              connectors_used_count: Integer,
              distinct_connectors_used_count: T.nilable(Integer),
              distinct_session_count: T.nilable(Integer),
              distinct_skills_used_count: T.nilable(Integer),
              message_count: Integer,
              skills_used_count: Integer
            ).returns(T.attached_class)
          end
          def self.new(
            # Number of MCP connector invocations
            connectors_used_count:,
            # Number of distinct MCP connectors used. Approximate (HLL, typical error <2%) in
            # date-range mode. Null on aggregated rows where a distinct count cannot be
            # computed.
            distinct_connectors_used_count:,
            # Number of distinct Office Agent sessions. Approximate (HLL, typical error <2%)
            # in date-range mode. Null on aggregated rows where a distinct count cannot be
            # computed.
            distinct_session_count:,
            # Number of distinct skills used. Approximate (HLL, typical error <2%) in
            # date-range mode. Null on aggregated rows where a distinct count cannot be
            # computed.
            distinct_skills_used_count:,
            # Number of messages sent
            message_count:,
            # Number of skill invocations
            skills_used_count:
          )
          end

          sig do
            override.returns(
              {
                connectors_used_count: Integer,
                distinct_connectors_used_count: T.nilable(Integer),
                distinct_session_count: T.nilable(Integer),
                distinct_skills_used_count: T.nilable(Integer),
                message_count: Integer,
                skills_used_count: Integer
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
