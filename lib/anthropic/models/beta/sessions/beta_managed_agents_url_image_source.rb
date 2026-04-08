# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsURLImageSource < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsURLImageSource::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsURLImageSource::Type }

          # @!attribute url
          #   URL of the image to fetch.
          #
          #   @return [String]
          required :url, String

          # @!method initialize(type:, url:)
          #   Image referenced by URL.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsURLImageSource::Type]
          #
          #   @param url [String] URL of the image to fetch.

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsURLImageSource#type
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
