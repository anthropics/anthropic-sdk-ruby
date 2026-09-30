# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::PluginMarketplaces#retrieve
        class BetaPluginMarketplace < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   The plugin marketplace's ID, prefixed `marketplace_`.
          #
          #   @return [String]
          required :id, String

          # @!attribute created_at
          #   RFC 3339.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute default_installation_preference
          #   Organization plugin marketplace: the organization-wide setting every Plugin in
          #   it with no setting of its own gets. Null for a member's personal plugin
          #   marketplace. One of `required`, `auto_install`, `available`, `not_available`; a
          #   value this API does not yet name is returned as stored.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaPluginMarketplace::DefaultInstallationPreference, nil]
          required :default_installation_preference,
                   enum: -> {
                     Anthropic::Beta::Organization::BetaPluginMarketplace::DefaultInstallationPreference
                   },
                   nil?: true

          # @!attribute last_sync_ended_at
          #   RFC 3339. When the most recent synchronization attempt to finish did so,
          #   whatever its outcome; for a repository plugin marketplace no synchronization has
          #   run on yet, when it was created. Null for a plugin marketplace that is not
          #   synchronized from a repository.
          #
          #   @return [Time, nil]
          required :last_sync_ended_at, Time, nil?: true

          # @!attribute last_sync_read_sha
          #   The commit the last synchronization attempt that reached the repository read,
          #   whether or not its content was then accepted (see `sync_status`); an attempt
          #   that ends `failed_auth` or `failed_transient` leaves it unchanged. Null until an
          #   attempt has first read the repository, and for a plugin marketplace that is not
          #   synchronized from a repository.
          #
          #   @return [String, nil]
          required :last_sync_read_sha, String, nil?: true

          # @!attribute name
          #   Fixed for the plugin marketplace's lifetime.
          #
          #   @return [String]
          required :name, String

          # @!attribute owner
          #   The organization, or the member whose personal plugin marketplace it is.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaPluginOwnerOrganization, Anthropic::Models::Beta::Organization::BetaPluginOwnerUser]
          required :owner, union: -> { Anthropic::Beta::Organization::BetaPluginMarketplace::Owner }

          # @!attribute source
          #   Where the plugin marketplace's Plugins come from: `manual` when they are
          #   uploaded; `github`, `gitlab` or `public_git` when they are synchronized from the
          #   Git repository the owner connected, into which nothing can be uploaded;
          #   `directory` is Anthropic's own catalog, which this API does not list. A value
          #   this API does not yet name is returned as stored.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaPluginMarketplace::Source]
          required :source, enum: -> { Anthropic::Beta::Organization::BetaPluginMarketplace::Source }

          # @!attribute sync_status
          #   Outcome of the plugin marketplace's most recent synchronization: one of
          #   `success`, `in_progress`, `failed_content`, `failed_transient`, `failed_auth`,
          #   `failed_limits`; a value this API does not yet name is returned as stored. Null
          #   until a synchronization is first attempted — so always for a `manual` plugin
          #   marketplace.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaPluginMarketplace::SyncStatus, nil]
          required :sync_status,
                   enum: -> { Anthropic::Beta::Organization::BetaPluginMarketplace::SyncStatus },
                   nil?: true

          # @!attribute type
          #   Always `plugin_marketplace`.
          #
          #   @return [Symbol, :plugin_marketplace]
          required :type, const: :plugin_marketplace

          # @!method initialize(id:, created_at:, default_installation_preference:, last_sync_ended_at:, last_sync_read_sha:, name:, owner:, source:, sync_status:, type: :plugin_marketplace)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaPluginMarketplace} for more details.
          #
          #   @param id [String] The plugin marketplace's ID, prefixed `marketplace_`.
          #
          #   @param created_at [Time] RFC 3339.
          #
          #   @param default_installation_preference [Symbol, Anthropic::Models::Beta::Organization::BetaPluginMarketplace::DefaultInstallationPreference, nil] Organization plugin marketplace: the organization-wide setting every Plugin in i
          #
          #   @param last_sync_ended_at [Time, nil] RFC 3339. When the most recent synchronization attempt to finish did so, whateve
          #
          #   @param last_sync_read_sha [String, nil] The commit the last synchronization attempt that reached the repository read, wh
          #
          #   @param name [String] Fixed for the plugin marketplace's lifetime.
          #
          #   @param owner [Anthropic::Models::Beta::Organization::BetaPluginOwnerOrganization, Anthropic::Models::Beta::Organization::BetaPluginOwnerUser] The organization, or the member whose personal plugin marketplace it is.
          #
          #   @param source [Symbol, Anthropic::Models::Beta::Organization::BetaPluginMarketplace::Source] Where the plugin marketplace's Plugins come from: `manual` when they are uploade
          #
          #   @param sync_status [Symbol, Anthropic::Models::Beta::Organization::BetaPluginMarketplace::SyncStatus, nil] Outcome of the plugin marketplace's most recent synchronization: one of `success
          #
          #   @param type [Symbol, :plugin_marketplace] Always `plugin_marketplace`.

          # Organization plugin marketplace: the organization-wide setting every Plugin in
          # it with no setting of its own gets. Null for a member's personal plugin
          # marketplace. One of `required`, `auto_install`, `available`, `not_available`; a
          # value this API does not yet name is returned as stored.
          #
          # @see Anthropic::Models::Beta::Organization::BetaPluginMarketplace#default_installation_preference
          module DefaultInstallationPreference
            extend Anthropic::Internal::Type::Enum

            AUTO_INSTALL = :auto_install
            AVAILABLE = :available
            NOT_AVAILABLE = :not_available
            REQUIRED = :required

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # The organization, or the member whose personal plugin marketplace it is.
          #
          # @see Anthropic::Models::Beta::Organization::BetaPluginMarketplace#owner
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
            # @param type [Symbol, Anthropic::Models::Beta::Organization::BetaPluginMarketplace::Owner::Type, String]
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

          # Where the plugin marketplace's Plugins come from: `manual` when they are
          # uploaded; `github`, `gitlab` or `public_git` when they are synchronized from the
          # Git repository the owner connected, into which nothing can be uploaded;
          # `directory` is Anthropic's own catalog, which this API does not list. A value
          # this API does not yet name is returned as stored.
          #
          # @see Anthropic::Models::Beta::Organization::BetaPluginMarketplace#source
          module Source
            extend Anthropic::Internal::Type::Enum

            DIRECTORY = :directory
            GITHUB = :github
            GITLAB = :gitlab
            MANUAL = :manual
            PUBLIC_GIT = :public_git

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # Outcome of the plugin marketplace's most recent synchronization: one of
          # `success`, `in_progress`, `failed_content`, `failed_transient`, `failed_auth`,
          # `failed_limits`; a value this API does not yet name is returned as stored. Null
          # until a synchronization is first attempted — so always for a `manual` plugin
          # marketplace.
          #
          # @see Anthropic::Models::Beta::Organization::BetaPluginMarketplace#sync_status
          module SyncStatus
            extend Anthropic::Internal::Type::Enum

            FAILED_AUTH = :failed_auth
            FAILED_CONTENT = :failed_content
            FAILED_LIMITS = :failed_limits
            FAILED_TRANSIENT = :failed_transient
            IN_PROGRESS = :in_progress
            SUCCESS = :success

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
