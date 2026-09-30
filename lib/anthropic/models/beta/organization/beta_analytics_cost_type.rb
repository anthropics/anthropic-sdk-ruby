# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsCostType
          extend Anthropic::Internal::Type::Enum

          CODE_EXECUTION = :code_execution
          TOKENS = :tokens
          WEB_SEARCH = :web_search

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
