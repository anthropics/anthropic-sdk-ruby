# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # Publicly documented product surfaces. `claude-tag` is Claude Tag, the Claude
        # product in Slack.
        module BetaAnalyticsProductFilter
          extend Anthropic::Internal::Type::Enum

          CHAT = :chat
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
