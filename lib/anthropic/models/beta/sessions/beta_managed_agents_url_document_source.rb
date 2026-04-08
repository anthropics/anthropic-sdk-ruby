# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsURLDocumentSource < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsURLDocumentSource::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsURLDocumentSource::Type }

          # @!attribute url
          #   URL of the document to fetch.
          #
          #   @return [String]
          required :url, String

          # @!method initialize(type:, url:)
          #   Document referenced by URL.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsURLDocumentSource::Type]
          #
          #   @param url [String] URL of the document to fetch.

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsURLDocumentSource#type
          module Type
            extend Anthropic::Internal::Type::Enum

            URL = :url

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
