# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaTextBlockParam < Anthropic::BaseModel
        # @!attribute text
        #   @return [String]
        required :text, String

        # @!attribute type
        #   @return [Symbol, Anthropic::Models::Beta::BetaTextBlockParam::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaTextBlockParam::Type }

        # @!attribute cache_control
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

        class Type < Anthropic::Enum
          TEXT = :text
        end

        # @!parse
        #   # Create a new instance of BetaTextBlockParam from a Hash of raw data.
        #   #
        #   # @param data [Hash{Symbol => Object}] .
        #   #   @option data [String] :text
        #   #   @option data [String] :type
        #   #   @option data [Object, nil] :cache_control
        #   def initialize(data = {}) = super
      end
    end

    BetaTextBlockParam = Beta::BetaTextBlockParam
  end
end
