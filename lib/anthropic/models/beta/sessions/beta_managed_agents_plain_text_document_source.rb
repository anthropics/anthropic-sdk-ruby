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
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::MediaType]
          required :media_type,
                   enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::MediaType }

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::Type }

          # @!method initialize(data:, media_type:, type:)
          #   Plain text document content.
          #
          #   @param data [String] The plain text content.
          #
          #   @param media_type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::MediaType] MIME type of the text content. Must be "text/plain".
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource::Type]

          # MIME type of the text content. Must be "text/plain".
          #
          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource#media_type
          module MediaType
            extend Anthropic::Internal::Type::Enum

            TEXT_PLAIN = :"text/plain"

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsPlainTextDocumentSource#type
          module Type
            extend Anthropic::Internal::Type::Enum

            TEXT = :text

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
