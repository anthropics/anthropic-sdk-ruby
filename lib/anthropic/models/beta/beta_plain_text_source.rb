# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaPlainTextSource < Anthropic::Internal::Type::BaseModel
        # @!attribute data
        #
        #   @return [String]
        required :data, String

        # @!attribute media_type
        #
        #   @return [Symbol, :"text/plain"]
        required :media_type, const: :"text/plain"

        # @!attribute type
        #
        #   @return [Symbol, :text]
        required :type, const: :text

        # @!method initialize(data:, media_type: :"text/plain", type: :text)
        #   @param data [String]
        #   @param media_type [Symbol, :"text/plain"]
        #   @param type [Symbol, :text]
      end
    end

    BetaPlainTextSource = Beta::BetaPlainTextSource
  end
end
