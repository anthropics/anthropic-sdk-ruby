# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Plugins
          # @see Anthropic::Resources::Beta::Organization::Plugins::Shares#list
          class BetaPluginShare < Anthropic::Internal::Type::BaseModel
            # @!attribute granted_at
            #   When the share was given; a share whose role is later changed in claude.ai is
            #   re-granted and carries the time of that change.
            #
            #   @return [Time]
            required :granted_at, Time

            # @!attribute plugin_id
            #   The Plugin's ID.
            #
            #   @return [String]
            required :plugin_id, String

            # @!attribute target
            #   Who the Plugin is shared with: `organization` (every member), `rbac_group` (one
            #   RBAC Group), or `organization_member` (one member).
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaPluginTargetOrganization, Anthropic::Models::Beta::Organization::BetaPluginTargetRBACGroup, Anthropic::Models::Beta::Organization::BetaPluginTargetOrganizationMember]
            required :target, union: -> { Anthropic::Beta::Organization::Plugins::BetaPluginShare::Target }

            # @!attribute type
            #   Always `plugin_share`.
            #
            #   @return [Symbol, :plugin_share]
            required :type, const: :plugin_share

            # @!method initialize(granted_at:, plugin_id:, target:, type: :plugin_share)
            #   One share the owner of a member-owned Plugin has given. Shares are read-only in
            #   this API and have no ID of their own; who gave a share is recorded on the
            #   Compliance API activity feed, not here.
            #
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Plugins::BetaPluginShare} for more
            #   details.
            #
            #   @param granted_at [Time] When the share was given; a share whose role is later changed in claude.ai is re
            #
            #   @param plugin_id [String] The Plugin's ID.
            #
            #   @param target [Anthropic::Models::Beta::Organization::BetaPluginTargetOrganization, Anthropic::Models::Beta::Organization::BetaPluginTargetRBACGroup, Anthropic::Models::Beta::Organization::BetaPluginTargetOrganizationMember] Who the Plugin is shared with: `organization` (every member), `rbac_group` (one
            #
            #   @param type [Symbol, :plugin_share] Always `plugin_share`.

            # Who the Plugin is shared with: `organization` (every member), `rbac_group` (one
            # RBAC Group), or `organization_member` (one member).
            #
            # @see Anthropic::Models::Beta::Organization::Plugins::BetaPluginShare#target
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
              # @param type [Symbol, Anthropic::Models::Beta::Organization::Plugins::BetaPluginShare::Target::Type, String]
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
