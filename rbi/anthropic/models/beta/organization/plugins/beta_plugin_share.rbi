# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Plugins
          class BetaPluginShare < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Plugins::BetaPluginShare,
                  Anthropic::Internal::AnyHash
                )
              end

            # When the share was given; a share whose role is later changed in claude.ai is
            # re-granted and carries the time of that change.
            sig { returns(Time) }
            attr_accessor :granted_at

            # The Plugin's ID.
            sig { returns(String) }
            attr_accessor :plugin_id

            # Who the Plugin is shared with: `organization` (every member), `rbac_group` (one
            # RBAC Group), or `organization_member` (one member).
            sig do
              returns(
                Anthropic::Beta::Organization::Plugins::BetaPluginShare::Target::Variants
              )
            end
            attr_accessor :target

            # Always `plugin_share`.
            sig { returns(Symbol) }
            attr_accessor :type

            # One share the owner of a member-owned Plugin has given. Shares are read-only in
            # this API and have no ID of their own; who gave a share is recorded on the
            # Compliance API activity feed, not here.
            sig do
              params(
                granted_at: Time,
                plugin_id: String,
                target:
                  T.any(
                    Anthropic::Beta::Organization::BetaPluginTargetOrganization::OrHash,
                    Anthropic::Beta::Organization::BetaPluginTargetRBACGroup::OrHash,
                    Anthropic::Beta::Organization::BetaPluginTargetOrganizationMember::OrHash
                  ),
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # When the share was given; a share whose role is later changed in claude.ai is
              # re-granted and carries the time of that change.
              granted_at:,
              # The Plugin's ID.
              plugin_id:,
              # Who the Plugin is shared with: `organization` (every member), `rbac_group` (one
              # RBAC Group), or `organization_member` (one member).
              target:,
              # Always `plugin_share`.
              type: :plugin_share
            )
            end

            sig do
              override.returns(
                {
                  granted_at: Time,
                  plugin_id: String,
                  target:
                    Anthropic::Beta::Organization::Plugins::BetaPluginShare::Target::Variants,
                  type: Symbol
                }
              )
            end
            def to_hash
            end

            # Who the Plugin is shared with: `organization` (every member), `rbac_group` (one
            # RBAC Group), or `organization_member` (one member).
            module Target
              extend Anthropic::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::BetaPluginTargetOrganization,
                    Anthropic::Beta::Organization::BetaPluginTargetRBACGroup,
                    Anthropic::Beta::Organization::BetaPluginTargetOrganizationMember
                  )
                end

              module Type
                extend Anthropic::Internal::Type::Enum

                TaggedSymbol =
                  T.type_alias do
                    T.all(
                      Symbol,
                      Anthropic::Beta::Organization::Plugins::BetaPluginShare::Target::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                ORGANIZATION =
                  T.let(
                    :organization,
                    Anthropic::Beta::Organization::Plugins::BetaPluginShare::Target::Type::TaggedSymbol
                  )
                RBAC_GROUP =
                  T.let(
                    :rbac_group,
                    Anthropic::Beta::Organization::Plugins::BetaPluginShare::Target::Type::TaggedSymbol
                  )
                ORGANIZATION_MEMBER =
                  T.let(
                    :organization_member,
                    Anthropic::Beta::Organization::Plugins::BetaPluginShare::Target::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::Organization::Plugins::BetaPluginShare::Target::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Plugins::BetaPluginShare::Target::Variants
                  ]
                )
              end
              def self.variants
              end

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              sig do
                params(
                  type:
                    Anthropic::Beta::Organization::Plugins::BetaPluginShare::Target::Type::OrSymbol,
                  rbac_group_id: String,
                  user_id: String
                ).returns(
                  Anthropic::Beta::Organization::Plugins::BetaPluginShare::Target::Variants
                )
              end
              def self.new(
                type:,
                # The RBAC Group's ID.
                rbac_group_id: nil,
                # The member's User ID.
                user_id: nil
              )
              end
            end
          end
        end
      end
    end
  end
end
