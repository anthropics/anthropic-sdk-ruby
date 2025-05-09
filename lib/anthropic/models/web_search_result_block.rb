# frozen_string_literal: true

module Anthropic
  module Models
    class WebSearchResultBlock < Anthropic::Internal::Type::BaseModel
      # @!attribute encrypted_content
      #
      #   @return [String]
      required :encrypted_content, String

      # @!attribute page_age
      #
      #   @return [String, nil]
      required :page_age, String, nil?: true

      # @!attribute title
      #
      #   @return [String]
      required :title, String

      # @!attribute type
      #
      #   @return [Symbol, :web_search_result]
      required :type, const: :web_search_result

      # @!attribute url
      #
      #   @return [String]
      required :url, String

      # @!method initialize(encrypted_content:, page_age:, title:, url:, type: :web_search_result)
      #   @param encrypted_content [String]
      #   @param page_age [String, nil]
      #   @param title [String]
      #   @param url [String]
      #   @param type [Symbol, :web_search_result]
    end
  end
end
