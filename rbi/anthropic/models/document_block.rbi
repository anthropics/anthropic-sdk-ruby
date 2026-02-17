# typed: strong

module Anthropic
  module Models
    class DocumentBlock < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::DocumentBlock, Anthropic::Internal::AnyHash)
        end

      # Citation configuration for the document
      sig { returns(T.nilable(Anthropic::CitationsConfig)) }
      attr_reader :citations

      sig do
        params(citations: T.nilable(Anthropic::CitationsConfig::OrHash)).void
      end
      attr_writer :citations

      sig { returns(Anthropic::DocumentBlock::Source::Variants) }
      attr_accessor :source

      # The title of the document
      sig { returns(T.nilable(String)) }
      attr_accessor :title

      sig { returns(Symbol) }
      attr_accessor :type

      sig do
        params(
          citations: T.nilable(Anthropic::CitationsConfig::OrHash),
          source:
            T.any(
              Anthropic::Base64PDFSource::OrHash,
              Anthropic::PlainTextSource::OrHash
            ),
          title: T.nilable(String),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        # Citation configuration for the document
        citations:,
        source:,
        # The title of the document
        title:,
        type: :document
      )
      end

      sig do
        override.returns(
          {
            citations: T.nilable(Anthropic::CitationsConfig),
            source: Anthropic::DocumentBlock::Source::Variants,
            title: T.nilable(String),
            type: Symbol
          }
        )
      end
      def to_hash
      end

      module Source
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(Anthropic::Base64PDFSource, Anthropic::PlainTextSource)
          end

        sig do
          override.returns(T::Array[Anthropic::DocumentBlock::Source::Variants])
        end
        def self.variants
        end
      end
    end
  end
end
