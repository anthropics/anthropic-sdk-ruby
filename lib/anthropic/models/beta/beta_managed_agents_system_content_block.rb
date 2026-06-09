# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaManagedAgentsSystemContentBlock < Anthropic::Internal::Type::BaseModel
        # @!attribute text
        #   The text content.
        #
        #   @return [String]
        required :text, String

        # @!attribute type
        #
        #   @return [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSystemContentBlock::Type]
        required :type, enum: -> { Anthropic::Beta::BetaManagedAgentsSystemContentBlock::Type }

        # @!method initialize(text:, type:)
        #   Regular text content.
        #
        #   @param text [String] The text content.
        #
        #   @param type [Symbol, Anthropic::Models::Beta::BetaManagedAgentsSystemContentBlock::Type]

        # @see Anthropic::Models::Beta::BetaManagedAgentsSystemContentBlock#type
        module Type
          extend Anthropic::Internal::Type::Enum

          TEXT = :text

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end

    BetaManagedAgentsSystemContentBlock = Beta::BetaManagedAgentsSystemContentBlock
  end
end
