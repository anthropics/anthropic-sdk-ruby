# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaGrantRequiredErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :grant_required]
          required :error_code, const: :grant_required

          # @!method initialize(error_code: :grant_required)
          #   Anthropic has not approved External Storage for the organization, for the
          #   Workspace or, for storage bound to a user profile, for that user profile.
          #   Contact your Anthropic account team.
          #
          #   @param error_code [Symbol, :grant_required]
        end
      end
    end
  end
end
