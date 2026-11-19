# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module ClaudeCode
          module ManagedSettings
            class BetaClaudeCodeRBACGroupManagedSettings < Anthropic::Internal::Type::BaseModel
              OrHash =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupManagedSettings,
                    Anthropic::Internal::AnyHash
                  )
                end

              # When the settings document this group uses was first stored, in RFC 3339 format.
              # This can be earlier than when the group got its settings, and it changes if the
              # group gets a different document.
              sig { returns(Time) }
              attr_accessor :created_at

              # The RBAC Group's ID, prefixed `rbac_group_`.
              sig { returns(String) }
              attr_accessor :rbac_group_id

              # Whether the group is still one of the organization's RBAC Groups. Its `type` is
              # `active` if it is, `deleted` if it is not, and `unknown` if that cannot be
              # checked right now. A deleted group's settings stay in `rbac_group_order` but
              # match no member.
              sig do
                returns(
                  Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatus::Variants
                )
              end
              attr_accessor :rbac_group_status

              # The group's settings document, or `null` if the stored document is damaged and
              # can no longer be read. Replacing it fixes this.
              sig { returns(T.nilable(T::Hash[Symbol, T.anything])) }
              attr_accessor :settings

              # Always `claude_code_rbac_group_managed_settings`.
              sig { returns(Symbol) }
              attr_accessor :type

              # When this group's settings or its position in the order last changed, in RFC
              # 3339 format. Its position changes whenever the number of groups ahead of it
              # changes.
              sig { returns(Time) }
              attr_accessor :updated_at

              sig do
                params(
                  created_at: Time,
                  rbac_group_id: String,
                  rbac_group_status:
                    T.any(
                      Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusActive::OrHash,
                      Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusDeleted::OrHash,
                      Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatusUnknown::OrHash
                    ),
                  settings: T.nilable(T::Hash[Symbol, T.anything]),
                  updated_at: Time,
                  type: Symbol
                ).returns(T.attached_class)
              end
              def self.new(
                # When the settings document this group uses was first stored, in RFC 3339 format.
                # This can be earlier than when the group got its settings, and it changes if the
                # group gets a different document.
                created_at:,
                # The RBAC Group's ID, prefixed `rbac_group_`.
                rbac_group_id:,
                # Whether the group is still one of the organization's RBAC Groups. Its `type` is
                # `active` if it is, `deleted` if it is not, and `unknown` if that cannot be
                # checked right now. A deleted group's settings stay in `rbac_group_order` but
                # match no member.
                rbac_group_status:,
                # The group's settings document, or `null` if the stored document is damaged and
                # can no longer be read. Replacing it fixes this.
                settings:,
                # When this group's settings or its position in the order last changed, in RFC
                # 3339 format. Its position changes whenever the number of groups ahead of it
                # changes.
                updated_at:,
                # Always `claude_code_rbac_group_managed_settings`.
                type: :claude_code_rbac_group_managed_settings
              )
              end

              sig do
                override.returns(
                  {
                    created_at: Time,
                    rbac_group_id: String,
                    rbac_group_status:
                      Anthropic::Beta::Organization::ClaudeCode::ManagedSettings::BetaClaudeCodeRBACGroupStatus::Variants,
                    settings: T.nilable(T::Hash[Symbol, T.anything]),
                    type: Symbol,
                    updated_at: Time
                  }
                )
              end
              def to_hash
              end
            end
          end
        end
      end
    end
  end
end
