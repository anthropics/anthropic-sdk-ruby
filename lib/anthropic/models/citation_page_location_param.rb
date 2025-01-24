# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # citation_page_location_param => {
    #   cited_text: String,
    #   document_index: Integer,
    #   document_title: String,
    #   end_page_number: Integer,
    #   start_page_number: Integer
    # }
    # ```
    class CitationPageLocationParam < Anthropic::BaseModel
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

      # @!attribute end_page_number
      #
      #   @return [Integer]
      required :end_page_number, Integer

      # @!attribute start_page_number
      #
      #   @return [Integer]
      required :start_page_number, Integer

      # @!attribute type
      #
      #   @return [Symbol, :page_location]
      required :type, const: :page_location

      # @!parse
      #   # @param cited_text [String]
      #   # @param document_index [Integer]
      #   # @param document_title [String, nil]
      #   # @param end_page_number [Integer]
      #   # @param start_page_number [Integer]
      #   # @param type [String]
      #   #
      #   def initialize(
      #     cited_text:,
      #     document_index:,
      #     document_title:,
      #     end_page_number:,
      #     start_page_number:,
      #     type: :page_location,
      #     **
      #   )
      #     super
      #   end

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
