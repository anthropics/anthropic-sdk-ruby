# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationDisabledReasonSustainedFailure < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :sustained_failure]
          required :type, const: :sustained_failure

          # @!method initialize(type: :sustained_failure)
          #   The API disabled the destination because deliveries to it failed, with no
          #   successful delivery in between, for longer than a threshold that Anthropic
          #   configures and that is not part of this contract. The reason is
          #   `invalid_address` instead when the most recent failed delivery failed with an
          #   invalid address.
          #
          #   @param type [Symbol, :sustained_failure]
        end
      end
    end
  end
end
