# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class WorkspaceAPIKeyLimitExceededErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :workspace_api_key_limit_exceeded]
        required :error_code, const: :workspace_api_key_limit_exceeded

        # @!method initialize(error_code: :workspace_api_key_limit_exceeded)
        #   The workspace has reached its limit of active API keys.
        #
        #   @param error_code [Symbol, :workspace_api_key_limit_exceeded]
      end
    end
  end
end
