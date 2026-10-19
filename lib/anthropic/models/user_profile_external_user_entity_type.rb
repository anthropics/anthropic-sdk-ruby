# frozen_string_literal: true

module Anthropic
  module Models
    # What kind of entity the profile represents, as the platform states it:
    # `individual`, `business`, `non_profit` or `government`.
    module UserProfileExternalUserEntityType
      extend Anthropic::Internal::Type::Enum

      INDIVIDUAL = :individual
      BUSINESS = :business
      NON_PROFIT = :non_profit
      GOVERNMENT = :government

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
