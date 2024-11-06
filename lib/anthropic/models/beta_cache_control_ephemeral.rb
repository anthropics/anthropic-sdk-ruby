# frozen_string_literal: true

module Anthropic
  module Models
    class BetaCacheControlEphemeral < Anthropic::BaseModel
      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaCacheControlEphemeral::Type]
      required :type, enum: -> { Anthropic::Models::BetaCacheControlEphemeral::Type }

      class Type < Anthropic::Enum
        EPHEMERAL = :ephemeral
      end

      # @!parse
      #   # Create a new instance of BetaCacheControlEphemeral from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [String] :type
      #   def initialize(data = {}) = super
    end
  end
end
