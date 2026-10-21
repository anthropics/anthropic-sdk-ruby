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
        #   @return [Symbol, :text]
        required :type, const: :text

        # @!method initialize(text:, type: :text)
        #   Content block in a mid-conversation system message. Text-only.
        #
        #   @param text [String] The text content.
        #
        #   @param type [Symbol, :text]
      end
    end

    BetaManagedAgentsSystemContentBlock = Beta::BetaManagedAgentsSystemContentBlock
  end
end
