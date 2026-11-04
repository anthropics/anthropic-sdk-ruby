# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaOrganizationLevelScopedAPIKeyRequiredErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :organization_level_scoped_api_key_required]
          required :error_code, const: :organization_level_scoped_api_key_required

          # @!method initialize(error_code: :organization_level_scoped_api_key_required)
          #   The credential is not a scoped API key that is bound at the organization level.
          #
          #   @param error_code [Symbol, :organization_level_scoped_api_key_required]
        end
      end
    end
  end
end
