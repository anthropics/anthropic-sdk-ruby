# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsGroupedCostType
          extend Anthropic::Internal::Type::Enum

          CODE_EXECUTION = :code_execution
          SESSION_USAGE = :session_usage
          TOKENS = :tokens
          WEB_SEARCH = :web_search

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
