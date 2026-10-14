# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaTelemetryDestinationTestSuccess < Anthropic::Internal::Type::BaseModel
          # @!attribute type
          #
          #   @return [Symbol, :success]
          required :type, const: :success

          # @!method initialize(type: :success)
          #   The destination answered the test span with a 2xx status.
          #
          #   @param type [Symbol, :success]
        end
      end
    end
  end
end
