# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module BetaAnalyticsSpeed
          extend Anthropic::Internal::Type::Enum

          FAST = :fast
          STANDARD = :standard

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
