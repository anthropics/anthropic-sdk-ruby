# frozen_string_literal: true

module Anthropic
  module Models
    class CmekKeyDisabledErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :cmek_key_disabled]
      required :error_code, const: :cmek_key_disabled

      # @!method initialize(error_code: :cmek_key_disabled)
      #   The workspace's customer-managed encryption key is disabled or revoked.
      #   Re-enable the key, then retry.
      #
      #   @param error_code [Symbol, :cmek_key_disabled]
    end
  end
end
