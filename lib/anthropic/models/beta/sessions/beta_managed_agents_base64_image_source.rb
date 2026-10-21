# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsBase64ImageSource < Anthropic::Internal::Type::BaseModel
          # @!attribute data
          #   Base64-encoded image data.
          #
          #   @return [String]
          required :data, String

          # @!attribute media_type
          #   MIME type of the image (e.g., "image/png", "image/jpeg", "image/gif",
          #   "image/webp").
          #
          #   @return [String]
          required :media_type, String

          # @!attribute type
          #
          #   @return [Symbol, :base64]
          required :type, const: :base64

          # @!method initialize(data:, media_type:, type: :base64)
          #   Base64-encoded image data.
          #
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsBase64ImageSource} for more
          #   details.
          #
          #   @param data [String] Base64-encoded image data.
          #
          #   @param media_type [String] MIME type of the image (e.g., "image/png", "image/jpeg", "image/gif", "image/web
          #
          #   @param type [Symbol, :base64]
        end
      end
    end
  end
end
