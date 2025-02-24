# frozen_string_literal: true

module Anthropic
  module Models
    class SignatureDelta < Anthropic::BaseModel
      # @!attribute signature
      #
      #   @return [String]
      required :signature, String

      # @!attribute type
      #
      #   @return [Symbol, :signature_delta]
      required :type, const: :signature_delta

      # @!parse
      #   # @param signature [String]
      #   # @param type [Symbol, :signature_delta]
      #   #
      #   def initialize(signature:, type: :signature_delta, **) = super

      # def initialize: (Hash | Anthropic::BaseModel) -> void
    end
  end
end
