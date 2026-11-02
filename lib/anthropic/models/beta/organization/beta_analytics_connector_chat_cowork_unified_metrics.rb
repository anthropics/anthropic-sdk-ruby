# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsConnectorChatCoworkUnifiedMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute chat
          #   A connector's use in chat conversations recorded while members had Chat and
          #   Cowork unified turned on.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedChatMetrics]
          required :chat, -> { Anthropic::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedChatMetrics }

          # @!attribute sessions
          #   A connector's use in Cowork sessions recorded while members had Chat and Cowork
          #   unified turned on.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedSessionsMetrics]
          required :sessions,
                   -> { Anthropic::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedSessionsMetrics }

          # @!method initialize(chat:, sessions:)
          #   A connector's use in Chat and Cowork unified on one day: `chat` holds its use in
          #   chat conversations and `sessions` its use in Cowork sessions.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedMetrics}
          #   for more details.
          #
          #   @param chat [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedChatMetrics] A connector's use in chat conversations recorded while members had
          #
          #   @param sessions [Anthropic::Models::Beta::Organization::BetaAnalyticsConnectorChatCoworkUnifiedSessionsMetrics] A connector's use in Cowork sessions recorded while members had
        end
      end
    end
  end
end
