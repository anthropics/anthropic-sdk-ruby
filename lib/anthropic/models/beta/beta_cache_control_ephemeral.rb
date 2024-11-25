# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCacheControlEphemeral < Anthropic::BaseModel
        # @!attribute [rw] type
        #   @return [Symbol, Anthropic::Models::Beta::BetaCacheControlEphemeral::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaCacheControlEphemeral::Type }

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

    BetaCacheControlEphemeral = Beta::BetaCacheControlEphemeral
  end
end
