# frozen_string_literal: true

module Anthropic
  module Models
    class BetaTextDelta < BaseModel
      # @!attribute [rw] text
      #   @return [String]
      required :text, String

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaTextDelta::Type]
      required :type, enum: -> { Anthropic::Models::BetaTextDelta::Type }

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
end
