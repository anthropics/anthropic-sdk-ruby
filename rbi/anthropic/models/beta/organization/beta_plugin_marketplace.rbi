# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaPluginMarketplace < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaPluginMarketplace,
                Anthropic::Internal::AnyHash
              )
            end

          # The plugin marketplace's ID, prefixed `marketplace_`.
          sig { returns(String) }
          attr_accessor :id

          # RFC 3339.
          sig { returns(Time) }
          attr_accessor :created_at

          # Organization plugin marketplace: the organization-wide setting every Plugin in
          # it with no setting of its own gets. Null for a member's personal plugin
          # marketplace. One of `required`, `auto_install`, `available`, `not_available`; a
          # value this API does not yet name is returned as stored.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaPluginMarketplace::DefaultInstallationPreference::Variants
              )
            )
          end
          attr_accessor :default_installation_preference

          # RFC 3339. When the most recent synchronization attempt to finish did so,
          # whatever its outcome; for a repository plugin marketplace no synchronization has
          # run on yet, when it was created. Null for a plugin marketplace that is not
          # synchronized from a repository.
          sig { returns(T.nilable(Time)) }
          attr_accessor :last_sync_ended_at

          # The commit the last synchronization attempt that reached the repository read,
          # whether or not its content was then accepted (see `sync_status`); an attempt
          # that ends `failed_auth` or `failed_transient` leaves it unchanged. Null until an
          # attempt has first read the repository, and for a plugin marketplace that is not
          # synchronized from a repository.
          sig { returns(T.nilable(String)) }
          attr_accessor :last_sync_read_sha

          # Fixed for the plugin marketplace's lifetime.
          sig { returns(String) }
          attr_accessor :name

          # The organization, or the member whose personal plugin marketplace it is.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaPluginMarketplace::Owner::Variants
            )
          end
          attr_accessor :owner

          # Where the plugin marketplace's Plugins come from: `manual` when they are
          # uploaded; `github`, `gitlab` or `public_git` when they are synchronized from the
          # Git repository the owner connected, into which nothing can be uploaded;
          # `directory` is Anthropic's own catalog, which this API does not list. A value
          # this API does not yet name is returned as stored.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaPluginMarketplace::Source::Variants
            )
          end
          attr_accessor :source

          # Outcome of the plugin marketplace's most recent synchronization: one of
          # `success`, `in_progress`, `failed_content`, `failed_transient`, `failed_auth`,
          # `failed_limits`; a value this API does not yet name is returned as stored. Null
          # until a synchronization is first attempted — so always for a `manual` plugin
          # marketplace.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::BetaPluginMarketplace::SyncStatus::Variants
              )
            )
          end
          attr_accessor :sync_status

          # Always `plugin_marketplace`.
          sig { returns(Symbol) }
          attr_accessor :type

          sig do
            params(
              id: String,
              created_at: Time,
              default_installation_preference:
                T.nilable(
                  T.any(
                    Anthropic::Beta::Organization::BetaPluginMarketplace::DefaultInstallationPreference::OrSymbol,
                    String
                  )
                ),
              last_sync_ended_at: T.nilable(Time),
              last_sync_read_sha: T.nilable(String),
              name: String,
              owner:
                T.any(
                  Anthropic::Beta::Organization::BetaPluginOwnerOrganization::OrHash,
                  Anthropic::Beta::Organization::BetaPluginOwnerUser::OrHash
                ),
              source:
                T.any(
                  Anthropic::Beta::Organization::BetaPluginMarketplace::Source::OrSymbol,
                  String
                ),
              sync_status:
                T.nilable(
                  T.any(
                    Anthropic::Beta::Organization::BetaPluginMarketplace::SyncStatus::OrSymbol,
                    String
                  )
                ),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # The plugin marketplace's ID, prefixed `marketplace_`.
            id:,
            # RFC 3339.
            created_at:,
            # Organization plugin marketplace: the organization-wide setting every Plugin in
            # it with no setting of its own gets. Null for a member's personal plugin
            # marketplace. One of `required`, `auto_install`, `available`, `not_available`; a
            # value this API does not yet name is returned as stored.
            default_installation_preference:,
            # RFC 3339. When the most recent synchronization attempt to finish did so,
            # whatever its outcome; for a repository plugin marketplace no synchronization has
            # run on yet, when it was created. Null for a plugin marketplace that is not
            # synchronized from a repository.
            last_sync_ended_at:,
            # The commit the last synchronization attempt that reached the repository read,
            # whether or not its content was then accepted (see `sync_status`); an attempt
            # that ends `failed_auth` or `failed_transient` leaves it unchanged. Null until an
            # attempt has first read the repository, and for a plugin marketplace that is not
            # synchronized from a repository.
            last_sync_read_sha:,
            # Fixed for the plugin marketplace's lifetime.
            name:,
            # The organization, or the member whose personal plugin marketplace it is.
            owner:,
            # Where the plugin marketplace's Plugins come from: `manual` when they are
            # uploaded; `github`, `gitlab` or `public_git` when they are synchronized from the
            # Git repository the owner connected, into which nothing can be uploaded;
            # `directory` is Anthropic's own catalog, which this API does not list. A value
            # this API does not yet name is returned as stored.
            source:,
            # Outcome of the plugin marketplace's most recent synchronization: one of
            # `success`, `in_progress`, `failed_content`, `failed_transient`, `failed_auth`,
            # `failed_limits`; a value this API does not yet name is returned as stored. Null
            # until a synchronization is first attempted — so always for a `manual` plugin
            # marketplace.
            sync_status:,
            # Always `plugin_marketplace`.
            type: :plugin_marketplace
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: Time,
                default_installation_preference:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaPluginMarketplace::DefaultInstallationPreference::Variants
                  ),
                last_sync_ended_at: T.nilable(Time),
                last_sync_read_sha: T.nilable(String),
                name: String,
                owner:
                  Anthropic::Beta::Organization::BetaPluginMarketplace::Owner::Variants,
                source:
                  Anthropic::Beta::Organization::BetaPluginMarketplace::Source::Variants,
                sync_status:
                  T.nilable(
                    Anthropic::Beta::Organization::BetaPluginMarketplace::SyncStatus::Variants
                  ),
                type: Symbol
              }
            )
          end
          def to_hash
          end

          # Organization plugin marketplace: the organization-wide setting every Plugin in
          # it with no setting of its own gets. Null for a member's personal plugin
          # marketplace. One of `required`, `auto_install`, `available`, `not_available`; a
          # value this API does not yet name is returned as stored.
          module DefaultInstallationPreference
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::BetaPluginMarketplace::DefaultInstallationPreference::TaggedSymbol,
                  String
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaPluginMarketplace::DefaultInstallationPreference::Variants
                ]
              )
            end
            def self.variants
            end

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaPluginMarketplace::DefaultInstallationPreference
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            AUTO_INSTALL =
              T.let(
                :auto_install,
                Anthropic::Beta::Organization::BetaPluginMarketplace::DefaultInstallationPreference::TaggedSymbol
              )
            AVAILABLE =
              T.let(
                :available,
                Anthropic::Beta::Organization::BetaPluginMarketplace::DefaultInstallationPreference::TaggedSymbol
              )
            NOT_AVAILABLE =
              T.let(
                :not_available,
                Anthropic::Beta::Organization::BetaPluginMarketplace::DefaultInstallationPreference::TaggedSymbol
              )
            REQUIRED =
              T.let(
                :required,
                Anthropic::Beta::Organization::BetaPluginMarketplace::DefaultInstallationPreference::TaggedSymbol
              )
          end

          # The organization, or the member whose personal plugin marketplace it is.
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
                    Anthropic::Beta::Organization::BetaPluginMarketplace::Owner::Type
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              ORGANIZATION =
                T.let(
                  :organization,
                  Anthropic::Beta::Organization::BetaPluginMarketplace::Owner::Type::TaggedSymbol
                )
              USER =
                T.let(
                  :user,
                  Anthropic::Beta::Organization::BetaPluginMarketplace::Owner::Type::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::BetaPluginMarketplace::Owner::Type::TaggedSymbol
                  ]
                )
              end
              def self.values
              end
            end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaPluginMarketplace::Owner::Variants
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
                  Anthropic::Beta::Organization::BetaPluginMarketplace::Owner::Type::OrSymbol,
                user_id: String
              ).returns(
                Anthropic::Beta::Organization::BetaPluginMarketplace::Owner::Variants
              )
            end
            def self.new(
              type:,
              # The member's User ID.
              user_id: nil
            )
            end
          end

          # Where the plugin marketplace's Plugins come from: `manual` when they are
          # uploaded; `github`, `gitlab` or `public_git` when they are synchronized from the
          # Git repository the owner connected, into which nothing can be uploaded;
          # `directory` is Anthropic's own catalog, which this API does not list. A value
          # this API does not yet name is returned as stored.
          module Source
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::BetaPluginMarketplace::Source::TaggedSymbol,
                  String
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaPluginMarketplace::Source::Variants
                ]
              )
            end
            def self.variants
            end

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaPluginMarketplace::Source
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            DIRECTORY =
              T.let(
                :directory,
                Anthropic::Beta::Organization::BetaPluginMarketplace::Source::TaggedSymbol
              )
            GITHUB =
              T.let(
                :github,
                Anthropic::Beta::Organization::BetaPluginMarketplace::Source::TaggedSymbol
              )
            GITLAB =
              T.let(
                :gitlab,
                Anthropic::Beta::Organization::BetaPluginMarketplace::Source::TaggedSymbol
              )
            MANUAL =
              T.let(
                :manual,
                Anthropic::Beta::Organization::BetaPluginMarketplace::Source::TaggedSymbol
              )
            PUBLIC_GIT =
              T.let(
                :public_git,
                Anthropic::Beta::Organization::BetaPluginMarketplace::Source::TaggedSymbol
              )
          end

          # Outcome of the plugin marketplace's most recent synchronization: one of
          # `success`, `in_progress`, `failed_content`, `failed_transient`, `failed_auth`,
          # `failed_limits`; a value this API does not yet name is returned as stored. Null
          # until a synchronization is first attempted — so always for a `manual` plugin
          # marketplace.
          module SyncStatus
            extend Anthropic::Internal::Type::Union

            Variants =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::BetaPluginMarketplace::SyncStatus::TaggedSymbol,
                  String
                )
              end

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaPluginMarketplace::SyncStatus::Variants
                ]
              )
            end
            def self.variants
            end

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaPluginMarketplace::SyncStatus
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            FAILED_AUTH =
              T.let(
                :failed_auth,
                Anthropic::Beta::Organization::BetaPluginMarketplace::SyncStatus::TaggedSymbol
              )
            FAILED_CONTENT =
              T.let(
                :failed_content,
                Anthropic::Beta::Organization::BetaPluginMarketplace::SyncStatus::TaggedSymbol
              )
            FAILED_LIMITS =
              T.let(
                :failed_limits,
                Anthropic::Beta::Organization::BetaPluginMarketplace::SyncStatus::TaggedSymbol
              )
            FAILED_TRANSIENT =
              T.let(
                :failed_transient,
                Anthropic::Beta::Organization::BetaPluginMarketplace::SyncStatus::TaggedSymbol
              )
            IN_PROGRESS =
              T.let(
                :in_progress,
                Anthropic::Beta::Organization::BetaPluginMarketplace::SyncStatus::TaggedSymbol
              )
            SUCCESS =
              T.let(
                :success,
                Anthropic::Beta::Organization::BetaPluginMarketplace::SyncStatus::TaggedSymbol
              )
          end
        end
      end
    end
  end
end
