# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class AnalyticsConnectorChatCoworkUnifiedMetrics < Anthropic::Internal::Type::BaseModel
        # @!attribute chat
        #   A connector's use in chat conversations recorded while members had Chat and
        #   Cowork unified turned on.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsConnectorChatCoworkUnifiedChatMetrics]
        required :chat, -> { Anthropic::Organization::AnalyticsConnectorChatCoworkUnifiedChatMetrics }

        # @!attribute sessions
        #   A connector's use in Cowork sessions recorded while members had Chat and Cowork
        #   unified turned on.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsConnectorChatCoworkUnifiedSessionsMetrics]
        required :sessions, -> { Anthropic::Organization::AnalyticsConnectorChatCoworkUnifiedSessionsMetrics }

        # @!method initialize(chat:, sessions:)
        #   A connector's use in Chat and Cowork unified on one day: `chat` holds its use in
        #   chat conversations and `sessions` its use in Cowork sessions.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Organization::AnalyticsConnectorChatCoworkUnifiedMetrics}
        #   for more details.
        #
        #   @param chat [Anthropic::Models::Organization::AnalyticsConnectorChatCoworkUnifiedChatMetrics] A connector's use in chat conversations recorded while members had
        #
        #   @param sessions [Anthropic::Models::Organization::AnalyticsConnectorChatCoworkUnifiedSessionsMetrics] A connector's use in Cowork sessions recorded while members had
      end
    end
  end
end
