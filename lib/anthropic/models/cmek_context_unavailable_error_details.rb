# frozen_string_literal: true

module Anthropic
  module Models
    class CmekContextUnavailableErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :cmek_context_unavailable]
      required :error_code, const: :cmek_context_unavailable

      # @!method initialize(error_code: :cmek_context_unavailable)
      #   The request's workspace encryption context could not be resolved, so the request
      #   was refused. Retry in a few minutes.
      #
      #   @param error_code [Symbol, :cmek_context_unavailable]
    end
  end
end
