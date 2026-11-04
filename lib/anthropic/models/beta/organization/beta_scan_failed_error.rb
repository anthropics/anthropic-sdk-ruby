# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The version in `plugin_version_id` did not pass its content scan, so it cannot
        # be served.
        class BetaScanFailedError < Anthropic::Errors::BadRequestError
          # @!method error_code
          #   @return [Symbol, :scan_failed]

          # @return [Anthropic::Models::Beta::Organization::BetaScanFailedErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaScanFailedErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
