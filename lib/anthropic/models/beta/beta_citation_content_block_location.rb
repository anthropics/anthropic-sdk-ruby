# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCitationContentBlockLocation < Anthropic::Internal::Type::BaseModel
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

        # @!attribute document_index
        #
        #   @return [Integer]
        required :document_index, Integer

        # @!attribute document_title
        #
        #   @return [String, nil]
        required :document_title, String, nil?: true

        # @!attribute end_block_index
        #   Exclusive 0-based end index of the cited block range in the source's `content`
        #   array.
        #
        #   Always greater than `start_block_index`; a single-block citation has
        #   `end_block_index = start_block_index + 1`.
        #
        #   @return [Integer]
        required :end_block_index, Integer

        # @!attribute file_id
        #
        #   @return [String, nil]
        required :file_id, String, nil?: true

        # @!attribute start_block_index
        #   0-based index of the first cited block in the source's `content` array.
        #
        #   @return [Integer]
        required :start_block_index, Integer

        # @!attribute type
        #
        #   @return [Symbol, :content_block_location]
        required :type, const: :content_block_location

        # @!method initialize(cited_text:, document_index:, document_title:, end_block_index:, file_id:, start_block_index:, type: :content_block_location)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::BetaCitationContentBlockLocation} for more details.
        #
        #   @param cited_text [String] The full text of the cited block range, concatenated.
        #
        #   @param document_index [Integer]
        #
        #   @param document_title [String, nil]
        #
        #   @param end_block_index [Integer] Exclusive 0-based end index of the cited block range in the source's `content` a
        #
        #   @param file_id [String, nil]
        #
        #   @param start_block_index [Integer] 0-based index of the first cited block in the source's `content` array.
        #
        #   @param type [Symbol, :content_block_location]
      end
    end

    BetaCitationContentBlockLocation = Beta::BetaCitationContentBlockLocation
  end
end
