# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Plugins
          # @see Anthropic::Resources::Beta::Organization::Plugins::InstallationSettings#list
          class BetaPluginInstallationSetting < Anthropic::Internal::Type::BaseModel
            # @!attribute created_at
            #   When the target was first given a setting for this Plugin.
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute installation_preference
            #   The setting the target holds for this Plugin. One of `required`, `auto_install`,
            #   `available`, `not_available`; a value this API does not yet name is returned as
            #   stored.
            #
            #   @return [Symbol, String, Anthropic::Models::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference]
            required :installation_preference,
                     union: -> { Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference }

            # @!attribute plugin_id
            #   The Plugin's ID.
            #
            #   @return [String]
            required :plugin_id, String

            # @!attribute target
            #   Whose setting this is: `organization` (the Plugin's own organization-wide
            #   setting) or `rbac_group` (one RBAC Group's own setting); `organization_member`
            #   does not occur here.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaPluginTargetOrganization, Anthropic::Models::Beta::Organization::BetaPluginTargetRBACGroup, Anthropic::Models::Beta::Organization::BetaPluginTargetOrganizationMember]
            required :target,
                     union: -> { Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::Target }

            # @!attribute type
            #   Always `plugin_installation_setting`.
            #
            #   @return [Symbol, :plugin_installation_setting]
            required :type, const: :plugin_installation_setting

            # @!attribute updated_at
            #   When its setting last changed.
            #
            #   @return [Time]
            required :updated_at, Time

            # @!method initialize(created_at:, installation_preference:, plugin_id:, target:, updated_at:, type: :plugin_installation_setting)
            #   The installation setting an organization-owned Plugin holds for one target. It
            #   has no ID of its own: it is addressed by the Plugin's ID and the target.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Plugins::BetaPluginInstallationSetting}
            #   for more details.
            #
            #   @param created_at [Time] When the target was first given a setting for this Plugin.
            #
            #   @param installation_preference [Symbol, String, Anthropic::Models::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference] The setting the target holds for this Plugin. One of `required`, `auto_install`,
            #
            #   @param plugin_id [String] The Plugin's ID.
            #
            #   @param target [Anthropic::Models::Beta::Organization::BetaPluginTargetOrganization, Anthropic::Models::Beta::Organization::BetaPluginTargetRBACGroup, Anthropic::Models::Beta::Organization::BetaPluginTargetOrganizationMember] Whose setting this is: `organization` (the Plugin's own organization-wide settin
            #
            #   @param updated_at [Time] When its setting last changed.
            #
            #   @param type [Symbol, :plugin_installation_setting] Always `plugin_installation_setting`.

            # The setting the target holds for this Plugin. One of `required`, `auto_install`,
            # `available`, `not_available`; a value this API does not yet name is returned as
            # stored.
            #
            # @see Anthropic::Models::Beta::Organization::Plugins::BetaPluginInstallationSetting#installation_preference
            module InstallationPreference
              extend Anthropic::Internal::Type::Union

              variant const: -> { Anthropic::Models::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference::AUTO_INSTALL }

              variant const: -> { Anthropic::Models::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference::AVAILABLE }

              variant const: -> { Anthropic::Models::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference::NOT_AVAILABLE }

              variant const: -> { Anthropic::Models::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference::REQUIRED }

              variant String

              # @!method self.variants
              #   @return [Array(Symbol, String)]

              define_sorbet_constant!(:Variants) do
                T.type_alias do
                  T.any(
                    Anthropic::Beta::Organization::Plugins::BetaPluginInstallationSetting::InstallationPreference::TaggedSymbol,
                    String
                  )
                end
              end

              # @!group

              AUTO_INSTALL = :auto_install
              AVAILABLE = :available
              NOT_AVAILABLE = :not_available
              REQUIRED = :required

              # @!endgroup
            end

            # Whose setting this is: `organization` (the Plugin's own organization-wide
            # setting) or `rbac_group` (one RBAC Group's own setting); `organization_member`
            # does not occur here.
            #
            # @see Anthropic::Models::Beta::Organization::Plugins::BetaPluginInstallationSetting#target
            module Target
              extend Anthropic::Internal::Type::Union

              discriminator :type

              variant :organization, -> { Anthropic::Beta::Organization::BetaPluginTargetOrganization }

              variant :rbac_group, -> { Anthropic::Beta::Organization::BetaPluginTargetRBACGroup }

              variant :organization_member, -> { Anthropic::Beta::Organization::BetaPluginTargetOrganizationMember }

              module Type
                extend Anthropic::Internal::Type::Enum

                ORGANIZATION = :organization
                RBAC_GROUP = :rbac_group
                ORGANIZATION_MEMBER = :organization_member

                # @!method self.values
                #   @return [Array<Symbol>]
              end

              # @!method self.variants
              #   @return [Array(Anthropic::Models::Beta::Organization::BetaPluginTargetOrganization, Anthropic::Models::Beta::Organization::BetaPluginTargetRBACGroup, Anthropic::Models::Beta::Organization::BetaPluginTargetOrganizationMember)]

              # Creates a new instance of the variant class whose `type` matches the given
              # value, passing the remaining arguments to its constructor.
              #
              # @param type [Symbol, Anthropic::Models::Beta::Organization::Plugins::BetaPluginInstallationSetting::Target::Type, String]
              #
              # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
              #
              #   @option args [String] :rbac_group_id The RBAC Group's ID.
              #
              #   @option args [String] :user_id The member's User ID.
              #
              # @raise [ArgumentError]
              # @return [Anthropic::Models::Beta::Organization::BetaPluginTargetOrganization, Anthropic::Models::Beta::Organization::BetaPluginTargetRBACGroup, Anthropic::Models::Beta::Organization::BetaPluginTargetOrganizationMember]
              def self.new(type:, **args)
                case type.to_sym
                when :organization
                  Anthropic::Beta::Organization::BetaPluginTargetOrganization.new(**args)
                when :rbac_group
                  Anthropic::Beta::Organization::BetaPluginTargetRBACGroup.new(**args)
                when :organization_member
                  Anthropic::Beta::Organization::BetaPluginTargetOrganizationMember.new(**args)
                else
                  raise ArgumentError, "unknown type: #{type}"
                end
              end
            end
          end
        end
      end
    end
  end
end
