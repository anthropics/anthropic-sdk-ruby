# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaEnvironmentNotFoundErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :environment_not_found]
        required :error_code, const: :environment_not_found

        # @!method initialize(error_code: :environment_not_found)
        #   `settings.environment_id` names no Environment within the organization's reach.
        #
        #   @param error_code [Symbol, :environment_not_found]
      end
    end

    BetaEnvironmentNotFoundErrorDetails = Beta::BetaEnvironmentNotFoundErrorDetails
  end
end
