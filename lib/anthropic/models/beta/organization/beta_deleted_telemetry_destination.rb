# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::TelemetryDestinations#delete
        class BetaDeletedTelemetryDestination < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   ID of the deleted destination (`tdst_...`).
          #
          #   @return [String]
          required :id, String

          # @!attribute type
          #
          #   @return [Symbol, :telemetry_destination_deleted]
          required :type, const: :telemetry_destination_deleted

          # @!method initialize(id:, type: :telemetry_destination_deleted)
          #   Confirmation that a destination was deleted.
          #
          #   @param id [String] ID of the deleted destination (`tdst_...`).
          #
          #   @param type [Symbol, :telemetry_destination_deleted]
        end
      end
    end
  end
end
