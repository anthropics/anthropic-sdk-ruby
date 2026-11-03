# frozen_string_literal: true

module Anthropic
  module Models
    class AvailableToolsLimitExceededErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :available_tools_limit_exceeded]
      required :error_code, const: :available_tools_limit_exceeded

      # @!method initialize(error_code: :available_tools_limit_exceeded)
      #   The tools available after a message exceed a limit on their number or their
      #   size.
      #
      #   @param error_code [Symbol, :available_tools_limit_exceeded]
    end
  end
end
