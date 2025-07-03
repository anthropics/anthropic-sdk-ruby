# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaSearchResultLocationCitationParam < Anthropic::Internal::Type::BaseModel
        # @!attribute cited_text
        #
        #   @return [String]
        required :cited_text, String

        # @!attribute end_block_index
        #
        #   @return [Integer]
        required :end_block_index, Integer

        # @!attribute search_result_index
        #
        #   @return [Integer]
        required :search_result_index, Integer

        # @!attribute source
        #
        #   @return [String]
        required :source, String

        # @!attribute start_block_index
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
        #   @param cited_text [String]
        #   @param end_block_index [Integer]
        #   @param search_result_index [Integer]
        #   @param source [String]
        #   @param start_block_index [Integer]
        #   @param title [String, nil]
        #   @param type [Symbol, :search_result_location]
      end
    end

    BetaSearchResultLocationCitationParam = Beta::BetaSearchResultLocationCitationParam
  end
end
