# typed: strong

module Anthropic
  module Models
    module Organization
      class AnalyticsPluginChatCoworkUnifiedMetrics < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::AnalyticsPluginChatCoworkUnifiedMetrics,
              Anthropic::Internal::AnyHash
            )
          end

        # Same measure as `cowork_metrics.distinct_session_plugin_used_count`, for
        # activity recorded while members had Chat and Cowork unified turned on. Null on
        # aggregated rows where a distinct count cannot be computed.
        sig { returns(T.nilable(Integer)) }
        attr_accessor :distinct_session_plugin_used_count

        # A plugin's use in Cowork sessions recorded while members had Chat and Cowork
        # unified turned on.
        sig do
          params(
            distinct_session_plugin_used_count: T.nilable(Integer)
          ).returns(T.attached_class)
        end
        def self.new(
          # Same measure as `cowork_metrics.distinct_session_plugin_used_count`, for
          # activity recorded while members had Chat and Cowork unified turned on. Null on
          # aggregated rows where a distinct count cannot be computed.
          distinct_session_plugin_used_count:
        )
        end

        sig do
          override.returns(
            { distinct_session_plugin_used_count: T.nilable(Integer) }
          )
        end
        def to_hash
        end
      end
    end
  end
end
