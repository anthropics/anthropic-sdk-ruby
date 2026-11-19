# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            # @see Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroups#delete
            class BetaDeletedClaudeCodeRBACGroupManagedSettings < Anthropic::Internal::Type::BaseModel
              # @!attribute rbac_group_id
              #   The RBAC Group's ID, prefixed `rbac_group_`.
              #
              #   @return [String]
              required :rbac_group_id, String

              # @!attribute type
              #   Always `claude_code_rbac_group_managed_settings_deleted`.
              #
              #   @return [Symbol, :claude_code_rbac_group_managed_settings_deleted]
              required :type, const: :claude_code_rbac_group_managed_settings_deleted

              # @!method initialize(rbac_group_id:, type: :claude_code_rbac_group_managed_settings_deleted)
              #   @param rbac_group_id [String] The RBAC Group's ID, prefixed `rbac_group_`.
              #
              #   @param type [Symbol, :claude_code_rbac_group_managed_settings_deleted] Always `claude_code_rbac_group_managed_settings_deleted`.
            end
          end
        end
      end
    end
  end
end
