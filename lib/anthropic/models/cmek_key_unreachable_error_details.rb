# frozen_string_literal: true

module Anthropic
  module Models
    class CMEKKeyUnreachableErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :cmek_key_unreachable]
      required :error_code, const: :cmek_key_unreachable

      # @!method initialize(error_code: :cmek_key_unreachable)
      #   The workspace's customer-managed encryption key could not be reached. Retry the
      #   request; if this continues, check that the key is available in your key
      #   management service, or contact Anthropic support.
      #
      #   @param error_code [Symbol, :cmek_key_unreachable]
    end
  end
end
