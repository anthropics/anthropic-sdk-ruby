# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsChatCoworkUnifiedMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute chat
          #   Chat activity recorded while members had Chat and Cowork unified turned on.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsChatCoworkUnifiedChatMetrics]
          required :chat, -> { Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedChatMetrics }

          # @!attribute sessions
          #   Cowork session activity recorded while members had Chat and Cowork unified
          #   turned on.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsChatCoworkUnifiedSessionsMetrics]
          required :sessions, -> { Anthropic::Beta::Organization::BetaAnalyticsChatCoworkUnifiedSessionsMetrics }

          # @!method initialize(chat:, sessions:)
          #   Activity in Chat and Cowork unified for one user on one day: `chat` holds chat
          #   activity and `sessions` holds Cowork session activity.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsChatCoworkUnifiedMetrics}
          #   for more details.
          #
          #   @param chat [Anthropic::Models::Beta::Organization::BetaAnalyticsChatCoworkUnifiedChatMetrics] Chat activity recorded while members had Chat and Cowork unified turned
          #
          #   @param sessions [Anthropic::Models::Beta::Organization::BetaAnalyticsChatCoworkUnifiedSessionsMetrics] Cowork session activity recorded while members had Chat and Cowork
        end
      end
    end
  end
end
