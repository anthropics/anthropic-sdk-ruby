# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPlugin < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaPlugin,
                Anthropic::Internal::AnyHash
              )
            end

          # The Plugin's ID.
          sig { returns(String) }
          attr_accessor :id

          # What the served version contains; null when not enumerated.
          sig do
            returns(
              T.nilable(
                T::Array[Anthropic::Beta::Organization::BetaPluginComponent]
              )
            )
          end
          attr_accessor :components

          # The served version's content scan; null when it has not been scanned.
          sig do
            returns(
              T.nilable(Anthropic::Beta::Organization::BetaPluginContentScan)
            )
          end
          attr_reader :content_scan

          sig do
            params(
              content_scan:
                T.nilable(
                  Anthropic::Beta::Organization::BetaPluginContentScan::OrHash
                )
            ).void
          end
          attr_writer :content_scan

          # RFC 3339.
          sig { returns(Time) }
          attr_accessor :created_at

          # Who created the Plugin; null when no creator is recorded.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaPlugin::CreatedBy::Variants
              )
            )
          end
          attr_accessor :created_by

          # The served version's description.
          sig { returns(T.nilable(String)) }
          attr_accessor :description

          # The served version's display name.
          sig { returns(T.nilable(String)) }
          attr_accessor :display_name

          # The newest version.
          sig { returns(String) }
          attr_accessor :latest_version_id

          # The version string the served version's manifest declares.
          sig { returns(T.nilable(String)) }
          attr_accessor :manifest_version

          # The ID of the plugin marketplace the Plugin lives in.
          sig { returns(String) }
          attr_accessor :marketplace_id

          # Lowercase identifier, unique within its plugin marketplace. Fixed for an
          # organization-owned Plugin's lifetime; a member-owned Plugin's changes when its
          # owner renames it in claude.ai, while its `id` stays the same.
          sig { returns(String) }
          attr_accessor :name

          # Organization-owned Plugin: the organization-wide installation setting every
          # member gets unless an RBAC Group they belong to holds its own — the Plugin's own
          # setting, or its plugin marketplace's default. Null for a member-owned Plugin,
          # which has shares instead. One of `required`, `auto_install`, `available`,
          # `not_available`; a value this API does not yet name is returned as stored.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaPlugin::OrganizationInstallationPreference::Variants
              )
            )
          end
          attr_accessor :organization_installation_preference

          # Organization-owned Plugin: true while it has no organization-wide setting of its
          # own and `organization_installation_preference` is its plugin marketplace's
          # default. Null for a member-owned Plugin.
          sig { returns(T.nilable(T::Boolean)) }
          attr_accessor :organization_installation_preference_inherited

          # Who owns the Plugin: the organization, or the member whose personal plugin
          # marketplace it lives in.
          sig do
            returns(Anthropic::Beta::Organization::BetaPlugin::Owner::Variants)
          end
          attr_accessor :owner

          # How far the served version reaches: `remote` when it declares an MCP server or a
          # CLI, `privileged` when it declares a hook, monitor, language server or settings
          # but nothing remote, `contained` otherwise; null when not classifiable.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaPlugin::Reach::TaggedSymbol
              )
            )
          end
          attr_accessor :reach

          # The version claude.ai serves to members.
          sig { returns(String) }
          attr_accessor :served_version_id

          # False while the served version follows each new version; true once it has been
          # pinned to one.
          sig { returns(T::Boolean) }
          attr_accessor :served_version_pinned

          # Always `plugin`.
          sig { returns(Symbol) }
          attr_accessor :type

          # RFC 3339. Moves on a new version and on a served-version change; a change to the
          # Plugin's installation settings or shares does not move it.
          sig { returns(Time) }
          attr_accessor :updated_at

          sig do
            params(
              id: String,
              components:
                T.nilable(
                  T::Array[
                    Anthropic::Beta::Organization::BetaPluginComponent::OrHash
                  ]
                ),
              content_scan:
                T.nilable(
                  Anthropic::Beta::Organization::BetaPluginContentScan::OrHash
                ),
              created_at: Time,
              created_by:
                T.nilable(
                  T.any(
                    Anthropic::Beta::Organization::BetaPluginUserActor::OrHash,
                    Anthropic::Beta::Organization::BetaPluginAPIActor::OrHash
                  )
                ),
              description: T.nilable(String),
              display_name: T.nilable(String),
              latest_version_id: String,
              manifest_version: T.nilable(String),
              marketplace_id: String,
              name: String,
              organization_installation_preference:
                T.nilable(
                  T.any(
                    Anthropic::Beta::Organization::BetaPlugin::OrganizationInstallationPreference::OrSymbol,
                    String
                  )
                ),
              organization_installation_preference_inherited:
                T.nilable(T::Boolean),
              owner:
                T.any(
                  Anthropic::Beta::Organization::BetaPluginOwnerOrganization::OrHash,
                  Anthropic::Beta::Organization::BetaPluginOwnerUser::OrHash
                ),
              reach:
                T.nilable(
                  Anthropic::Beta::Organization::BetaPlugin::Reach::OrSymbol
                ),
              served_version_id: String,
              served_version_pinned: T::Boolean,
              updated_at: Time,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The Plugin's ID.
            id:,
            # What the served version contains; null when not enumerated.
            components:,
            # The served version's content scan; null when it has not been scanned.
            content_scan:,
            # RFC 3339.
            created_at:,
            # Who created the Plugin; null when no creator is recorded.
            created_by:,
            # The served version's description.
            description:,
            # The served version's display name.
            display_name:,
            # The newest version.
            latest_version_id:,
            # The version string the served version's manifest declares.
            manifest_version:,
            # The ID of the plugin marketplace the Plugin lives in.
            marketplace_id:,
            # Lowercase identifier, unique within its plugin marketplace. Fixed for an
            # organization-owned Plugin's lifetime; a member-owned Plugin's changes when its
            # owner renames it in claude.ai, while its `id` stays the same.
            name:,
            # Organization-owned Plugin: the organization-wide installation setting every
            # member gets unless an RBAC Group they belong to holds its own — the Plugin's own
            # setting, or its plugin marketplace's default. Null for a member-owned Plugin,
            # which has shares instead. One of `required`, `auto_install`, `available`,
            # `not_available`; a value this API does not yet name is returned as stored.
            organization_installation_preference:,
            # Organization-owned Plugin: true while it has no organization-wide setting of its
            # own and `organization_installation_preference` is its plugin marketplace's
            # default. Null for a member-owned Plugin.
            organization_installation_preference_inherited:,
            # Who owns the Plugin: the organization, or the member whose personal plugin
            # marketplace it lives in.
            owner:,
            # How far the served version reaches: `remote` when it declares an MCP server or a
            # CLI, `privileged` when it declares a hook, monitor, language server or settings
            # but nothing remote, `contained` otherwise; null when not classifiable.
            reach:,
            # The version claude.ai serves to members.
            served_version_id:,
            # False while the served version follows each new version; true once it has been
            # pinned to one.
            served_version_pinned:,
            # RFC 3339. Moves on a new version and on a served-version change; a change to the
            # Plugin's installation settings or shares does not move it.
            updated_at:,
            # Always `plugin`.
            type: :plugin
          )
          end

          sig do
            override.returns(
              {
                id: String,
                components:
                  T.nilable(
                    T::Array[Anthropic::Beta::Organization::BetaPluginComponent]
                  ),
                content_scan:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaPluginContentScan
                  ),
                created_at: Time,
                created_by:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaPlugin::CreatedBy::Variants
                  ),
                description: T.nilable(String),
                display_name: T.nilable(String),
                latest_version_id: String,
                manifest_version: T.nilable(String),
                marketplace_id: String,
                name: String,
                organization_installation_preference:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaPlugin::OrganizationInstallationPreference::Variants
                  ),
                organization_installation_preference_inherited:
                  T.nilable(T::Boolean),
                owner:
                  Anthropic::Beta::Organization::BetaPlugin::Owner::Variants,
                reach:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaPlugin::Reach::TaggedSymbol
                  ),
                served_version_id: String,
                served_version_pinned: T::Boolean,
                type: Symbol,
                updated_at: Time
              }
            )
          end
          def to_hash
          end

          # Who created the Plugin; null when no creator is recorded.
          module CreatedBy
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::BetaPluginUserActor,
                  Anthropic::Beta::Organization::BetaPluginAPIActor
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::BetaPlugin::CreatedBy::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              USER_ACTOR =
                T.let(
                  :user_actor,
                  Anthropic::Beta::Organization::BetaPlugin::CreatedBy::Type::TaggedSymbol
                )
              API_ACTOR =
                T.let(
                  :api_actor,
                  Anthropic::Beta::Organization::BetaPlugin::CreatedBy::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::BetaPlugin::CreatedBy::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaPlugin::CreatedBy::Variants
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
                  Anthropic::Beta::Organization::BetaPlugin::CreatedBy::Type::OrSymbol,
                email_address: T.nilable(String),
                user_id: String,
                api_key_id: String
              ).returns(
                Anthropic::Beta::Organization::BetaPlugin::CreatedBy::Variants
              )
            end
            def self.new(
              type:,
              # The member's email address; may be null, for example when they are no longer a
              # member of the organization.
              email_address: nil,
              # The member's User ID.
              user_id: nil,
              # The key's ID.
              api_key_id: nil
            )
            end
          end

          # Organization-owned Plugin: the organization-wide installation setting every
          # member gets unless an RBAC Group they belong to holds its own — the Plugin's own
          # setting, or its plugin marketplace's default. Null for a member-owned Plugin,
          # which has shares instead. One of `required`, `auto_install`, `available`,
          # `not_available`; a value this API does not yet name is returned as stored.
          module OrganizationInstallationPreference
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::BetaPlugin::OrganizationInstallationPreference::TaggedSymbol,
                  String
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaPlugin::OrganizationInstallationPreference::Variants
                ]
              )
            end
            def self.variants
            end

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaPlugin::OrganizationInstallationPreference
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AUTO_INSTALL =
              T.let(
                :auto_install,
                Anthropic::Beta::Organization::BetaPlugin::OrganizationInstallationPreference::TaggedSymbol
              )
            AVAILABLE =
              T.let(
                :available,
                Anthropic::Beta::Organization::BetaPlugin::OrganizationInstallationPreference::TaggedSymbol
              )
            NOT_AVAILABLE =
              T.let(
                :not_available,
                Anthropic::Beta::Organization::BetaPlugin::OrganizationInstallationPreference::TaggedSymbol
              )
            REQUIRED =
              T.let(
                :required,
                Anthropic::Beta::Organization::BetaPlugin::OrganizationInstallationPreference::TaggedSymbol
              )
          end

          # Who owns the Plugin: the organization, or the member whose personal plugin
          # marketplace it lives in.
          module Owner
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::BetaPluginOwnerOrganization,
                  Anthropic::Beta::Organization::BetaPluginOwnerUser
                )
              end

            module Type
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::BetaPlugin::Owner::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ORGANIZATION =
                T.let(
                  :organization,
                  Anthropic::Beta::Organization::BetaPlugin::Owner::Type::TaggedSymbol
                )
              USER =
                T.let(
                  :user,
                  Anthropic::Beta::Organization::BetaPlugin::Owner::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::BetaPlugin::Owner::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaPlugin::Owner::Variants
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
                  Anthropic::Beta::Organization::BetaPlugin::Owner::Type::OrSymbol,
                user_id: String
              ).returns(
                Anthropic::Beta::Organization::BetaPlugin::Owner::Variants
              )
            end
            def self.new(
              type:,
              # The member's User ID.
              user_id: nil
            )
            end
          end

          # How far the served version reaches: `remote` when it declares an MCP server or a
          # CLI, `privileged` when it declares a hook, monitor, language server or settings
          # but nothing remote, `contained` otherwise; null when not classifiable.
          module Reach
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Anthropic::Beta::Organization::BetaPlugin::Reach)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            CONTAINED =
              T.let(
                :contained,
                Anthropic::Beta::Organization::BetaPlugin::Reach::TaggedSymbol
              )
            PRIVILEGED =
              T.let(
                :privileged,
                Anthropic::Beta::Organization::BetaPlugin::Reach::TaggedSymbol
              )
            REMOTE =
              T.let(
                :remote,
                Anthropic::Beta::Organization::BetaPlugin::Reach::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaPlugin::Reach::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end
        end
      end
    end
  end
end
