# frozen_string_literal: true

module Anthropic
  module Models
    class CitationsSearchResultLocation < Anthropic::Internal::Type::BaseModel
      # @!attribute cited_text
      #   The full text of the cited block range, concatenated.
      #
      #   Always equals the contents of `content[start_block_index:end_block_index]`
      #   joined together. The text block is the minimal citable unit; this field is never
      #   a substring of a single block. Not counted toward output tokens, and not counted
      #   toward input tokens when sent back in subsequent turns.
      #
      #   @return [String]
      required :cited_text, String

      # @!attribute end_block_index
      #   Exclusive 0-based end index of the cited block range in the source's `content`
      #   array.
      #
      #   Always greater than `start_block_index`; a single-block citation has
      #   `end_block_index = start_block_index + 1`.
      #
      #   @return [Integer]
      required :end_block_index, Integer

      # @!attribute search_result_index
      #   0-based index of the cited search result among all `search_result` content
      #   blocks in the request, in the order they appear across messages and tool
      #   results.
      #
      #   Counted separately from `document_index`; server-side web search results are not
      #   included in this count.
      #
      #   @return [Integer]
      required :search_result_index, Integer

      # @!attribute source
      #
      #   @return [String]
      required :source, String

      # @!attribute start_block_index
      #   0-based index of the first cited block in the source's `content` array.
      #
      #   @return [Integer]
      required :start_block_index, Integer

      # @!attribute title
      #
      #   @return [String, nil]
      required :title, String, nil?: true

      # @!attribute type
      #
      #   @return [Symbol, :search_result_location]
      required :type, const: :search_result_location

      # @!method initialize(cited_text:, end_block_index:, search_result_index:, source:, start_block_index:, title:, type: :search_result_location)
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::CitationsSearchResultLocation} for more details.
      #
      #   @param cited_text [String] The full text of the cited block range, concatenated.
      #
      #   @param end_block_index [Integer] Exclusive 0-based end index of the cited block range in the source's `content` a
      #
      #   @param search_result_index [Integer] 0-based index of the cited search result among all `search_result` content block
      #
      #   @param source [String]
      #
      #   @param start_block_index [Integer] 0-based index of the first cited block in the source's `content` array.
      #
      #   @param title [String, nil]
      #
      #   @param type [Symbol, :search_result_location]
    end
  end
end
