# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsBase64DocumentSource < Anthropic::Internal::Type::BaseModel
          # @!attribute data
          #   Base64-encoded document data.
          #
          #   @return [String]
          required :data, String

          # @!attribute media_type
          #   MIME type of the document (e.g., "application/pdf").
          #
          #   @return [String]
          required :media_type, String

          # @!attribute type
          #
          #   @return [Symbol, :base64]
          required :type, const: :base64

          # @!method initialize(data:, media_type:, type: :base64)
          #   Base64-encoded document data.
          #
          #   @param data [String] Base64-encoded document data.
          #
          #   @param media_type [String] MIME type of the document (e.g., "application/pdf").
          #
          #   @param type [Symbol, :base64]
        end
      end
    end
  end
end
