# frozen_string_literal: true

module Anthropic
  module Models
    module BetaCurrency
      extend Anthropic::Internal::Type::Enum

      USD = :USD

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
