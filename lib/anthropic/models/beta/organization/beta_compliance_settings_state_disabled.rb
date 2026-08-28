# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaComplianceSettingsStateDisabled < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :disabled]
          required :type, const: :disabled

          # @!method initialize(type: :disabled)
          #   @param type [Symbol, :disabled]
        end
      end
    end
  end
end
