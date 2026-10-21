# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSearchResultBlock < Anthropic::Internal::Type::BaseModel
          # @!attribute citations
          #   Citation settings for this search result.
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
          #   @return [Symbol, :search_result]
          required :type, const: :search_result

          # @!method initialize(citations:, content:, source:, title:, type: :search_result)
          #   A block containing a web search result.
          #
          #   @param citations [Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultCitations] Citation settings for this search result.
          #
          #   @param content [Array<Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultContent>] Array of text content blocks from the search result.
          #
          #   @param source [String] The URL source of the search result.
          #
          #   @param title [String] The title of the search result.
          #
          #   @param type [Symbol, :search_result]
        end
      end
    end
  end
end
