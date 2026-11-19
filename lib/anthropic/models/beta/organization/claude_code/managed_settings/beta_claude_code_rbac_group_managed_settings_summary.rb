# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            # @see Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroups#list
            class BetaClaudeCodeRBACGroupManagedSettingsSummary < Anthropic::Internal::Type::BaseModel
              # @!attribute created_at
              #   When the settings document this group uses was first stored, in RFC 3339 format.
              #   This can be earlier than when the group got its settings, and it changes if the
              #   group gets a different document.
              #
              #   @return [Time]
              required :created_at, Time

              # @!attribute rbac_group_id
              #   The RBAC Group's ID, prefixed `rbac_group_`.
              #
              #   @return [String]
              required :rbac_group_id, String

              # @!attribute rbac_group_status
              #   Whether the group is still one of the organization's RBAC Groups. Its `type` is
              #   `active` if it is, `deleted` if it is not, and `unknown` if that cannot be
              #   checked right now. A deleted group's settings stay in `rbac_group_order` but
              #   match no member.
              #
              #   @return [Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusActive, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusDeleted, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusUnknown]
              required :rbac_group_status,
                       union: -> { Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatus }

              # @!attribute type
              #   Always `claude_code_rbac_group_managed_settings_summary`.
              #
              #   @return [Symbol, :claude_code_rbac_group_managed_settings_summary]
              required :type, const: :claude_code_rbac_group_managed_settings_summary

              # @!attribute updated_at
              #   When this group's settings or its position in the order last changed, in RFC
              #   3339 format. Its position changes whenever the number of groups ahead of it
              #   changes.
              #
              #   @return [Time]
              required :updated_at, Time

              # @!method initialize(created_at:, rbac_group_id:, rbac_group_status:, updated_at:, type: :claude_code_rbac_group_managed_settings_summary)
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupManagedSettingsSummary}
              #   for more details.
              #
              #   @param created_at [Time] When the settings document this group uses was first stored, in RFC 3339 format.
              #
              #   @param rbac_group_id [String] The RBAC Group's ID, prefixed `rbac_group_`.
              #
              #   @param rbac_group_status [Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusActive, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusDeleted, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusUnknown] Whether the group is still one of the organization's RBAC Groups. Its `type` is
              #
              #   @param updated_at [Time] When this group's settings or its position in the order last changed, in RFC 333
              #
              #   @param type [Symbol, :claude_code_rbac_group_managed_settings_summary] Always `claude_code_rbac_group_managed_settings_summary`.
            end
          end
        end
      end
    end
  end
end
