# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # The workspace has reached its limit of active API keys.
      class WorkspaceAPIKeyLimitExceededError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :workspace_api_key_limit_exceeded]

        # @return [Anthropic::Models::Organization::WorkspaceAPIKeyLimitExceededErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Organization::WorkspaceAPIKeyLimitExceededErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
