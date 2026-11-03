# frozen_string_literal: true

module Anthropic
  module Models
    module ErrorType
      extend Anthropic::Internal::Type::Enum

      INVALID_REQUEST_ERROR = :invalid_request_error
      AUTHENTICATION_ERROR = :authentication_error
      BILLING_ERROR = :billing_error
      PERMISSION_ERROR = :permission_error
      NOT_FOUND_ERROR = :not_found_error
      RATE_LIMIT_ERROR = :rate_limit_error
      TIMEOUT_ERROR = :timeout_error
      API_ERROR = :api_error
      OVERLOADED_ERROR = :overloaded_error
      MEMORY_PRECONDITION_FAILED_ERROR = :memory_precondition_failed_error
      MEMORY_PATH_CONFLICT_ERROR = :memory_path_conflict_error
      CONFLICT_ERROR = :conflict_error

      # @!method self.values
      #   @return [Array<Symbol>]
    end
  end
end
