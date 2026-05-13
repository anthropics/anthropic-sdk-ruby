# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSearchResultBlock < Anthropic::Internal::Type::BaseModel
          # @!attribute citations
          #   Citation settings for a search result.
          #
          #   @return [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultCitations]
          required :citations, -> { Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultCitations }

          # @!attribute content
          #   Array of text content blocks from the search result.
          #
          #   @return [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultContent>]
          required :content,
                   -> { Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultContent] }

          # @!attribute source
          #   The URL source of the search result.
          #
          #   @return [String]
          required :source, String

          # @!attribute title
          #   The title of the search result.
          #
          #   @return [String]
          required :title, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultBlock::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultBlock::Type }

          # @!method initialize(citations:, content:, source:, title:, type:)
          #   A block containing a web search result.
          #
          #   @param citations [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultCitations] Citation settings for a search result.
          #
          #   @param content [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultContent>] Array of text content blocks from the search result.
          #
          #   @param source [String] The URL source of the search result.
          #
          #   @param title [String] The title of the search result.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultBlock::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultBlock#type
          module Type
            extend Anthropic::Internal::Type::Enum

            SEARCH_RESULT = :search_result

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
