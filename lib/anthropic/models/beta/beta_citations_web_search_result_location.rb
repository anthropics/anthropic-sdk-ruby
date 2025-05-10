# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaCitationsWebSearchResultLocation < Anthropic::Internal::Type::BaseModel
        # @!attribute cited_text
        #
        #   @return [String]
        required :cited_text, String

        # @!attribute encrypted_index
        #
        #   @return [String]
        required :encrypted_index, String

        # @!attribute title
        #
        #   @return [String, nil]
        required :title, String, nil?: true

        # @!attribute type
        #
        #   @return [Symbol, :web_search_result_location]
        required :type, const: :web_search_result_location

        # @!attribute url
        #
        #   @return [String]
        required :url, String

        # @!method initialize(cited_text:, encrypted_index:, title:, url:, type: :web_search_result_location)
        #   @param cited_text [String]
        #   @param encrypted_index [String]
        #   @param title [String, nil]
        #   @param url [String]
        #   @param type [Symbol, :web_search_result_location]
      end
    end

    BetaCitationsWebSearchResultLocation = Beta::BetaCitationsWebSearchResultLocation
  end
end
