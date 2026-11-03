# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaComplianceConfigurationRestrictedErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :compliance_configuration_restricted]
          required :error_code, const: :compliance_configuration_restricted

          # @!method initialize(error_code: :compliance_configuration_restricted)
          #   The organization's compliance configuration does not let Claude Tag store
          #   anything new.
          #
          #   @param error_code [Symbol, :compliance_configuration_restricted]
        end
      end
    end
  end
end
