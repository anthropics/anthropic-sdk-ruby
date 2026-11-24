# frozen_string_literal: true

module Anthropic
  module Models
    class BetaExternalKeyNotFoundErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :external_key_not_found]
      required :error_code, const: :external_key_not_found

      # @!method initialize(error_code: :external_key_not_found)
      #   The organization has no active External Key with this ID. The message names the
      #   field.
      #
      #   @param error_code [Symbol, :external_key_not_found]
    end
  end
end
