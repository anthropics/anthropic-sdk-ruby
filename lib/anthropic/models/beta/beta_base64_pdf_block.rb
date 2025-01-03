# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaBase64PDFBlock < Anthropic::BaseModel
        # @!attribute source
        #
        #   @return [Anthropic::Models::Beta::BetaBase64PDFSource]
        required :source, -> { Anthropic::Models::Beta::BetaBase64PDFSource }

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaBase64PDFBlock::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaBase64PDFBlock::Type }

        # @!attribute cache_control
        #
        #   @return [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        optional :cache_control, -> { Anthropic::Models::Beta::BetaCacheControlEphemeral }

        # @!parse
        #   # @param source [Anthropic::Models::Beta::BetaBase64PDFSource]
        #   # @param type [String]
        #   # @param cache_control [Anthropic::Models::Beta::BetaCacheControlEphemeral, nil]
        #   #
        #   def initialize(source:, type:, cache_control: nil, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        #
        # ```ruby
        # case enum
        # in :document
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          DOCUMENT = :document

          finalize!
        end
      end
    end

    BetaBase64PDFBlock = Beta::BetaBase64PDFBlock
  end
end
