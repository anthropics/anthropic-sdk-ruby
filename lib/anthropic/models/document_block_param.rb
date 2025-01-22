# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # document_block_param => {
    #   source: Anthropic::Models::Base64PDFSource,
    #   type: Anthropic::Models::DocumentBlockParam::Type,
    #   cache_control: Anthropic::Models::CacheControlEphemeral
    # }
    # ```
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
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::Models::CacheControlEphemeral }, nil?: true

      # @!parse
      #   # @param source [Anthropic::Models::Base64PDFSource]
      #   # @param type [String]
      #   # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil]
      #   #
      #   def initialize(source:, type:, cache_control: nil, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      # ```ruby
      # case type
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
end
