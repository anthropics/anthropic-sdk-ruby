# frozen_string_literal: true

module Anthropic
  module Models
    class Base64PDFSource < Anthropic::BaseModel
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

      # @!parse
      #   # @param data [String]
      #   # @param media_type [Symbol, :"application/pdf"]
      #   # @param type [Symbol, :base64]
      #   #
      #   def initialize(data:, media_type: :"application/pdf", type: :base64, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
