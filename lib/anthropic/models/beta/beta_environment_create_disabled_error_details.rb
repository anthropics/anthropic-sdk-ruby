# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaEnvironmentCreateDisabledErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :environment_create_disabled]
        required :error_code, const: :environment_create_disabled

        # @!method initialize(error_code: :environment_create_disabled)
        #   Anthropic has turned off creating environments for this organization. Existing
        #   environments still work.
        #
        #   @param error_code [Symbol, :environment_create_disabled]
      end
    end

    BetaEnvironmentCreateDisabledErrorDetails = Beta::BetaEnvironmentCreateDisabledErrorDetails
  end
end
