# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # A Claude model line, such as `opus` or `sonnet`. More lines may be added as new
      # values.
      module BetaModelLine
        extend Anthropic::Internal::Type::Enum

        HAIKU = :haiku
        SONNET = :sonnet
        OPUS = :opus
        FABLE = :fable
        MYTHOS = :mythos

        # @!method self.values
        #   @return [Array<Symbol>]
      end
    end

    BetaModelLine = Beta::BetaModelLine
  end
end
