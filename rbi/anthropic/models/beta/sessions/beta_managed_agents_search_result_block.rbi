# typed: strong

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSearchResultBlock < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultBlock,
                Anthropic::Internal::AnyHash
              )
            end

          # Citation settings for this search result.
          sig do
            returns(
              Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultCitations
            )
          end
          attr_reader :citations

          sig do
            params(
              citations:
                Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultCitations::OrHash
            ).void
          end
          attr_writer :citations

          # Array of text content blocks from the search result.
          sig do
            returns(
              T::Array[
                Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultContent
              ]
            )
          end
          attr_accessor :content

          # The URL source of the search result.
          sig { returns(String) }
          attr_accessor :source

          # The title of the search result.
          sig { returns(String) }
          attr_accessor :title

          sig { returns(Symbol) }
          attr_accessor :type

          # A block containing a web search result.
          sig do
            params(
              citations:
                Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultCitations::OrHash,
              content:
                T::Array[
                  Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultContent::OrHash
                ],
              source: String,
              title: String,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Citation settings for this search result.
            citations:,
            # Array of text content blocks from the search result.
            content:,
            # The URL source of the search result.
            source:,
            # The title of the search result.
            title:,
            type: :search_result
          )
          end

          sig do
            override.returns(
              {
                citations:
                  Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultCitations,
                content:
                  T::Array[
                    Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultContent
                  ],
                source: String,
                title: String,
                type: Symbol
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
