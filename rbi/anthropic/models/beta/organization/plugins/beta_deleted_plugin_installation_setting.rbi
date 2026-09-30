# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Plugins
          class BetaDeletedPluginInstallationSetting < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting,
                  Anthropic::Internal::AnyHash
                )
              end

            # The Plugin's ID.
            sig { returns(String) }
            attr_accessor :plugin_id

            # Whose setting was removed.
            sig do
              returns(
                Anthropic::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting::Target::Variants
              )
            end
            attr_accessor :target

            # Always `plugin_installation_setting_deleted`.
            sig { returns(Symbol) }
            attr_accessor :type

            # Confirmation that one target's installation setting was removed, naming the
            # Plugin and the target in place of an ID.
            sig do
              params(
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
              # The Plugin's ID.
              plugin_id:,
              # Whose setting was removed.
              target:,
              # Always `plugin_installation_setting_deleted`.
              type: :plugin_installation_setting_deleted
            )
            end

            sig do
              override.returns(
                {
                  plugin_id: String,
                  target:
                    Anthropic::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting::Target::Variants,
                  type: Symbol
                }
              )
            end
            def to_hash
            end

            # Whose setting was removed.
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
                      Anthropic::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting::Target::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                ORGANIZATION =
                  T.let(
                    :organization,
                    Anthropic::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting::Target::Type::TaggedSymbol
                  )
                RBAC_GROUP =
                  T.let(
                    :rbac_group,
                    Anthropic::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting::Target::Type::TaggedSymbol
                  )
                ORGANIZATION_MEMBER =
                  T.let(
                    :organization_member,
                    Anthropic::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting::Target::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting::Target::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting::Target::Variants
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
                    Anthropic::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting::Target::Type::OrSymbol,
                  rbac_group_id: String,
                  user_id: String
                ).returns(
                  Anthropic::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting::Target::Variants
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
