# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            # @see Anthropic::Resources::Beta::Organization::ClaudeCode::ManagedSettings::RBACGroups#retrieve
            class BetaClaudeCodeRBACGroupManagedSettings < Anthropic::Internal::Type::BaseModel
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

              # @!attribute settings
              #   The group's settings document, or `null` if the stored document is damaged and
              #   can no longer be read. Replacing it fixes this.
              #
              #   @return [Hash{Symbol=>Object}, nil]
              required :settings,
                       Anthropic::Internal::Type::HashOf[Anthropic::Internal::Type::Unknown],
                       nil?: true

              # @!attribute type
              #   Always `claude_code_rbac_group_managed_settings`.
              #
              #   @return [Symbol, :claude_code_rbac_group_managed_settings]
              required :type, const: :claude_code_rbac_group_managed_settings

              # @!attribute updated_at
              #   When this group's settings or its position in the order last changed, in RFC
              #   3339 format. Its position changes whenever the number of groups ahead of it
              #   changes.
              #
              #   @return [Time]
              required :updated_at, Time

              # @!method initialize(created_at:, rbac_group_id:, rbac_group_status:, settings:, updated_at:, type: :claude_code_rbac_group_managed_settings)
              #   Some parameter documentations has been truncated, see
              #   {Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupManagedSettings}
              #   for more details.
              #
              #   @param created_at [Time] When the settings document this group uses was first stored, in RFC 3339 format.
              #
              #   @param rbac_group_id [String] The RBAC Group's ID, prefixed `rbac_group_`.
              #
              #   @param rbac_group_status [Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusActive, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusDeleted, Anthropic::Models::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusUnknown] Whether the group is still one of the organization's RBAC Groups. Its `type` is
              #
              #   @param settings [Hash{Symbol=>Object}, nil] The group's settings document, or `null` if the stored document is damaged and c
              #
              #   @param updated_at [Time] When this group's settings or its position in the order last changed, in RFC 333
              #
              #   @param type [Symbol, :claude_code_rbac_group_managed_settings] Always `claude_code_rbac_group_managed_settings`.
            end
          end
        end
      end
    end
  end
end
