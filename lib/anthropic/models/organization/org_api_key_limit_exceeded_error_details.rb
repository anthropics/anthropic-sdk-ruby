# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class OrgAPIKeyLimitExceededErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :org_api_key_limit_exceeded]
        required :error_code, const: :org_api_key_limit_exceeded

        # @!method initialize(error_code: :org_api_key_limit_exceeded)
        #   The organization has reached its limit of active API keys.
        #
        #   @param error_code [Symbol, :org_api_key_limit_exceeded]
      end
    end
  end
end
