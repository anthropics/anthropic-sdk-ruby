# frozen_string_literal: true

module Anthropic
  module Models
    class BetaStorageInUseErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :storage_in_use]
      required :error_code, const: :storage_in_use

      # @!method initialize(error_code: :storage_in_use)
      #   The bucket is already in use, or was in use recently. Name a different bucket.
      #
      #   @param error_code [Symbol, :storage_in_use]
    end
  end
end
