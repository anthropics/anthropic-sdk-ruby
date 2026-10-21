# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsURLImageSource < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :url]
          required :type, const: :url

          # @!attribute url
          #   URL of the image to fetch.
          #
          #   @return [String]
          required :url, String

          # @!method initialize(url:, type: :url)
          #   Image referenced by URL.
          #
          #   @param url [String] URL of the image to fetch.
          #
          #   @param type [Symbol, :url]
        end
      end
    end
  end
end
