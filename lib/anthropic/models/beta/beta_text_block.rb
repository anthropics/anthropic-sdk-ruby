# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTextBlock < Anthropic::BaseModel
        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaTextBlock::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaTextBlock::Type }

        # @!parse
        #   # @param text [String]
        #   # @param type [String]
        #   #
        #   def initialize(text:, type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        #
        # ```ruby
        # case enum
        # in :text
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          TEXT = :text
        end
      end
    end

    BetaTextBlock = Beta::BetaTextBlock
  end
end
