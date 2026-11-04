# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaInvalidConfigTypeChangeErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :invalid_config_type_change]
        required :error_code, const: :invalid_config_type_change

        # @!method initialize(error_code: :invalid_config_type_change)
        #   `config.type` differs from the environment's stored type, which cannot change
        #   after creation.
        #
        #   @param error_code [Symbol, :invalid_config_type_change]
      end
    end

    BetaInvalidConfigTypeChangeErrorDetails = Beta::BetaInvalidConfigTypeChangeErrorDetails
  end
end
