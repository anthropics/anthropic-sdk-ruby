# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # Changes through the Claude Tag API are not enabled for the organization.
        class BetaClaudeTagWritesNotEnabledError < Anthropic::Errors::PermissionDeniedError
          # @!method error_code
          #   @return [Symbol, :claude_tag_writes_not_enabled]

          # @return [Anthropic::Models::Beta::Organization::BetaClaudeTagWritesNotEnabledErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaClaudeTagWritesNotEnabledErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
