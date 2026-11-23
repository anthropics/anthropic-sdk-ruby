# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # `provider_config.region` is not a region where External Storage is available.
        class BetaUnsupportedRegionError < Anthropic::Errors::BadRequestError
          # @!method error_code
          #   @return [Symbol, :unsupported_region]

          # @return [Anthropic::Models::Beta::Organization::BetaUnsupportedRegionErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaUnsupportedRegionErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
