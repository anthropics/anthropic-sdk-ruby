# frozen_string_literal: true

module Anthropic
  module Models
    module ComputerScrollDirection
      extend Anthropic::Internal::Type::Enum

      UP = :up
      DOWN = :down
      LEFT = :left
      RIGHT = :right

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
