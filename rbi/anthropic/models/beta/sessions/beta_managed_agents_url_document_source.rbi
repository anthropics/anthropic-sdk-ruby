# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsURLDocumentSource < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsURLDocumentSource,
                Anthropic::Internal::AnyHash
              )
            end

          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsURLDocumentSource::Type::OrSymbol
            )
          end
          attr_accessor :type

          # URL of the document to fetch.
          sig { returns(String) }
          attr_accessor :url

          # Document referenced by URL.
          sig do
            params(
              type:
                Anthropic::Beta::Sessions::BetaManagedAgentsURLDocumentSource::Type::OrSymbol,
              url: String
            ).returns(T.attached_class)
          end
          def self.new(
            type:,
            # URL of the document to fetch.
            url:
          )
          end

          sig do
            override.returns(
              {
                type:
                  Anthropic::Beta::Sessions::BetaManagedAgentsURLDocumentSource::Type::OrSymbol,
                url: String
              }
            )
          end
          def to_hash
          end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Sessions::BetaManagedAgentsURLDocumentSource::Type
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            URL =
              T.let(
                :url,
                Anthropic::Beta::Sessions::BetaManagedAgentsURLDocumentSource::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsURLDocumentSource::Type::TaggedSymbol
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
