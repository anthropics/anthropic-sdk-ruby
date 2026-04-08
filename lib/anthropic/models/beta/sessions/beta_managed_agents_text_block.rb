# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Sessions
        class BetaManagedAgentsTextBlock < Anthropic::Internal::Type::BaseModel
          # @!attribute text
          #   The text content.
          #
          #   @return [String]
          required :text, String

          # @!attribute type
          #
          #   @return [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock::Type]
          required :type, enum: -> { Anthropic::Beta::Sessions::BetaManagedAgentsTextBlock::Type }

          # @!method initialize(text:, type:)
          #   Regular text content.
          #
          #   @param text [String] The text content.
          #
          #   @param type [Symbol, Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock::Type]

          # @see Anthropic::Models::Beta::Sessions::BetaManagedAgentsTextBlock#type
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
