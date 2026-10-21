# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsURLDocumentSource < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :url]
          required :type, const: :url

          # @!attribute url
          #   URL of the document to fetch.
          #
          #   @return [String]
          required :url, String

          # @!method initialize(url:, type: :url)
          #   Document referenced by URL.
          #
          #   @param url [String] URL of the document to fetch.
          #
          #   @param type [Symbol, :url]
        end
      end
    end
  end
end
