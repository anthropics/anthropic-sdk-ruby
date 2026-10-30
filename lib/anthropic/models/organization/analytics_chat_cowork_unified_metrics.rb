# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class AnalyticsChatCoworkUnifiedMetrics < Anthropic::Internal::Type::BaseModel
        # @!attribute chat
        #   Chat activity recorded while members had Chat and Cowork unified turned on.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsChatCoworkUnifiedChatMetrics]
        required :chat, -> { Anthropic::Organization::AnalyticsChatCoworkUnifiedChatMetrics }

        # @!attribute sessions
        #   Cowork session activity recorded while members had Chat and Cowork unified
        #   turned on.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsChatCoworkUnifiedSessionsMetrics]
        required :sessions, -> { Anthropic::Organization::AnalyticsChatCoworkUnifiedSessionsMetrics }

        # @!method initialize(chat:, sessions:)
        #   Activity in Chat and Cowork unified for one user on one day: `chat` holds chat
        #   activity and `sessions` holds Cowork session activity.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Organization::AnalyticsChatCoworkUnifiedMetrics} for more
        #   details.
        #
        #   @param chat [Anthropic::Models::Organization::AnalyticsChatCoworkUnifiedChatMetrics] Chat activity recorded while members had Chat and Cowork unified turned
        #
        #   @param sessions [Anthropic::Models::Organization::AnalyticsChatCoworkUnifiedSessionsMetrics] Cowork session activity recorded while members had Chat and Cowork
      end
    end
  end
end
