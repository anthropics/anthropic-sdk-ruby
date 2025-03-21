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
        params(_: T.nilable(T.any(Anthropic::Models::CacheControlEphemeral, Anthropic::Util::AnyHash)))
          .returns(T.nilable(T.any(Anthropic::Models::CacheControlEphemeral, Anthropic::Util::AnyHash)))
      end
      def cache_control=(_)
      end

      sig { returns(T.nilable(Anthropic::Models::CitationsConfigParam)) }
      def citations
      end

      sig do
        params(_: T.any(Anthropic::Models::CitationsConfigParam, Anthropic::Util::AnyHash))
          .returns(T.any(Anthropic::Models::CitationsConfigParam, Anthropic::Util::AnyHash))
      end
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
          cache_control: T.nilable(T.any(Anthropic::Models::CacheControlEphemeral, Anthropic::Util::AnyHash)),
          citations: T.any(Anthropic::Models::CitationsConfigParam, Anthropic::Util::AnyHash),
          context: T.nilable(String),
          title: T.nilable(String),
          type: Symbol
        )
          .returns(T.attached_class)
      end
      def self.new(source:, cache_control: nil, citations: nil, context: nil, title: nil, type: :document)
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

      module Source
        extend Anthropic::Union

        Variants =
          type_template(:out) do
            {
              fixed: T.any(
                Anthropic::Models::Base64PDFSource,
                Anthropic::Models::PlainTextSource,
                Anthropic::Models::ContentBlockSource,
                Anthropic::Models::URLPDFSource
              )
            }
          end

        class << self
          sig do
            override
              .returns(
                [Anthropic::Models::Base64PDFSource, Anthropic::Models::PlainTextSource, Anthropic::Models::ContentBlockSource, Anthropic::Models::URLPDFSource]
              )
          end
          def variants
          end
        end
      end
    end
  end
end
