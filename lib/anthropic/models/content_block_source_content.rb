# frozen_string_literal: true

module Anthropic
  module Models
    module ContentBlockSourceContent
      extend Anthropic::Internal::Type::Union

      discriminator :type

      variant :text, -> { Anthropic::TextBlockParam }

      variant :image, -> { Anthropic::ImageBlockParam }

      # @!method self.variants
      #   @return [Array(Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam)]

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      #
      # Some parameter documentations has been truncated, see
      # {Anthropic::Models::ContentBlockSourceContent} for more details.
      #
      # @param type [Symbol, String]
      #
      # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
      #
      #   @option args [String] :text
      #
      #   @option args [Anthropic::Models::CacheControlEphemeral, nil] :cache_control Create a cache control breakpoint at this content block.
      #
      #   @option args [Array<Anthropic::Models::CitationCharLocationParam, Anthropic::Models::CitationPageLocationParam, Anthropic::Models::CitationContentBlockLocationParam, Anthropic::Models::CitationWebSearchResultLocationParam, Anthropic::Models::CitationSearchResultLocationParam>, nil] :citations
      #
      #   @option args [Anthropic::Models::Base64ImageSource, Anthropic::Models::URLImageSource, Anthropic::Models::FileImageSource] :source
      #
      #   @option args [Anthropic::Models::ImageTransformationsParam, nil] :transformations Configures the transformations the server applies to this image before the model
      #
      # @raise [ArgumentError]
      # @return [Anthropic::Models::TextBlockParam, Anthropic::Models::ImageBlockParam]
      def self.new(type:, **args)
        case type.to_sym
        when :text
          Anthropic::TextBlockParam.new(**args)
        when :image
          Anthropic::ImageBlockParam.new(**args)
        else
          raise ArgumentError, "unknown type: #{type}"
        end
      end
    end
  end
end
