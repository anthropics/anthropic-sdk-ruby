# typed: strong

module Anthropic
  module Models
    class DocumentBlockParam < Anthropic::BaseModel
      Shape = T.type_alias do
        {
          source: Anthropic::Models::DocumentBlockParam::Source::Variants,
          type: Symbol,
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
          citations: Anthropic::Models::CitationsConfigParam,
          context: T.nilable(String),
          title: T.nilable(String)
        }
      end

      sig { returns(Anthropic::Models::DocumentBlockParam::Source::Variants) }
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
          source: Anthropic::Models::DocumentBlockParam::Source::Variants,
          cache_control: T.nilable(Anthropic::Models::CacheControlEphemeral),
          citations: Anthropic::Models::CitationsConfigParam,
          context: T.nilable(String),
          title: T.nilable(String),
          type: Symbol
        ).void
      end
      def initialize(source:, cache_control: nil, citations: nil, context: nil, title: nil, type: :document)
      end

      sig { returns(Anthropic::Models::DocumentBlockParam::Shape) }
      def to_h; end

      class Source < Anthropic::Union
        abstract!

        Variants = T.type_alias do
          T.any(
            Anthropic::Models::Base64PDFSource,
            Anthropic::Models::PlainTextSource,
            Anthropic::Models::ContentBlockSource
          )
        end

        sig do
          returns(
            [
              [Symbol, Anthropic::Models::Base64PDFSource],
              [Symbol, Anthropic::Models::PlainTextSource],
              [Symbol, Anthropic::Models::ContentBlockSource]
            ]
          )
        end
        private_class_method def self.variants; end
      end
    end
  end
end
