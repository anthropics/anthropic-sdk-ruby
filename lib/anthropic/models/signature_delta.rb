# frozen_string_literal: true

module Anthropic
  module Models
    class SignatureDelta < Anthropic::Internal::Type::BaseModel
      # @!attribute signature
      #
      #   @return [String]
      required :signature, String

      # @!attribute type
      #
      #   @return [Symbol, :signature_delta]
      required :type, const: :signature_delta

      # @!method initialize(signature:, type: :signature_delta)
      #   @param signature [String]
      #   @param type [Symbol, :signature_delta]
    end
  end
end
