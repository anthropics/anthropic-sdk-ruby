# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_text_delta => {
      #   text: String,
      #   type: Anthropic::Models::Beta::BetaTextDelta::Type
      # }
      # ```
      class BetaTextDelta < Anthropic::BaseModel
        # @!attribute text
        #
        #   @return [String]
        required :text, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaTextDelta::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaTextDelta::Type }

        # @!parse
        #   # @param text [String]
        #   # @param type [String]
        #   #
        #   def initialize(text:, type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        # ```ruby
        # case type
        # in :text_delta
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          TEXT_DELTA = :text_delta

          finalize!
        end
      end
    end

    BetaTextDelta = Beta::BetaTextDelta
  end
end
