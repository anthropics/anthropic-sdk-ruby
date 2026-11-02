# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAnalyticsSkillChatCoworkUnifiedMetrics < Anthropic::Internal::Type::BaseModel
          # @!attribute chat
          #   A skill's use in chat conversations recorded while members had Chat and Cowork
          #   unified turned on.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedChatMetrics]
          required :chat, -> { Anthropic::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedChatMetrics }

          # @!attribute sessions
          #   A skill's use in Cowork sessions recorded while members had Chat and Cowork
          #   unified turned on.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedSessionsMetrics]
          required :sessions,
                   -> { Anthropic::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedSessionsMetrics }

          # @!method initialize(chat:, sessions:)
          #   A skill's use in Chat and Cowork unified on one day: `chat` holds its use in
          #   chat conversations and `sessions` its use in Cowork sessions.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedMetrics}
          #   for more details.
          #
          #   @param chat [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedChatMetrics] A skill's use in chat conversations recorded while members had
          #
          #   @param sessions [Anthropic::Models::Beta::Organization::BetaAnalyticsSkillChatCoworkUnifiedSessionsMetrics] A skill's use in Cowork sessions recorded while members had Chat
        end
      end
    end
  end
end
