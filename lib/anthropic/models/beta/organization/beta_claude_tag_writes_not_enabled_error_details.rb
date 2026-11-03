# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaClaudeTagWritesNotEnabledErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :claude_tag_writes_not_enabled]
          required :error_code, const: :claude_tag_writes_not_enabled

          # @!method initialize(error_code: :claude_tag_writes_not_enabled)
          #   Changes through the Claude Tag API are not enabled for the organization.
          #
          #   @param error_code [Symbol, :claude_tag_writes_not_enabled]
        end
      end
    end
  end
end
