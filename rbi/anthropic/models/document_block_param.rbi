# typed: strong

module Anthropic
  module Models
    class DocumentBlockParam < Anthropic::Internal::Type::BaseModel
      OrHash =
        T.type_alias do
          T.any(Anthropic::DocumentBlockParam, Anthropic::Internal::AnyHash)
        end

      sig do
        returns(
          T.any(
            Anthropic::Base64PDFSource,
            Anthropic::PlainTextSource,
            Anthropic::ContentBlockSource,
            Anthropic::URLPDFSource
          )
        )
      end
      attr_accessor :source

      sig { returns(Symbol) }
      attr_accessor :type

      # Create a cache control breakpoint at this content block.
      sig { returns(T.nilable(Anthropic::CacheControlEphemeral)) }
      attr_reader :cache_control

      sig do
        params(
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash)
        ).void
      end
      attr_writer :cache_control

      sig { returns(T.nilable(Anthropic::CitationsConfigParam)) }
      attr_reader :citations

      sig { params(citations: Anthropic::CitationsConfigParam::OrHash).void }
      attr_writer :citations

      sig { returns(T.nilable(String)) }
      attr_accessor :context

      sig { returns(T.nilable(String)) }
      attr_accessor :title

      sig do
        params(
          source:
            T.any(
              Anthropic::Base64PDFSource::OrHash,
              Anthropic::PlainTextSource::OrHash,
              Anthropic::ContentBlockSource::OrHash,
              Anthropic::URLPDFSource::OrHash
            ),
          cache_control: T.nilable(Anthropic::CacheControlEphemeral::OrHash),
          citations: Anthropic::CitationsConfigParam::OrHash,
          context: T.nilable(String),
          title: T.nilable(String),
          type: Symbol
        ).returns(T.attached_class)
      end
      def self.new(
        source:,
        # Create a cache control breakpoint at this content block.
        cache_control: nil,
        citations: nil,
        context: nil,
        title: nil,
        type: :document
      )
      end

      sig do
        override.returns(
          {
            source:
              T.any(
                Anthropic::Base64PDFSource,
                Anthropic::PlainTextSource,
                Anthropic::ContentBlockSource,
                Anthropic::URLPDFSource
              ),
            type: Symbol,
            cache_control: T.nilable(Anthropic::CacheControlEphemeral),
            citations: Anthropic::CitationsConfigParam,
            context: T.nilable(String),
            title: T.nilable(String)
          }
        )
      end
      def to_hash
      end

      module Source
        extend Anthropic::Internal::Type::Union

        Variants =
          T.type_alias do
            T.any(
              Anthropic::Base64PDFSource,
              Anthropic::PlainTextSource,
              Anthropic::ContentBlockSource,
              Anthropic::URLPDFSource
            )
          end

        sig do
          override.returns(
            T::Array[Anthropic::DocumentBlockParam::Source::Variants]
          )
        end
        def self.variants
        end
      end
    end
  end
end
