# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        # The marketplace already holds this name. `plugin_id` is the Plugin that holds
        # it, and can be absent.
        class BetaPluginNameTakenError < Anthropic::Errors::ConflictError
          sig { returns(Symbol) }
          def error_code
          end

          sig do
            returns(
              Anthropic::Beta::Organization::BetaPluginNameTakenErrorDetails
            )
          end
          def details
          end
        end
      end
    end
  end
end
