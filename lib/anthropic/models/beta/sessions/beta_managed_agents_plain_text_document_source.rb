# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsPlainTextDocumentSource < Anthropic::Internal::Type::BaseModel
          # @!attribute data
          #   The plain text content.
          #
          #   @return [String]
          required :data, String

          # @!attribute media_type
          #   MIME type of the text content. Must be "text/plain".
          #
          #   @return [Symbol, :"text/plain"]
          required :media_type, const: :"text/plain"

          # @!attribute type
          #
          #   @return [Symbol, :text]
          required :type, const: :text

          # @!method initialize(data:, media_type: :"text/plain", type: :text)
          #   Plain text document content.
          #
          #   @param data [String] The plain text content.
          #
          #   @param media_type [Symbol, :"text/plain"] MIME type of the text content. Must be "text/plain".
          #
          #   @param type [Symbol, :text]
        end
      end
    end
  end
end
