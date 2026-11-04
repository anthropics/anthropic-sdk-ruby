# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # The marketplace already holds this name. `plugin_id` is the Plugin that holds
        # it, and can be absent.
        class BetaPluginNameTakenError < Anthropic::Errors::ConflictError
          # @!method error_code
          #   @return [Symbol, :plugin_name_taken]

          # @return [Anthropic::Models::Beta::Organization::BetaPluginNameTakenErrorDetails]
          def details
            Anthropic::Internal::Type::Converter.coerce(
              Anthropic::Beta::Organization::BetaPluginNameTakenErrorDetails,
              Anthropic::Internal::Util.dig(body, [:error, :details])
            )
          end
        end
      end
    end
  end
end
