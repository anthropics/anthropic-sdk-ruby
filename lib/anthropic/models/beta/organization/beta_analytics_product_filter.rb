# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # Publicly documented product surfaces. `claude-tag` is Claude Tag, the Claude
        # product in Slack. `chat_cowork_unified` is Chat and Cowork unified, Cowork's
        # features inside claude.ai chat: chat and Cowork usage by a member who has it
        # turned on is reported under this value instead of `chat` or `cowork`. It is
        # accepted as a filter only on deployments that offer Chat and Cowork unified.
        module BetaAnalyticsProductFilter
          extend Anthropic::Internal::Type::Enum

          CHAT = :chat
          CHAT_COWORK_UNIFIED = :chat_cowork_unified
          CLAUDE_TAG = :"claude-tag"
          CLAUDE_CODE = :claude_code
          CLAUDE_DESIGN = :claude_design
          CLAUDE_IN_CHROME = :claude_in_chrome
          COWORK = :cowork
          OFFICE_AGENT = :office_agent

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
