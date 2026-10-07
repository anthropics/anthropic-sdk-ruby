# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module BetaBrowserReadPageFilter
        extend Anthropic::Internal::Type::Enum

        ALL = :all
        INTERACTIVE = :interactive

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end

    BetaBrowserReadPageFilter = Beta::BetaBrowserReadPageFilter
  end
end
