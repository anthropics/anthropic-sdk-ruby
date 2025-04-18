# frozen_string_literal: true

module Anthropic
  module Models
    class URLImageSource < Anthropic::Internal::Type::BaseModel
      # @!attribute type
      #
      #   @return [Symbol, :url]
      required :type, const: :url

      # @!attribute url
      #
      #   @return [String]
      required :url, String

      # @!method initialize(url:, type: :url)
      #   @param url [String]
      #   @param type [Symbol, :url]
    end
  end
end
