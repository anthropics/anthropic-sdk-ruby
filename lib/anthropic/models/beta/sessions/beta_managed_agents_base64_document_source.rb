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
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsBase64DocumentSource::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsBase64DocumentSource::Type }

          # @!method initialize(data:, media_type:, type:)
          #   Base64-encoded document data.
          #
          #   @param data [String] Base64-encoded document data.
          #
          #   @param media_type [String] MIME type of the document (e.g., "application/pdf").
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsBase64DocumentSource::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsBase64DocumentSource#type
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
