# typed: strong

module Anthropic
  module Models
    BetaDocumentBlock = Beta::BetaDocumentBlock

    module Beta
      class BetaDocumentBlock < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Beta::BetaDocumentBlock,
              Anthropic::Internal::AnyHash
            )
          end

        # Citation configuration for the document
        sig { returns(T.nilable(Anthropic::Beta::BetaCitationConfig)) }
        attr_reader :citations

        sig do
          params(
            citations: T.nilable(Anthropic::Beta::BetaCitationConfig::OrHash)
          ).void
        end
        attr_writer :citations

        sig { returns(Anthropic::Beta::BetaDocumentBlock::Source::Variants) }
        attr_accessor :source

        # The title of the document
        sig { returns(T.nilable(String)) }
        attr_accessor :title

        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            citations: T.nilable(Anthropic::Beta::BetaCitationConfig::OrHash),
            source:
              T.any(
                Anthropic::Beta::BetaBase64PDFSource::OrHash,
                Anthropic::Beta::BetaPlainTextSource::OrHash
              ),
            title: T.nilable(String),
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # Citation configuration for the document
          citations:,
          source:,
          # The title of the document
          title:,
          type: :document
        )
        end

        sig do
          override.returns(
            {
              citations: T.nilable(Anthropic::Beta::BetaCitationConfig),
              source: Anthropic::Beta::BetaDocumentBlock::Source::Variants,
              title: T.nilable(String),
              type: Symbol
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
                Anthropic::Beta::BetaPlainTextSource
              )
            end

          sig do
            override.returns(
              T::Array[Anthropic::Beta::BetaDocumentBlock::Source::Variants]
            )
          end
          def self.variants
          end
        end
      end
    end
  end
end
