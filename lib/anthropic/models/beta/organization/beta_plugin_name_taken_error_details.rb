# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginNameTakenErrorDetails < Anthropic::Internal::Type::BaseModel
          # @!attribute error_code
          #
          #   @return [Symbol, :plugin_name_taken]
          required :error_code, const: :plugin_name_taken

          # @!attribute plugin_id
          #
          #   @return [String, nil]
          optional :plugin_id, String, nil?: true

          # @!method initialize(plugin_id: nil, error_code: :plugin_name_taken)
          #   The marketplace already holds this name. `plugin_id` is the Plugin that holds
          #   it, and can be absent.
          #
          #   @param plugin_id [String, nil]
          #   @param error_code [Symbol, :plugin_name_taken]
        end
      end
    end
  end
end
