# typed: strong

module Anthropic
  module Models
    BetaBase64PDFBlock = T.type_alias { Beta::BetaBase64PDFBlock }

    module Beta
      class BetaBase64PDFBlock < Anthropic::BaseModel
        Shape = T.type_alias do
          {
            source: Anthropic::Models::Beta::BetaBase64PDFBlock::Source::Variants,
            type: Symbol,
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
            citations: Anthropic::Models::Beta::BetaCitationsConfigParam,
            context: T.nilable(String),
            title: T.nilable(String)
          }
        end

        sig { returns(Anthropic::Models::Beta::BetaBase64PDFBlock::Source::Variants) }
        attr_accessor :source

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        attr_accessor :cache_control

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCitationsConfigParam)) }
        attr_reader :citations

        sig { params(citations: Anthropic::Models::Beta::BetaCitationsConfigParam).void }
        attr_writer :citations

        sig { returns(T.nilable(String)) }
        attr_accessor :context

        sig { returns(T.nilable(String)) }
        attr_accessor :title

        sig do
          params(
            source: Anthropic::Models::Beta::BetaBase64PDFBlock::Source::Variants,
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
            citations: Anthropic::Models::Beta::BetaCitationsConfigParam,
            context: T.nilable(String),
            title: T.nilable(String),
            type: Symbol
          ).void
        end
        def initialize(
          source:,
          cache_control: nil,
          citations: nil,
          context: nil,
          title: nil,
          type: :document
        )
        end

        sig { returns(Anthropic::Models::Beta::BetaBase64PDFBlock::Shape) }
        def to_h; end

        class Source < Anthropic::Union
          abstract!

          Variants = T.type_alias do
            T.any(
              Anthropic::Models::Beta::BetaBase64PDFSource,
              Anthropic::Models::Beta::BetaPlainTextSource,
              Anthropic::Models::Beta::BetaContentBlockSource
            )
          end

          sig do
            returns(
              [
                [Symbol, Anthropic::Models::Beta::BetaBase64PDFSource],
                [Symbol, Anthropic::Models::Beta::BetaPlainTextSource],
                [Symbol, Anthropic::Models::Beta::BetaContentBlockSource]
              ]
            )
          end
          private_class_method def self.variants; end
        end
      end
    end
  end
end
