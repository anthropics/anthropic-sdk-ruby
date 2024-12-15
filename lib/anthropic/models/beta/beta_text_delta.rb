# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTextDelta < Anthropic::BaseModel
        # @!attribute text
        #   @return [String]
        required :text, String

        # @!attribute type
        #   @return [Symbol, Anthropic::Models::Beta::BetaTextDelta::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaTextDelta::Type }

        class Type < Anthropic::Enum
          TEXT_DELTA = :text_delta
        end

        # @!parse
        #   # Create a new instance of BetaTextDelta from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String] :text
        #   #   @option data [String] :type
        #   def initialize(data = {}) = super
      end
    end

    BetaTextDelta = Beta::BetaTextDelta
  end
end
