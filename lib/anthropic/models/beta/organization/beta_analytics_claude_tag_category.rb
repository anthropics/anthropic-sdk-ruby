# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsClaudeTagCategory
          extend Anthropic::Internal::Type::Enum

          DM = :dm
          ENGAGED = :engaged
          MONITORING = :monitoring
          PROACTIVE = :proactive
          SCHEDULED = :scheduled

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
