# typed: strong

module Anthropic
  module Models
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
          params(_: T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Util::AnyHash)))
            .returns(T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Util::AnyHash)))
        end
        def cache_control=(_)
        end

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCitationsConfigParam)) }
        def citations
        end

        sig do
          params(_: T.any(Anthropic::Models::Beta::BetaCitationsConfigParam, Anthropic::Util::AnyHash))
            .returns(T.any(Anthropic::Models::Beta::BetaCitationsConfigParam, Anthropic::Util::AnyHash))
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
            .returns(T.attached_class)
        end
        def self.new(source:, cache_control: nil, citations: nil, context: nil, title: nil, type: :document)
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

        module Source
          extend Anthropic::Union

          Variants =
            type_template(:out) do
              {
                fixed: T.any(
                  Anthropic::Models::Beta::BetaBase64PDFSource,
                  Anthropic::Models::Beta::BetaPlainTextSource,
                  Anthropic::Models::Beta::BetaContentBlockSource,
                  Anthropic::Models::Beta::BetaURLPDFSource
                )
              }
            end
        end
      end
    end

    BetaBase64PDFBlock = Beta::BetaBase64PDFBlock
  end
end
