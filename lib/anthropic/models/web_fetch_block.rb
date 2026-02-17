# frozen_string_literal: true

module Anthropic
  module Models
    class WebFetchBlock < Anthropic::Internal::Type::BaseModel
      # @!attribute content
      #
      #   @return [Anthropic::Models::DocumentBlock]
      required :content, -> { Anthropic::DocumentBlock }

      # @!attribute retrieved_at
      #   ISO 8601 timestamp when the content was retrieved
      #
      #   @return [String, nil]
      required :retrieved_at, String, nil?: true

      # @!attribute type
      #
      #   @return [Symbol, :web_fetch_result]
      required :type, const: :web_fetch_result

      # @!attribute url
      #   Fetched content URL
      #
      #   @return [String]
      required :url, String

      # @!method initialize(content:, retrieved_at:, url:, type: :web_fetch_result)
      #   @param content [Anthropic::Models::DocumentBlock]
      #
      #   @param retrieved_at [String, nil] ISO 8601 timestamp when the content was retrieved
      #
      #   @param url [String] Fetched content URL
      #
      #   @param type [Symbol, :web_fetch_result]
    end
  end
end
