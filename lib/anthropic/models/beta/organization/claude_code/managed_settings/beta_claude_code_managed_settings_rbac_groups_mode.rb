# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            class BetaClaudeCodeManagedSettingsRBACGroupsMode < Anthropic::Internal::Type::BaseModel
              # @!attribute type
              #   Always `rbac_groups`.
              #
              #   @return [Symbol, :rbac_groups]
              required :type, const: :rbac_groups

              # @!method initialize(type: :rbac_groups)
              #   @param type [Symbol, :rbac_groups] Always `rbac_groups`.
            end
          end
        end
      end
    end
  end
end
