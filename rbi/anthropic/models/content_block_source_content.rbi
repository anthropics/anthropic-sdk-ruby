# typed: strong

module Anthropic
  module Models
    module ContentBlockSourceContent
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(Anthropic::TextBlockParam, Anthropic::ImageBlockParam)
        end

      sig do
        override.returns(
          T::Array[Anthropic::ContentBlockSourceContent::Variants]
        )
      end
      def self.variants
      end

      # Creates a new instance of the variant class whose `type` matches the given
      # value, passing the remaining arguments to its constructor.
      sig do
        params(
          type: T.any(Symbol, String),
          text: String,
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          citations:
            T.nilable(
              T::Array[
                T.any(
                  Anthropic::CitationCharLocationParam::OrHash,
                  Anthropic::CitationPageLocationParam::OrHash,
                  Anthropic::CitationContentBlockLocationParam::OrHash,
                  Anthropic::CitationWebSearchResultLocationParam::OrHash,
                  Anthropic::CitationSearchResultLocationParam::OrHash
                )
              ]
            ),
          source:
            T.any(
              Anthropic::Base64ImageSource::OrHash,
              Anthropic::URLImageSource::OrHash
            )
        ).returns(Anthropic::ContentBlockSourceContent::Variants)
      end
      def self.new(
        type:,
        text: nil,
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        citations: nil,
        source: nil
      )
      end
    end
  end
end
