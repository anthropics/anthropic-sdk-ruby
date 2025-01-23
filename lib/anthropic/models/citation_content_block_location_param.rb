# frozen_string_literal: true

module Anthropic
  module Models
    # @example
    # ```ruby
    # citation_content_block_location_param => {
    #   cited_text: String,
    #   document_index: Integer,
    #   document_title: String,
    #   end_block_index: Integer,
    #   start_block_index: Integer
    # }
    # ```
    class CitationContentBlockLocationParam < Anthropic::BaseModel
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

      # @!attribute start_block_index
      #
      #   @return [Integer]
      required :start_block_index, Integer

      # @!attribute type
      #
      #   @return [Symbol, Anthropic::Models::CitationContentBlockLocationParam::Type]
      required :type, enum: -> { Anthropic::Models::CitationContentBlockLocationParam::Type }

      # @!parse
      #   # @param cited_text [String]
      #   # @param document_index [Integer]
      #   # @param document_title [String, nil]
      #   # @param end_block_index [Integer]
      #   # @param start_block_index [Integer]
      #   # @param type [String]
      #   #
      #   def initialize(cited_text:, document_index:, document_title:, end_block_index:, start_block_index:, type:, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void

      # @example
      # ```ruby
      # case type
      # in :content_block_location
      #   # ...
      # end
      # ```
      class Type < Anthropic::Enum
        CONTENT_BLOCK_LOCATION = :content_block_location

        finalize!
      end
    end
  end
end
