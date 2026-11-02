# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class AnalyticsSkillChatCoworkUnifiedMetrics < Anthropic::Internal::Type::BaseModel
        # @!attribute chat
        #   A skill's use in chat conversations recorded while members had Chat and Cowork
        #   unified turned on.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsSkillChatCoworkUnifiedChatMetrics]
        required :chat, -> { Anthropic::Organization::AnalyticsSkillChatCoworkUnifiedChatMetrics }

        # @!attribute sessions
        #   A skill's use in Cowork sessions recorded while members had Chat and Cowork
        #   unified turned on.
        #
        #   @return [Anthropic::Models::Organization::AnalyticsSkillChatCoworkUnifiedSessionsMetrics]
        required :sessions, -> { Anthropic::Organization::AnalyticsSkillChatCoworkUnifiedSessionsMetrics }

        # @!method initialize(chat:, sessions:)
        #   A skill's use in Chat and Cowork unified on one day: `chat` holds its use in
        #   chat conversations and `sessions` its use in Cowork sessions.
        #
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Organization::AnalyticsSkillChatCoworkUnifiedMetrics} for
        #   more details.
        #
        #   @param chat [Anthropic::Models::Organization::AnalyticsSkillChatCoworkUnifiedChatMetrics] A skill's use in chat conversations recorded while members had
        #
        #   @param sessions [Anthropic::Models::Organization::AnalyticsSkillChatCoworkUnifiedSessionsMetrics] A skill's use in Cowork sessions recorded while members had Chat
      end
    end
  end
end
