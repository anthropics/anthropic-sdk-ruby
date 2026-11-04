# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaRegistrationPendingErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :registration_pending]
          required :error_code, const: :registration_pending

          # @!attribute plugin_id
          #
          #   @return [String]
          required :plugin_id, String

          # @!attribute plugin_version_id
          #
          #   @return [String]
          required :plugin_version_id, String

          # @!method initialize(plugin_id:, plugin_version_id:, error_code: :registration_pending)
          #   The Plugin version was stored but is not yet usable in claude.ai. `plugin_id`
          #   and `plugin_version_id` identify what was stored.
          #
          #   @param plugin_id [String]
          #   @param plugin_version_id [String]
          #   @param error_code [Symbol, :registration_pending]
        end
      end
    end
  end
end
