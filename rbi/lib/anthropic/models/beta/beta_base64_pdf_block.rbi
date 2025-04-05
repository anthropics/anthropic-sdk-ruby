# typed: strong

module Anthropic
  module Models
    module Beta
      class BetaBase64PDFBlock < Anthropic::Internal::Type::BaseModel
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
        attr_accessor :source

        sig { returns(Symbol) }
        attr_accessor :type

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control: T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Internal::AnyHash))
          )
            .void
        end
        attr_writer :cache_control

        sig { returns(T.nilable(Anthropic::Models::Beta::BetaCitationsConfigParam)) }
        attr_reader :citations

        sig do
          params(citations: T.any(Anthropic::Models::Beta::BetaCitationsConfigParam, Anthropic::Internal::AnyHash))
            .void
        end
        attr_writer :citations

        sig { returns(T.nilable(String)) }
        attr_accessor :context

        sig { returns(T.nilable(String)) }
        attr_accessor :title

        sig do
          params(
            source: T.any(
              Anthropic::Models::Beta::BetaBase64PDFSource,
              Anthropic::Internal::AnyHash,
              Anthropic::Models::Beta::BetaPlainTextSource,
              Anthropic::Models::Beta::BetaContentBlockSource,
              Anthropic::Models::Beta::BetaURLPDFSource
            ),
            cache_control: T.nilable(T.any(Anthropic::Models::Beta::BetaCacheControlEphemeral, Anthropic::Internal::AnyHash)),
            citations: T.any(Anthropic::Models::Beta::BetaCitationsConfigParam, Anthropic::Internal::AnyHash),
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
        def to_hash; end

        module Source
          extend Anthropic::Internal::Type::Union

          sig do
            override
              .returns(
                [Anthropic::Models::Beta::BetaBase64PDFSource, Anthropic::Models::Beta::BetaPlainTextSource, Anthropic::Models::Beta::BetaContentBlockSource, Anthropic::Models::Beta::BetaURLPDFSource]
              )
          end
          def self.variants; end
        end
      end
    end

    BetaBase64PDFBlock = Beta::BetaBase64PDFBlock
  end
end
