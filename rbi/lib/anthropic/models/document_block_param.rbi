# typed: strong

module Anthropic
  module Models
    class DocumentBlockParam < Anthropic::BaseModel
      sig do
        returns(
          T.any(
            Anthropic::Models::Base64PDFSource,
            Anthropic::Models::PlainTextSource,
            Anthropic::Models::ContentBlockSource
          )
        )
      end
      attr_accessor :source

      sig { returns(Symbol) }
      attr_accessor :type

      sig { returns(T.nilable(Anthropic::Models::CacheControlEphemeral)) }
      attr_accessor :cache_control

      sig { returns(T.nilable(Anthropic::Models::CitationsConfigParam)) }
      attr_reader :citations

      sig { params(citations: Anthropic::Models::CitationsConfigParam).void }
      attr_writer :citations

      sig { returns(T.nilable(String)) }
      attr_accessor :context

      sig { returns(T.nilable(String)) }
      attr_accessor :title

      sig do
        params(
          source: T.any(
            Anthropic::Models::Base64PDFSource,
            Anthropic::Models::PlainTextSource,
            Anthropic::Models::ContentBlockSource
          ),
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
          citations: Anthropic::Models::CitationsConfigParam,
          context: T.nilable(String),
          title: T.nilable(String),
          type: Symbol
        ).void
      end
      def initialize(source:, cache_control: nil, citations: nil, context: nil, title: nil, type: :document)
      end

      sig do
        override.returns(
          {
            source: T.any(
              Anthropic::Models::Base64PDFSource,
              Anthropic::Models::PlainTextSource,
              Anthropic::Models::ContentBlockSource
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
          override.returns(
            [
              [Symbol, Anthropic::Models::Base64PDFSource],
              [Symbol, Anthropic::Models::PlainTextSource],
              [Symbol, Anthropic::Models::ContentBlockSource]
            ]
          )
        end
        private_class_method def self.variants
        end
      end
    end
  end
end
