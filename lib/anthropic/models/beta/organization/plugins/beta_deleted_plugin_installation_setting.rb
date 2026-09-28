# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Plugins
          # @see Anthropic::Resources::Beta::Organization::Plugins::InstallationSettings#remove
          class BetaDeletedPluginInstallationSetting < Anthropic::Internal::Type::BaseModel
            # @!attribute plugin_id
            #   The Plugin's ID.
            #
            #   @return [String]
            required :plugin_id, String

            # @!attribute target
            #   Whose setting was removed.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaPluginTargetOrganization, Anthropic::Models::Beta::Organization::BetaPluginTargetRBACGroup, Anthropic::Models::Beta::Organization::BetaPluginTargetOrganizationMember]
            required :target,
                     union: -> { Anthropic::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting::Target }

            # @!attribute type
            #   Always `plugin_installation_setting_deleted`.
            #
            #   @return [Symbol, :plugin_installation_setting_deleted]
            required :type, const: :plugin_installation_setting_deleted

            # @!method initialize(plugin_id:, target:, type: :plugin_installation_setting_deleted)
            #   Confirmation that one target's installation setting was removed, naming the
            #   Plugin and the target in place of an ID.
            #
            #   @param plugin_id [String] The Plugin's ID.
            #
            #   @param target [Anthropic::Models::Beta::Organization::BetaPluginTargetOrganization, Anthropic::Models::Beta::Organization::BetaPluginTargetRBACGroup, Anthropic::Models::Beta::Organization::BetaPluginTargetOrganizationMember] Whose setting was removed.
            #
            #   @param type [Symbol, :plugin_installation_setting_deleted] Always `plugin_installation_setting_deleted`.

            # Whose setting was removed.
            #
            # @see Anthropic::Models::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting#target
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
              # @param type [Symbol, Anthropic::Models::Beta::Organization::Plugins::BetaDeletedPluginInstallationSetting::Target::Type, String]
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
