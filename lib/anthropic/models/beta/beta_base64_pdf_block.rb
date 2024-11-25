# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBase64PDFBlock < Anthropic::BaseModel
        # @!attribute [rw] source
        #   @return [Anthropic::Models::Beta::BetaBase64PDFSource]
        required :source, -> { Anthropic::Models::Beta::BetaBase64PDFSource }

        # @!attribute [rw] type
        #   @return [Symbol, Anthropic::Models::Beta::BetaBase64PDFBlock::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaBase64PDFBlock::Type }

        # @!attribute [rw] cache_control
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

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

    BetaBase64PDFBlock = Beta::BetaBase64PDFBlock
  end
end
