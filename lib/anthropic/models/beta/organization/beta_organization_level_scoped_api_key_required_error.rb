# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The credential is not a scoped API key that is bound at the organization level.
        class BetaOrganizationLevelScopedAPIKeyRequiredError < Anthropic::Errors::PermissionDeniedError
          # @!method error_code
          #   @return [Symbol, :organization_level_scoped_api_key_required]

          # @return [Anthropic::Models::Beta::Organization::BetaOrganizationLevelScopedAPIKeyRequiredErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaOrganizationLevelScopedAPIKeyRequiredErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
