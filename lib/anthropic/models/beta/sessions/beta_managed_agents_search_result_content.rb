# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsSearchResultContent < Anthropic::Internal::Type::BaseModel
          # @!attribute text
          #   The text content.
          #
          #   @return [String]
          required :text, String

          # @!attribute type
          #
          #   @return [Symbol, :text]
          required :type, const: :text

          # @!method initialize(text:, type: :text)
          #   Text content within a search result.
          #
          #   @param text [String] The text content.
          #
          #   @param type [Symbol, :text]
        end
      end
    end
  end
end
