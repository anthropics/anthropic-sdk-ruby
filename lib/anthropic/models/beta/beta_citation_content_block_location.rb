# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCitationContentBlockLocation < Anthropic::Internal::Type::BaseModel
        # @!attribute cited_text
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
        #
        #   @return [Integer]
        required :end_block_index, Integer

        # @!attribute file_id
        #
        #   @return [String, nil]
        required :file_id, String, nil?: true

        # @!attribute start_block_index
        #
        #   @return [Integer]
        required :start_block_index, Integer

        # @!attribute type
        #
        #   @return [Symbol, :content_block_location]
        required :type, const: :content_block_location

        # @!method initialize(cited_text:, document_index:, document_title:, end_block_index:, file_id:, start_block_index:, type: :content_block_location)
        #   @param cited_text [String]
        #   @param document_index [Integer]
        #   @param document_title [String, nil]
        #   @param end_block_index [Integer]
        #   @param file_id [String, nil]
        #   @param start_block_index [Integer]
        #   @param type [Symbol, :content_block_location]
      end
    end

    BetaCitationContentBlockLocation = Beta::BetaCitationContentBlockLocation
  end
end
