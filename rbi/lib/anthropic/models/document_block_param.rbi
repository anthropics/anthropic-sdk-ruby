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
      attr_accessor :source

      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(T.nilable(Anthropic::Models::CacheControlEphemeral)) }
      attr_reader :cache_control

      sig do
        params(
          cache_control: T.nilable(T.any(Anthropic::Models::CacheControlEphemeral, Anthropic::Util::AnyHash))
        )
          .void
      end
      attr_writer :cache_control

      sig { returns(T.nilable(Anthropic::Models::CitationsConfigParam)) }
      attr_reader :citations

      sig { params(citations: T.any(Anthropic::Models::CitationsConfigParam, Anthropic::Util::AnyHash)).void }
      attr_writer :citations

      sig { returns(T.nilable(String)) }
      attr_accessor :context

      sig { returns(T.nilable(String)) }
      attr_accessor :title

      sig do
        params(
          source: T.any(
            Anthropic::Models::Base64PDFSource,
            Anthropic::Util::AnyHash,
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
