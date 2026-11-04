# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The Plugin version was stored but is not yet usable in claude.ai. `plugin_id`
        # and `plugin_version_id` identify what was stored.
        class BetaRegistrationPendingError < Anthropic::Errors::ServiceUnavailableError
          # @!method error_code
          #   @return [Symbol, :registration_pending]

          # @return [Anthropic::Models::Beta::Organization::BetaRegistrationPendingErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaRegistrationPendingErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
