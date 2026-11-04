# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaAPIKeyScopeMissingErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :api_key_scope_missing]
          required :error_code, const: :api_key_scope_missing

          # @!method initialize(error_code: :api_key_scope_missing)
          #   The API key lacks the scope the request needs: `read:claude_tag` for a read,
          #   `write:claude_tag` for a change.
          #
          #   @param error_code [Symbol, :api_key_scope_missing]
        end
      end
    end
  end
end
