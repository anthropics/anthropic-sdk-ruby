# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaInvalidMetadataErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :invalid_metadata]
        required :error_code, const: :invalid_metadata

        # @!method initialize(error_code: :invalid_metadata)
        #   `metadata` has too many keys, a key or value that is too long, or a reserved
        #   key. The message names each problem.
        #
        #   @param error_code [Symbol, :invalid_metadata]
      end
    end

    BetaInvalidMetadataErrorDetails = Beta::BetaInvalidMetadataErrorDetails
  end
end
