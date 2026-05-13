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
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultContent::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsSearchResultContent::Type }

          # @!method initialize(text:, type:)
          #   Text content within a search result.
          #
          #   @param text [String] The text content.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultContent::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsSearchResultContent#type
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
