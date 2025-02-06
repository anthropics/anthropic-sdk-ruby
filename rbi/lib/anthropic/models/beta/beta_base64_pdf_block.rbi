# typed: strong

module Anthropic
  module Models
    BetaBase64PDFBlock = T.type_alias { Beta::BetaBase64PDFBlock }

    module Beta
      class BetaBase64PDFBlock < Anthropic::BaseModel
        sig do
          returns(
            T.any(
              Anthropic::Models::Beta::BetaBase64PDFSource,
              Anthropic::Models::Beta::BetaPlainTextSource,
              Anthropic::Models::Beta::BetaContentBlockSource
            )
          )
        end
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
            source: T.any(
              Anthropic::Models::Beta::BetaBase64PDFSource,
              Anthropic::Models::Beta::BetaPlainTextSource,
              Anthropic::Models::Beta::BetaContentBlockSource
            ),
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

        sig do
          override.returns(
            {
              source: T.any(
                Anthropic::Models::Beta::BetaBase64PDFSource,
                Anthropic::Models::Beta::BetaPlainTextSource,
                Anthropic::Models::Beta::BetaContentBlockSource
              ),
              type: Symbol,
              cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
              citations: Anthropic::Models::Beta::BetaCitationsConfigParam,
              context: T.nilable(String),
              title: T.nilable(String)
            }
          )
        end
        def to_hash; end

        class Source < Anthropic::Union
          abstract!

          sig do
            override.returns(
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
