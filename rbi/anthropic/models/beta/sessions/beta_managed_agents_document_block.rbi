# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsDocumentBlock < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock,
                Anthropic::Internal::AnyHash
              )
            end

          # Union type for document source variants.
          sig do
            returns(
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsBase64DocumentSource,
                Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource,
                Anthropic::Beta::Sessions::BetaManagedAgentsURLDocumentSource,
                Anthropic::Beta::Sessions::BetaManagedAgentsFileDocumentSource
              )
            )
          end
          attr_accessor :source

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Additional context about the document for the model.
          sig { returns(T.nilable(String)) }
          attr_accessor :context

          # The title of the document.
          sig { returns(T.nilable(String)) }
          attr_accessor :title

          # Document content, either specified directly as base64 data, as text, or as a
          # reference via a URL.
          sig do
            params(
              source:
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsBase64DocumentSource::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsURLDocumentSource::OrHash,
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileDocumentSource::OrHash
                ),
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::Type::OrSymbol,
              context: T.nilable(String),
              title: T.nilable(String)
            ).returns(T.attached_class)
          end
          def self.new(
            # Union type for document source variants.
            source:,
            type:,
            # Additional context about the document for the model.
            context: nil,
            # The title of the document.
            title: nil
          )
          end

          sig do
            override.returns(
              {
                source:
                  T.any(
                    Anthropic::Beta::Sessions::BetaManagedAgentsBase64DocumentSource,
                    Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource,
                    Anthropic::Beta::Sessions::BetaManagedAgentsURLDocumentSource,
                    Anthropic::Beta::Sessions::BetaManagedAgentsFileDocumentSource
                  ),
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::Type::OrSymbol,
                context: T.nilable(String),
                title: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          # Union type for document source variants.
          module Source
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Sessions::BetaManagedAgentsBase64DocumentSource,
                  Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource,
                  Anthropic::Beta::Sessions::BetaManagedAgentsURLDocumentSource,
                  Anthropic::Beta::Sessions::BetaManagedAgentsFileDocumentSource
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::Source::Variants
                ]
              )
            end
            def self.variants
            end
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            DOCUMENT =
              T.let(
                :document,
                Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsDocumentBlock::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
