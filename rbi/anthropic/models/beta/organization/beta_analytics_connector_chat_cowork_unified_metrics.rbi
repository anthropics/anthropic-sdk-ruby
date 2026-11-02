# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsConnectorChatCoworkUnifiedMetrics < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedMetrics,
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

          # A connector's use in Chat and Cowork unified on one day: `chat` holds its use in
          # chat conversations and `sessions` its use in Cowork sessions.
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
