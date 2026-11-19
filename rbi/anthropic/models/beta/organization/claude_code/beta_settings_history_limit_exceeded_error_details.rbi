# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          class BetaSettingsHistoryLimitExceededErrorDetails < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::ClaudeCode::BetaSettingsHistoryLimitExceededErrorDetails,
                  Anthropic::Internal::AnyHash
                )
              end

            sig { returns(Symbol) }
            attr_accessor :error_code

            # The organization has reached its settings history limit, a cap on stored
            # versions of its settings documents. Nothing in the API or claude.ai lowers the
            # count, so contact support. Creating or deleting group settings, creating or
            # clearing the default settings, and reordering are refused. Changing the mode
            # still works, unless it would copy the organization settings into a new default.
            sig { params(error_code: Symbol).returns(T.attached_class) }
            def self.new(error_code: :settings_history_limit_exceeded)
            end

            sig { override.returns({ error_code: Symbol }) }
            def to_hash
            end
          end
        end
      end
    end
  end
end
