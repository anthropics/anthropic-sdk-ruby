# frozen_string_literal: true

module Anthropic
  module Models
    class BetaBase64PDFBlock < BaseModel
      # @!attribute [rw] source
      #   @return [Anthropic::Models::BetaBase64PDFSource]
      required :source, -> { Anthropic::Models::BetaBase64PDFSource }

      # @!attribute [rw] type
      #   @return [Symbol, Anthropic::Models::BetaBase64PDFBlock::Type]
      required :type, enum: -> { Anthropic::Models::BetaBase64PDFBlock::Type }

      # @!attribute [rw] cache_control
      #   @return [Anthropic::Models::BetaCacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::BetaCacheControlEphemeral }

      class Type < Anthropic::Enum
        DOCUMENT = :document
      end

      # @!parse
      #   # Create a new instance of BetaBase64PDFBlock from a Hash of raw data.
      #   #
      #   # @param data [Hash{Symbol => Object}] .
      #   #   @option data [Object] :source
      #   #   @option data [String] :type
      #   #   @option data [Object, nil] :cache_control
      #   def initialize(data = {}) = super
    end
  end
end
