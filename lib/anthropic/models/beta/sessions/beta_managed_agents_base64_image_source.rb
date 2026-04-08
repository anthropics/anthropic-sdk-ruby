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
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsBase64ImageSource::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsBase64ImageSource::Type }

          # @!method initialize(data:, media_type:, type:)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Sessions::BetaManagedAgentsBase64ImageSource} for more
          #   details.
          #
          #   Base64-encoded image data.
          #
          #   @param data [String] Base64-encoded image data.
          #
          #   @param media_type [String] MIME type of the image (e.g., "image/png", "image/jpeg", "image/gif", "image/web
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsBase64ImageSource::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsBase64ImageSource#type
          module Type
            extend Anthropic::Internal::Type::Enum

            BASE64 = :base64

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
