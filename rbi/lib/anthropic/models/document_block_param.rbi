# typed: strong

module Anthropic
  module Models
    class DocumentBlockParam < Anthropic::BaseModel
      sig do
        returns(
          T.any(
            Anthropic::Models::Base64PDFSource,
            Anthropic::Models::PlainTextSource,
            Anthropic::Models::ContentBlockSource,
            Anthropic::Models::URLPDFSource
          )
        )
      end
      def source
      end

      sig do
        params(
          _: T.any(
            Anthropic::Models::Base64PDFSource,
            Anthropic::Models::PlainTextSource,
            Anthropic::Models::ContentBlockSource,
            Anthropic::Models::URLPDFSource
          )
        )
          .returns(
            T.any(
              Anthropic::Models::Base64PDFSource,
              Anthropic::Models::PlainTextSource,
              Anthropic::Models::ContentBlockSource,
              Anthropic::Models::URLPDFSource
            )
          )
      end
      def source=(_)
      end

      sig { returns(Symbol) }
      def type
      end

      sig { params(_: Symbol).returns(Symbol) }
      def type=(_)
      end

      sig { returns(T.nilable(Anthropic::Models::CacheControlEphemeral)) }
      def cache_control
      end

      sig do
        params(_: T.nilable(Anthropic::Models::CacheControlEphemeral))
          .returns(T.nilable(Anthropic::Models::CacheControlEphemeral))
      end
      def cache_control=(_)
      end

      sig { returns(T.nilable(Anthropic::Models::CitationsConfigParam)) }
      def citations
      end

      sig { params(_: Anthropic::Models::CitationsConfigParam).returns(Anthropic::Models::CitationsConfigParam) }
      def citations=(_)
      end

      sig { returns(T.nilable(String)) }
      def context
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def context=(_)
      end

      sig { returns(T.nilable(String)) }
      def title
      end

      sig { params(_: T.nilable(String)).returns(T.nilable(String)) }
      def title=(_)
      end

      sig do
        params(
          source: T.any(
            Anthropic::Models::Base64PDFSource,
            Anthropic::Models::PlainTextSource,
            Anthropic::Models::ContentBlockSource,
            Anthropic::Models::URLPDFSource
          ),
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
          citations: Anthropic::Models::CitationsConfigParam,
          context: T.nilable(String),
          title: T.nilable(String),
          type: Symbol
        )
          .void
      end
      def initialize(source:, cache_control: nil, citations: nil, context: nil, title: nil, type: :document)
      end

      sig do
        override
          .returns(
            {
              source: T.any(
                Anthropic::Models::Base64PDFSource,
                Anthropic::Models::PlainTextSource,
                Anthropic::Models::ContentBlockSource,
                Anthropic::Models::URLPDFSource
              ),
              type: Symbol,
              cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
              citations: Anthropic::Models::CitationsConfigParam,
              context: T.nilable(String),
              title: T.nilable(String)
            }
          )
      end
      def to_hash
      end

      class Source < Anthropic::Union
        abstract!

        sig do
          override
            .returns(
              [[Symbol, Anthropic::Models::Base64PDFSource], [Symbol, Anthropic::Models::PlainTextSource], [Symbol, Anthropic::Models::ContentBlockSource], [Symbol, Anthropic::Models::URLPDFSource]]
            )
        end
        private_class_method def self.variants
        end
      end
    end
  end
end
