# frozen_string_literal: true

module Anthropic
  module Models
    class WebSearchResultBlockParam < Anthropic::Internal::Type::BaseModel
      # @!attribute encrypted_content
      #
      #   @return [String]
      required :encrypted_content, String

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

      # @!attribute page_age
      #
      #   @return [String, nil]
      optional :page_age, String, nil?: true

      # @!method initialize(encrypted_content:, title:, url:, page_age: nil, type: :web_search_result)
      #   @param encrypted_content [String]
      #   @param title [String]
      #   @param url [String]
      #   @param page_age [String, nil]
      #   @param type [Symbol, :web_search_result]
    end
  end
end
