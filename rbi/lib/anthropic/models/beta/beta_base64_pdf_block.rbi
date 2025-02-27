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
              Anthropic::Models::Beta::BetaContentBlockSource,
              Anthropic::Models::Beta::BetaURLPDFSource
            )
          )
        end
        def source
        end

        sig do
          params(
            _: T.any(
              Anthropic::Models::Beta::BetaBase64PDFSource,
              Anthropic::Models::Beta::BetaPlainTextSource,
              Anthropic::Models::Beta::BetaContentBlockSource,
              Anthropic::Models::Beta::BetaURLPDFSource
            )
          )
            .returns(
              T.any(
                Anthropic::Models::Beta::BetaBase64PDFSource,
                Anthropic::Models::Beta::BetaPlainTextSource,
                Anthropic::Models::Beta::BetaContentBlockSource,
                Anthropic::Models::Beta::BetaURLPDFSource
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

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        def cache_control
        end

        sig do
          params(_: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral))
            .returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral))
        end
        def cache_control=(_)
        end

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCitationsConfigParam)) }
        def citations
        end

        sig do
          params(_: Anthropic::Models::Beta::BetaCitationsConfigParam)
            .returns(Anthropic::Models::Beta::BetaCitationsConfigParam)
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
              Anthropic::Models::Beta::BetaBase64PDFSource,
              Anthropic::Models::Beta::BetaPlainTextSource,
              Anthropic::Models::Beta::BetaContentBlockSource,
              Anthropic::Models::Beta::BetaURLPDFSource
            ),
            cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
            citations: Anthropic::Models::Beta::BetaCitationsConfigParam,
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
                  Anthropic::Models::Beta::BetaBase64PDFSource,
                  Anthropic::Models::Beta::BetaPlainTextSource,
                  Anthropic::Models::Beta::BetaContentBlockSource,
                  Anthropic::Models::Beta::BetaURLPDFSource
                ),
                type: Symbol,
                cache_control: T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral),
                citations: Anthropic::Models::Beta::BetaCitationsConfigParam,
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
                [[Symbol, Anthropic::Models::Beta::BetaBase64PDFSource], [Symbol, Anthropic::Models::Beta::BetaPlainTextSource], [Symbol, Anthropic::Models::Beta::BetaContentBlockSource], [Symbol, Anthropic::Models::Beta::BetaURLPDFSource]]
              )
          end
          private_class_method def self.variants
          end
        end
      end
    end
  end
end
