# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The request can't use External Storage on this cloud provider. The error's
        # message says why.
        class BetaProviderNotAllowedError < Anthropic::Errors::BadRequestError
          # @!method error_code
          #   @return [Symbol, :provider_not_allowed]

          # @return [Anthropic::Models::Beta::Organization::BetaProviderNotAllowedErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaProviderNotAllowedErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
