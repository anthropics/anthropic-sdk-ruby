# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaEnvironmentUpdateDisabledErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :environment_update_disabled]
        required :error_code, const: :environment_update_disabled

        # @!method initialize(error_code: :environment_update_disabled)
        #   Anthropic has turned off updating environments for this organization. Existing
        #   environments still work as they are.
        #
        #   @param error_code [Symbol, :environment_update_disabled]
      end
    end

    BetaEnvironmentUpdateDisabledErrorDetails = Beta::BetaEnvironmentUpdateDisabledErrorDetails
  end
end
