# typed: strong

module Anthropic
  module Models
    module ContentBlockSourceContent
      extend Anthropic::Internal::Type::Union

      Variants =
        T.type_alias do
          T.any(Anthropic::TextBlockParam, Anthropic::ImageBlockParam)
        end

      module Type
        extend Anthropic::Internal::Type::Enum

        TaggedSymbol =
          T.type_alias do
            T.all(Symbol, Anthropic::ContentBlockSourceContent::Type)
          end
        OrSymbol = T.type_alias { T.any(Symbol, String) }

        TEXT =
          T.let(:text, Anthropic::ContentBlockSourceContent::Type::TaggedSymbol)
        IMAGE =
          T.let(
            :image,
            Anthropic::ContentBlockSourceContent::Type::TaggedSymbol
          )

        sig do
          override.returns(
            T::Array[Anthropic::ContentBlockSourceContent::Type::TaggedSymbol]
          )
        end
        def self.values
        end
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
              Anthropic::URLImageSource::OrHash,
              Anthropic::FileImageSource::OrHash
            ),
          transformations:
            T.nilable(Anthropic::ImageTransformationsParam::OrHash)
        ).returns(Anthropic::ContentBlockSourceContent::Variants)
      end
      def self.new(
        type:,
        text: nil,
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        citations: nil,
        source: nil,
        # Configures the transformations the server applies to this image before the model
        # observes it. Each key names a condition the server transforms images for; its
        # value selects the transformation applied. Omitted keys keep their default
        # behavior, and an empty object is equivalent to omitting the field.
        transformations: nil
      )
      end
    end
  end
end
