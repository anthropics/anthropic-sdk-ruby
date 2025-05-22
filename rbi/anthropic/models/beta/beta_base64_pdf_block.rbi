# typed: strong

module Anthropic
  module Models
    BetaBase64PDFBlock = Beta::BetaBase64PDFBlock

    module Beta
      class BetaBase64PDFBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaBase64PDFBlock,
              Anthropic::Internal::AnyHash
            )
          end

        sig do
          returns(
            T.any(
              Anthropic::Beta::BetaBase64PDFSource,
              Anthropic::Beta::BetaPlainTextSource,
              Anthropic::Beta::BetaContentBlockSource,
              Anthropic::Beta::BetaURLPDFSource,
              Anthropic::Beta::BetaFileDocumentSource
            )
          )
        end
        attr_accessor :source

        sig { returns(Symbol) }
        attr_accessor :type

        # Create a cache control breakpoint at this content block.
        sig { returns(T.nilable(Anthropic::Beta::BetaCacheControlEphemeral)) }
        attr_reader :cache_control

        sig do
          params(
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash)
          ).void
        end
        attr_writer :cache_control

        sig { returns(T.nilable(Anthropic::Beta::BetaCitationsConfigParam)) }
        attr_reader :citations

        sig do
          params(
            citations: Anthropic::Beta::BetaCitationsConfigParam::OrHash
          ).void
        end
        attr_writer :citations

        sig { returns(T.nilable(String)) }
        attr_accessor :context

        sig { returns(T.nilable(String)) }
        attr_accessor :title

        sig do
          params(
            source:
              T.any(
                Anthropic::Beta::BetaBase64PDFSource::OrHash,
                Anthropic::Beta::BetaPlainTextSource::OrHash,
                Anthropic::Beta::BetaContentBlockSource::OrHash,
                Anthropic::Beta::BetaURLPDFSource::OrHash,
                Anthropic::Beta::BetaFileDocumentSource::OrHash
              ),
            cache_control:
              T.nilable(Anthropic::Beta::BetaCacheControlEphemeral::OrHash),
            citations: Anthropic::Beta::BetaCitationsConfigParam::OrHash,
            context: T.nilable(String),
            title: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          source:,
          # Create a cache control breakpoint at this content block.
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
              source:
                T.any(
                  Anthropic::Beta::BetaBase64PDFSource,
                  Anthropic::Beta::BetaPlainTextSource,
                  Anthropic::Beta::BetaContentBlockSource,
                  Anthropic::Beta::BetaURLPDFSource,
                  Anthropic::Beta::BetaFileDocumentSource
                ),
              type: Symbol,
              cache_control:
                T.nilable(Anthropic::Beta::BetaCacheControlEphemeral),
              citations: Anthropic::Beta::BetaCitationsConfigParam,
              context: T.nilable(String),
              title: T.nilable(String)
            }
          )
        end
        def to_hash
        end

        module Source
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Beta::BetaBase64PDFSource,
                Anthropic::Beta::BetaPlainTextSource,
                Anthropic::Beta::BetaContentBlockSource,
                Anthropic::Beta::BetaURLPDFSource,
                Anthropic::Beta::BetaFileDocumentSource
              )
            end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaBase64PDFBlock::Source::Variants]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
