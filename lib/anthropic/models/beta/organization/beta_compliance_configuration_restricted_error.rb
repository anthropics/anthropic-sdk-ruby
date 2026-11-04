# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The organization's compliance configuration does not let Claude Tag store
        # anything new.
        class BetaComplianceConfigurationRestrictedError < Anthropic::Errors::PermissionDeniedError
          # @!method error_code
          #   @return [Symbol, :compliance_configuration_restricted]

          # @return [Anthropic::Models::Beta::Organization::BetaComplianceConfigurationRestrictedErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaComplianceConfigurationRestrictedErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
