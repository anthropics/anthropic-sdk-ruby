# frozen_string_literal: true

module Anthropic
  module Models
    class Base64PDFSource < Anthropic::Internal::Type::BaseModel
      # @!attribute data
      #
      #   @return [String]
      required :data, String

      # @!attribute media_type
      #
      #   @return [Symbol, :"application/pdf"]
      required :media_type, const: :"application/pdf"

      # @!attribute type
      #
      #   @return [Symbol, :base64]
      required :type, const: :base64

      # @!method initialize(data:, media_type: :"application/pdf", type: :base64)
      #   @param data [String]
      #   @param media_type [Symbol, :"application/pdf"]
      #   @param type [Symbol, :base64]
    end
  end
end
