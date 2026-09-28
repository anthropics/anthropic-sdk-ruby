# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::Plugins#create
        class BetaPlugin < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   The Plugin's ID.
          #
          #   @return [String]
          required :id, String

          # @!attribute components
          #   What the served version contains; null when not enumerated.
          #
          #   @return [Array<Anthropic::Models::Beta::Organization::BetaPluginComponent>, nil]
          required :components,
                   -> {
                     Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaPluginComponent]
                   },
                   nil?: true

          # @!attribute content_scan
          #   The served version's content scan; null when it has not been scanned.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaPluginContentScan, nil]
          required :content_scan, -> { Anthropic::Beta::Organization::BetaPluginContentScan }, nil?: true

          # @!attribute created_at
          #   RFC 3339.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute created_by
          #   Who created the Plugin; null when no creator is recorded.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaPluginUserActor, Anthropic::Models::Beta::Organization::BetaPluginAPIActor, nil]
          required :created_by, union: -> { Anthropic::Beta::Organization::BetaPlugin::CreatedBy }, nil?: true

          # @!attribute description
          #   The served version's description.
          #
          #   @return [String, nil]
          required :description, String, nil?: true

          # @!attribute display_name
          #   The served version's display name.
          #
          #   @return [String, nil]
          required :display_name, String, nil?: true

          # @!attribute latest_version_id
          #   The newest version.
          #
          #   @return [String]
          required :latest_version_id, String

          # @!attribute manifest_version
          #   The version string the served version's manifest declares.
          #
          #   @return [String, nil]
          required :manifest_version, String, nil?: true

          # @!attribute marketplace_id
          #   The ID of the plugin marketplace the Plugin lives in.
          #
          #   @return [String]
          required :marketplace_id, String

          # @!attribute name
          #   Lowercase identifier, unique within its plugin marketplace. Fixed for an
          #   organization-owned Plugin's lifetime; a member-owned Plugin's changes when its
          #   owner renames it in claude.ai, while its `id` stays the same.
          #
          #   @return [String]
          required :name, String

          # @!attribute organization_installation_preference
          #   Organization-owned Plugin: the organization-wide installation setting every
          #   member gets unless an RBAC Group they belong to holds its own — the Plugin's own
          #   setting, or its plugin marketplace's default. Null for a member-owned Plugin,
          #   which has shares instead. One of `required`, `auto_install`, `available`,
          #   `not_available`; a value this API does not yet name is returned as stored.
          #
          #   @return [Symbol, String, Anthropic::Models::Beta::Organization::BetaPlugin::OrganizationInstallationPreference, nil]
          required :organization_installation_preference,
                   union: -> {
                     Anthropic::Beta::Organization::BetaPlugin::OrganizationInstallationPreference
                   },
                   nil?: true

          # @!attribute organization_installation_preference_inherited
          #   Organization-owned Plugin: true while it has no organization-wide setting of its
          #   own and `organization_installation_preference` is its plugin marketplace's
          #   default. Null for a member-owned Plugin.
          #
          #   @return [Boolean, nil]
          required :organization_installation_preference_inherited,
                   Anthropic::Internal::Type::Boolean,
                   nil?: true

          # @!attribute owner
          #   Who owns the Plugin: the organization, or the member whose personal plugin
          #   marketplace it lives in.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaPluginOwnerOrganization, Anthropic::Models::Beta::Organization::BetaPluginOwnerUser]
          required :owner, union: -> { Anthropic::Beta::Organization::BetaPlugin::Owner }

          # @!attribute reach
          #   How far the served version reaches: `remote` when it declares an MCP server or a
          #   CLI, `privileged` when it declares a hook, monitor, language server or settings
          #   but nothing remote, `contained` otherwise; null when not classifiable.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaPlugin::Reach, nil]
          required :reach, enum: -> { Anthropic::Beta::Organization::BetaPlugin::Reach }, nil?: true

          # @!attribute served_version_id
          #   The version claude.ai serves to members.
          #
          #   @return [String]
          required :served_version_id, String

          # @!attribute served_version_pinned
          #   False while the served version follows each new version; true once it has been
          #   pinned to one.
          #
          #   @return [Boolean]
          required :served_version_pinned, Anthropic::Internal::Type::Boolean

          # @!attribute type
          #   Always `plugin`.
          #
          #   @return [Symbol, :plugin]
          required :type, const: :plugin

          # @!attribute updated_at
          #   RFC 3339. Moves on a new version and on a served-version change; a change to the
          #   Plugin's installation settings or shares does not move it.
          #
          #   @return [Time]
          required :updated_at, Time

          # @!method initialize(id:, components:, content_scan:, created_at:, created_by:, description:, display_name:, latest_version_id:, manifest_version:, marketplace_id:, name:, organization_installation_preference:, organization_installation_preference_inherited:, owner:, reach:, served_version_id:, served_version_pinned:, updated_at:, type: :plugin)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaPlugin} for more details.
          #
          #   @param id [String] The Plugin's ID.
          #
          #   @param components [Array<Anthropic::Models::Beta::Organization::BetaPluginComponent>, nil] What the served version contains; null when not enumerated.
          #
          #   @param content_scan [Anthropic::Models::Beta::Organization::BetaPluginContentScan, nil] The served version's content scan; null when it has not been scanned.
          #
          #   @param created_at [Time] RFC 3339.
          #
          #   @param created_by [Anthropic::Models::Beta::Organization::BetaPluginUserActor, Anthropic::Models::Beta::Organization::BetaPluginAPIActor, nil] Who created the Plugin; null when no creator is recorded.
          #
          #   @param description [String, nil] The served version's description.
          #
          #   @param display_name [String, nil] The served version's display name.
          #
          #   @param latest_version_id [String] The newest version.
          #
          #   @param manifest_version [String, nil] The version string the served version's manifest declares.
          #
          #   @param marketplace_id [String] The ID of the plugin marketplace the Plugin lives in.
          #
          #   @param name [String] Lowercase identifier, unique within its plugin marketplace. Fixed for an organiz
          #
          #   @param organization_installation_preference [Symbol, String, Anthropic::Models::Beta::Organization::BetaPlugin::OrganizationInstallationPreference, nil] Organization-owned Plugin: the organization-wide installation setting every memb
          #
          #   @param organization_installation_preference_inherited [Boolean, nil] Organization-owned Plugin: true while it has no organization-wide setting of its
          #
          #   @param owner [Anthropic::Models::Beta::Organization::BetaPluginOwnerOrganization, Anthropic::Models::Beta::Organization::BetaPluginOwnerUser] Who owns the Plugin: the organization, or the member whose personal plugin marke
          #
          #   @param reach [Symbol, Anthropic::Models::Beta::Organization::BetaPlugin::Reach, nil] How far the served version reaches: `remote` when it declares an MCP server or a
          #
          #   @param served_version_id [String] The version claude.ai serves to members.
          #
          #   @param served_version_pinned [Boolean] False while the served version follows each new version; true once it has been p
          #
          #   @param updated_at [Time] RFC 3339. Moves on a new version and on a served-version change; a change to the
          #
          #   @param type [Symbol, :plugin] Always `plugin`.

          # Who created the Plugin; null when no creator is recorded.
          #
          # @see Anthropic::Models::Beta::Organization::BetaPlugin#created_by
          module CreatedBy
            extend Anthropic::Internal::Type::Union

            discriminator :type

            variant :user_actor, -> { Anthropic::Beta::Organization::BetaPluginUserActor }

            variant :api_actor, -> { Anthropic::Beta::Organization::BetaPluginAPIActor }

            module Type
              extend Anthropic::Internal::Type::Enum

              USER_ACTOR = :user_actor
              API_ACTOR = :api_actor

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Organization::BetaPluginUserActor, Anthropic::Models::Beta::Organization::BetaPluginAPIActor)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::BetaPlugin::CreatedBy} for more details.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaPlugin::CreatedBy::Type, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String, nil] :email_address The member's email address; may be null, for example when they are no longer a m
            #
            #   @option args [String] :user_id The member's User ID.
            #
            #   @option args [String] :api_key_id The key's ID.
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Organization::BetaPluginUserActor, Anthropic::Models::Beta::Organization::BetaPluginAPIActor]
            def self.new(type:, **args)
              case type.to_sym
              when :user_actor
                Anthropic::Beta::Organization::BetaPluginUserActor.new(**args)
              when :api_actor
                Anthropic::Beta::Organization::BetaPluginAPIActor.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end

          # Organization-owned Plugin: the organization-wide installation setting every
          # member gets unless an RBAC Group they belong to holds its own — the Plugin's own
          # setting, or its plugin marketplace's default. Null for a member-owned Plugin,
          # which has shares instead. One of `required`, `auto_install`, `available`,
          # `not_available`; a value this API does not yet name is returned as stored.
          #
          # @see Anthropic::Models::Beta::Organization::BetaPlugin#organization_installation_preference
          module OrganizationInstallationPreference
            extend Anthropic::Internal::Type::Union

            variant const: -> { Anthropic::Models::Beta::Organization::BetaPlugin::OrganizationInstallationPreference::AUTO_INSTALL }

            variant const: -> { Anthropic::Models::Beta::Organization::BetaPlugin::OrganizationInstallationPreference::AVAILABLE }

            variant const: -> { Anthropic::Models::Beta::Organization::BetaPlugin::OrganizationInstallationPreference::NOT_AVAILABLE }

            variant const: -> { Anthropic::Models::Beta::Organization::BetaPlugin::OrganizationInstallationPreference::REQUIRED }

            variant String

            # @!method self.variants
            #   @return [Array(Symbol, String)]

            define_sorbet_constant!(:Variants) do
              T.type_alias { T.any(Anthropic::Beta::Organization::BetaPlugin::OrganizationInstallationPreference::TaggedSymbol, String) }
            end

            # @!group

            AUTO_INSTALL = :auto_install
            AVAILABLE = :available
            NOT_AVAILABLE = :not_available
            REQUIRED = :required

            # @!endgroup
          end

          # Who owns the Plugin: the organization, or the member whose personal plugin
          # marketplace it lives in.
          #
          # @see Anthropic::Models::Beta::Organization::BetaPlugin#owner
          module Owner
            extend Anthropic::Internal::Type::Union

            discriminator :type

            variant :organization, -> { Anthropic::Beta::Organization::BetaPluginOwnerOrganization }

            variant :user, -> { Anthropic::Beta::Organization::BetaPluginOwnerUser }

            module Type
              extend Anthropic::Internal::Type::Enum

              ORGANIZATION = :organization
              USER = :user

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Organization::BetaPluginOwnerOrganization, Anthropic::Models::Beta::Organization::BetaPluginOwnerUser)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaPlugin::Owner::Type, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String] :user_id The member's User ID.
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Organization::BetaPluginOwnerOrganization, Anthropic::Models::Beta::Organization::BetaPluginOwnerUser]
            def self.new(type:, **args)
              case type.to_sym
              when :organization
                Anthropic::Beta::Organization::BetaPluginOwnerOrganization.new(**args)
              when :user
                Anthropic::Beta::Organization::BetaPluginOwnerUser.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end

          # How far the served version reaches: `remote` when it declares an MCP server or a
          # CLI, `privileged` when it declares a hook, monitor, language server or settings
          # but nothing remote, `contained` otherwise; null when not classifiable.
          #
          # @see Anthropic::Models::Beta::Organization::BetaPlugin#reach
          module Reach
            extend Anthropic::Internal::Type::Enum

            CONTAINED = :contained
            PRIVILEGED = :privileged
            REMOTE = :remote

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
