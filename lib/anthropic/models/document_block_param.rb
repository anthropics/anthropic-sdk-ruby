# frozen_string_literal: true

module Anthropic
  module Models
    class DocumentBlockParam < Anthropic::BaseModel
      # @!attribute source
      #
      #   @return [Anthropic::Models::Base64PDFSource]
      required :source, -> { Anthropic::Models::Base64PDFSource }

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::DocumentBlockParam::Type]
      required :type, enum: -> { Anthropic::Models::DocumentBlockParam::Type }

      # @!attribute cache_control
      #
      #   @return [Anthropic::Models::CacheControlEphemeral]
      optional :cache_control, -> { Anthropic::Models::CacheControlEphemeral }

      # @!parse
      #   # @param source [Anthropic::Models::Base64PDFSource]
      #   # @param type [String]
      #   # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil]
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
      end
    end
  end
end
