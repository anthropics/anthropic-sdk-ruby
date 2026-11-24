# frozen_string_literal: true

module Anthropic
  module Models
    class BetaExternalKeyProviderMismatchErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :external_key_provider_mismatch]
      required :error_code, const: :external_key_provider_mismatch

      # @!method initialize(error_code: :external_key_provider_mismatch)
      #   The External Key is held by a key management service that this endpoint does not
      #   take. The message names the field and the service it takes.
      #
      #   @param error_code [Symbol, :external_key_provider_mismatch]
    end
  end
end
