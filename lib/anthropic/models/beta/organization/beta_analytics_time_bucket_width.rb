# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsTimeBucketWidth
          extend Anthropic::Internal::Type::Enum

          DAY = :"1d"
          HOUR = :"1h"
          MINUTE = :"1m"

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
