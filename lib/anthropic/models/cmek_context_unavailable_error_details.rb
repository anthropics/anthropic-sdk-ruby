# frozen_string_literal: true

module Anthropic
  module Models
    class CMEKContextUnavailableErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :cmek_context_unavailable]
      required :error_code, const: :cmek_context_unavailable

      # @!method initialize(error_code: :cmek_context_unavailable)
      #   The workspace's encryption settings could not be read, so the request was
      #   refused. Retry in a few minutes.
      #
      #   @param error_code [Symbol, :cmek_context_unavailable]
    end
  end
end
