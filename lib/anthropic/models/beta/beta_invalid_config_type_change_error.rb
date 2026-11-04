# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # `config.type` differs from the environment's stored type, which cannot change
      # after creation.
      class BetaInvalidConfigTypeChangeError < Anthropic::Errors::BadRequestError
        # @!method error_code
        #   @return [Symbol, :invalid_config_type_change]

        # @return [Anthropic::Models::Beta::BetaInvalidConfigTypeChangeErrorDetails]
        def details
          Anthropic::Internal::Type::Converter.coerce(
            Anthropic::Beta::BetaInvalidConfigTypeChangeErrorDetails,
            Anthropic::Internal::Util.dig(body, [:error, :details])
          )
        end
      end
    end
  end
end
