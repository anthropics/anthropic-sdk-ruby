# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @example
      # ```ruby
      # beta_citation_page_location => {
      #   cited_text: String,
      #   document_index: Integer,
      #   document_title: String,
      #   end_page_number: Integer,
      #   start_page_number: Integer
      # }
      # ```
      class BetaCitationPageLocation < Anthropic::BaseModel
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
        #   @return [Symbol, Anthropic::Models::Beta::BetaCitationPageLocation::Type]
        required :type, enum: -> { Anthropic::Models::Beta::BetaCitationPageLocation::Type }

        # @!parse
        #   # @param cited_text [String]
        #   # @param document_index [Integer]
        #   # @param document_title [String, nil]
        #   # @param end_page_number [Integer]
        #   # @param start_page_number [Integer]
        #   # @param type [String]
        #   #
        #   def initialize(cited_text:, document_index:, document_title:, end_page_number:, start_page_number:, type:, **) = super

        # def initialize: (Hash | Anthropic::BaseModel) -> void

        # @example
        # ```ruby
        # case type
        # in :page_location
        #   # ...
        # end
        # ```
        class Type < Anthropic::Enum
          PAGE_LOCATION = :page_location

          finalize!
        end
      end
    end

    BetaCitationPageLocation = Beta::BetaCitationPageLocation
  end
end
