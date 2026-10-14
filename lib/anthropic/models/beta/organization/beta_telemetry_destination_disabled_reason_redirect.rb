# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationDisabledReasonRedirect < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :redirect]
          required :type, const: :redirect

          # @!method initialize(type: :redirect)
          #   The API disabled the destination because the endpoint answered a delivery with a
          #   3xx status. Redirects are never followed, and one such answer disables the
          #   destination at once.
          #
          #   @param type [Symbol, :redirect]
        end
      end
    end
  end
end
