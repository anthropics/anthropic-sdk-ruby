# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaComplianceSettingsStateEnabled < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :enabled]
          required :type, const: :enabled

          # @!method initialize(type: :enabled)
          #   @param type [Symbol, :enabled]
        end
      end
    end
  end
end
