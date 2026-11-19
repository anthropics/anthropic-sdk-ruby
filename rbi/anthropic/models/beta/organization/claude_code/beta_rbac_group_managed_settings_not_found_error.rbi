# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          # This RBAC Group has no Claude Code managed settings.
          class BetaRBACGroupManagedSettingsNotFoundError < Anthropic::Errors::NotFoundError
            sig { returns(Symbol) }
            def error_code
            end

            sig do
              returns(
                Anthropic::Beta::Organization::ClaudeCode::BetaRBACGroupManagedSettingsNotFoundErrorDetails
              )
            end
            def details
            end
          end
        end
      end
    end
  end
end
