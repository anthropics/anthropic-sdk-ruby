# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Analytics
          module BetaAnalyticsUsageOrderBy
            extend Anthropic::Internal::Type::Enum

            OUTPUT_TOKENS = :output_tokens
            REQUESTS = :requests
            TIME = :time
            TOTAL_TOKENS = :total_tokens
            UNCACHED_INPUT_TOKENS = :uncached_input_tokens

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
