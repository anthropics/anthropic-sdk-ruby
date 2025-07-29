# frozen_string_literal: true

module Anthropic
  module Models
    class CitationCharLocation < Anthropic::Internal::Type::BaseModel
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

      # @!attribute end_char_index
      #
      #   @return [Integer]
      required :end_char_index, Integer

      # @!attribute file_id
      #
      #   @return [String, nil]
      required :file_id, String, nil?: true

      # @!attribute start_char_index
      #
      #   @return [Integer]
      required :start_char_index, Integer

      # @!attribute type
      #
      #   @return [Symbol, :char_location]
      required :type, const: :char_location

      # @!method initialize(cited_text:, document_index:, document_title:, end_char_index:, file_id:, start_char_index:, type: :char_location)
      #   @param cited_text [String]
      #   @param document_index [Integer]
      #   @param document_title [String, nil]
      #   @param end_char_index [Integer]
      #   @param file_id [String, nil]
      #   @param start_char_index [Integer]
      #   @param type [Symbol, :char_location]
    end
  end
end
