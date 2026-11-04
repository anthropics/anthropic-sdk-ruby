# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The API key lacks the scope the request needs: `read:claude_tag` for a read,
        # `write:claude_tag` for a change.
        class BetaAPIKeyScopeMissingError < Anthropic::Errors::PermissionDeniedError
          # @!method error_code
          #   @return [Symbol, :api_key_scope_missing]

          # @return [Anthropic::Models::Beta::Organization::BetaAPIKeyScopeMissingErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaAPIKeyScopeMissingErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
