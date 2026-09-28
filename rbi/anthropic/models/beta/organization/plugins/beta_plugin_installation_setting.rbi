# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Plugins
          class BetaPluginInstallationSetting < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting,
                  Anthropic::Internal::AnyHash
                )
              end

            # When the target was first given a setting for this Plugin.
            sig { returns(Time) }
            attr_accessor :created_at

            # The setting the target holds for this Plugin. One of `required`, `auto_install`,
            # `available`, `not_available`; a value this API does not yet name is returned as
            # stored.
            sig do
              returns(
                Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference::Variants
              )
            end
            attr_accessor :installation_preference

            # The Plugin's ID.
            sig { returns(String) }
            attr_accessor :plugin_id

            # Whose setting this is: `organization` (the Plugin's own organization-wide
            # setting) or `rbac_group` (one RBAC Group's own setting); `organization_member`
            # does not occur here.
            sig do
              returns(
                Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::Target::Variants
              )
            end
            attr_accessor :target

            # Always `plugin_installation_setting`.
            sig { returns(Symbol) }
            attr_accessor :type

            # When its setting last changed.
            sig { returns(Time) }
            attr_accessor :updated_at

            # The installation setting an organization-owned Plugin holds for one target. It
            # has no ID of its own: it is addressed by the Plugin's ID and the target.
            sig do
              params(
                created_at: Time,
                installation_preference:
                  T.any(
                    Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference::OrSymbol,
                    String
                  ),
                plugin_id: String,
                target:
                  T.any(
                    Anthropic::Beta::Organization::BetaPluginTargetOrganization::OrHash,
                    Anthropic::Beta::Organization::BetaPluginTargetRBACGroup::OrHash,
                    Anthropic::Beta::Organization::BetaPluginTargetOrganizationMember::OrHash
                  ),
                updated_at: Time,
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # When the target was first given a setting for this Plugin.
              created_at:,
              # The setting the target holds for this Plugin. One of `required`, `auto_install`,
              # `available`, `not_available`; a value this API does not yet name is returned as
              # stored.
              installation_preference:,
              # The Plugin's ID.
              plugin_id:,
              # Whose setting this is: `organization` (the Plugin's own organization-wide
              # setting) or `rbac_group` (one RBAC Group's own setting); `organization_member`
              # does not occur here.
              target:,
              # When its setting last changed.
              updated_at:,
              # Always `plugin_installation_setting`.
              type: :plugin_installation_setting
            )
            end

            sig do
              override.returns(
                {
                  created_at: Time,
                  installation_preference:
                    Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference::Variants,
                  plugin_id: String,
                  target:
                    Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::Target::Variants,
                  type: Symbol,
                  updated_at: Time
                }
              )
            end
            def to_hash
            end

            # The setting the target holds for this Plugin. One of `required`, `auto_install`,
            # `available`, `not_available`; a value this API does not yet name is returned as
            # stored.
            module InstallationPreference
              extend Anthropic::Internal::Type::Union

              Variants =
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference::TaggedSymbol,
                    String
                  )
                end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference::Variants
                  ]
                )
              end
              def self.variants
              end

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              AUTO_INSTALL =
                T.let(
                  :auto_install,
                  Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference::TaggedSymbol
                )
              AVAILABLE =
                T.let(
                  :available,
                  Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference::TaggedSymbol
                )
              NOT_AVAILABLE =
                T.let(
                  :not_available,
                  Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference::TaggedSymbol
                )
              REQUIRED =
                T.let(
                  :required,
                  Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference::TaggedSymbol
                )
            end

            # Whose setting this is: `organization` (the Plugin's own organization-wide
            # setting) or `rbac_group` (one RBAC Group's own setting); `organization_member`
            # does not occur here.
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
                      Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::Target::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                ORGANIZATION =
                  T.let(
                    :organization,
                    Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::Target::Type::TaggedSymbol
                  )
                RBAC_GROUP =
                  T.let(
                    :rbac_group,
                    Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::Target::Type::TaggedSymbol
                  )
                ORGANIZATION_MEMBER =
                  T.let(
                    :organization_member,
                    Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::Target::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::Target::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::Target::Variants
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
                    Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::Target::Type::OrSymbol,
                  rbac_group_id: String,
                  user_id: String
                ).returns(
                  Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::Target::Variants
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
