# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationDisabledReasonCaller < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :caller]
          required :type, const: :caller

          # @!method initialize(type: :caller)
          #   A caller disabled the destination with an update that set `state` to `disabled`.
          #
          #   @param type [Symbol, :caller]
        end
      end
    end
  end
end
