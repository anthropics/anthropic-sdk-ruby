# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsPlainTextDocumentSource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource,
                Anthropic::Internal::AnyHash
              )
            end

          # The plain text content.
          sig { returns(String) }
          attr_accessor :data

          # MIME type of the text content. Must be "text/plain".
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::MediaType::OrSymbol
            )
          end
          attr_accessor :media_type

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::Type::OrSymbol
            )
          end
          attr_accessor :type

          # Plain text document content.
          sig do
            params(
              data: String,
              media_type:
                Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::MediaType::OrSymbol,
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::Type::OrSymbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The plain text content.
            data:,
            # MIME type of the text content. Must be "text/plain".
            media_type:,
            type:
          )
          end

          sig do
            override.returns(
              {
                data: String,
                media_type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::MediaType::OrSymbol,
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::Type::OrSymbol
              }
            )
          end
          def to_hash
          end

          # MIME type of the text content. Must be "text/plain".
          module MediaType
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::MediaType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TEXT_PLAIN =
              T.let(
                :"text/plain",
                Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::MediaType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::MediaType::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            TEXT =
              T.let(
                :text,
                Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::Type::TaggedSymbol
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
