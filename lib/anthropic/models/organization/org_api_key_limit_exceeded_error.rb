# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # The organization has reached its limit of active API keys.
      class OrgAPIKeyLimitExceededError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :org_api_key_limit_exceeded]

        # @return [Anthropic::Models::Organization::OrgAPIKeyLimitExceededErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::OrgAPIKeyLimitExceededErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
