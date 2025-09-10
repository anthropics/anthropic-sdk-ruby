# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaWebFetchBlockParam < Anthropic::Internal::Type::BaseModel
        # @!attribute content
        #
        #   @return [Anthropic::Models::Beta::BetaRequestDocumentBlock]
        required :content, -> { Anthropic::Beta::BetaRequestDocumentBlock }

        # @!attribute type
        #
        #   @return [Symbol, :web_fetch_result]
        required :type, const: :web_fetch_result

        # @!attribute url
        #   Fetched content URL
        #
        #   @return [String]
        required :url, String

        # @!attribute retrieved_at
        #   ISO 8601 timestamp when the content was retrieved
        #
        #   @return [String, nil]
        optional :retrieved_at, String, nil?: true

        # @!method initialize(content:, url:, retrieved_at: nil, type: :web_fetch_result)
        #   @param content [Anthropic::Models::Beta::BetaRequestDocumentBlock]
        #
        #   @param url [String] Fetched content URL
        #
        #   @param retrieved_at [String, nil] ISO 8601 timestamp when the content was retrieved
        #
        #   @param type [Symbol, :web_fetch_result]
      end
    end

    BetaWebFetchBlockParam = Beta::BetaWebFetchBlockParam
  end
end
