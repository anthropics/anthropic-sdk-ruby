# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # document_block_param => {
    #   source: Anthropic::Models::DocumentBlockParam::Source,
    #   type: Anthropic::Models::DocumentBlockParam::Type,
    #   cache_control: Anthropic::Models::CacheControlEphemeral,
    #   citations: Anthropic::Models::CitationsConfigParam,
    #   context: String
    # }
    # ```
    class DocumentBlockParam < Anthropic::BaseModel
      # @!attribute source
      #
      #   @return [Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource, Anthropic::Models::ContentBlockSource]
      required :source, union: -> { Anthropic::Models::DocumentBlockParam::Source }

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::DocumentBlockParam::Type]
      required :type, enum: -> { Anthropic::Models::DocumentBlockParam::Type }

      # @!attribute cache_control
      #
      #   @return [Anthropic::Models::CacheControlEphemeral, nil]
      optional :cache_control, -> { Anthropic::Models::CacheControlEphemeral }, nil?: true

      # @!attribute [r] citations
      #
      #   @return [Anthropic::Models::CitationsConfigParam, nil]
      optional :citations, -> { Anthropic::Models::CitationsConfigParam }

      # @!parse
      #   # @return [Anthropic::Models::CitationsConfigParam]
      #   attr_writer :citations

      # @!attribute context
      #
      #   @return [String, nil]
      optional :context, String, nil?: true

      # @!attribute title
      #
      #   @return [String, nil]
      optional :title, String, nil?: true

      # @!parse
      #   # @param source [Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource, Anthropic::Models::ContentBlockSource]
      #   # @param type [String]
      #   # @param cache_control [Anthropic::Models::CacheControlEphemeral, nil]
      #   # @param citations [Anthropic::Models::CitationsConfigParam]
      #   # @param context [String, nil]
      #   # @param title [String, nil]
      #   #
      #   def initialize(source:, type:, cache_control: nil, citations: nil, context: nil, title: nil, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      # ```ruby
      # case source
      # in {type: "base64", data: String, media_type: Anthropic::Models::Base64PDFSource::MediaType}
      #   # Anthropic::Models::Base64PDFSource ...
      # in {type: "text", data: String, media_type: Anthropic::Models::PlainTextSource::MediaType}
      #   # Anthropic::Models::PlainTextSource ...
      # in {type: "content", content: Anthropic::Models::ContentBlockSource::Content}
      #   # Anthropic::Models::ContentBlockSource ...
      # end
      # ```
      #
      # @example
      # ```ruby
      # case source
      # in Anthropic::Models::Base64PDFSource
      #   # ...
      # in Anthropic::Models::PlainTextSource
      #   # ...
      # in Anthropic::Models::ContentBlockSource
      #   # ...
      # end
      # ```
      class Source < Anthropic::Union
        discriminator :type

        variant :base64, -> { Anthropic::Models::Base64PDFSource }

        variant :text, -> { Anthropic::Models::PlainTextSource }

        variant :content, -> { Anthropic::Models::ContentBlockSource }
      end

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
