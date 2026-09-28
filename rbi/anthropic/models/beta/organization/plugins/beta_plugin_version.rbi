# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        module Plugins
          class BetaPluginVersion < Anthropic::Internal::Type::BaseModel
            OrHash =
              T.type_alias do
                T.any(
                  Anthropic::Beta::Organization::Plugins::BetaPluginVersion,
                  Anthropic::Internal::AnyHash
                )
              end

            # The version's ID.
            sig { returns(String) }
            attr_accessor :id

            # What the version contains; null when not enumerated.
            sig do
              returns(
                T.nilable(
                  T::Array[Anthropic::Beta::Organization::BetaPluginComponent]
                )
              )
            end
            attr_accessor :components

            # This version's content scan; null when it has not been scanned.
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

            # Who uploaded this version; null when not recorded.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Organization::Plugins::BetaPluginVersion::CreatedBy::Variants
                )
              )
            end
            attr_accessor :created_by

            # The manifest's description; null when it declares none.
            sig { returns(T.nilable(String)) }
            attr_accessor :description

            # The manifest's display name; null when it declares none.
            sig { returns(T.nilable(String)) }
            attr_accessor :display_name

            # The version string the manifest declares; null when it declares none.
            sig { returns(T.nilable(String)) }
            attr_accessor :manifest_version

            # The Plugin's ID.
            sig { returns(String) }
            attr_accessor :plugin_id

            # How far the version reaches: `remote`, `privileged` or `contained`, as on the
            # Plugin; null when not classifiable.
            sig do
              returns(
                T.nilable(
                  Anthropic::Beta::Organization::Plugins::BetaPluginVersion::Reach::TaggedSymbol
                )
              )
            end
            attr_accessor :reach

            # As supplied with the upload; null when none were supplied.
            sig { returns(T.nilable(String)) }
            attr_accessor :release_notes

            # Always `plugin_version`.
            sig { returns(Symbol) }
            attr_accessor :type

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
                manifest_version: T.nilable(String),
                plugin_id: String,
                reach:
                  T.nilable(
                    Anthropic::Beta::Organization::Plugins::BetaPluginVersion::Reach::OrSymbol
                  ),
                release_notes: T.nilable(String),
                type: Symbol
              ).returns(T.attached_class)
            end
            def self.new(
              # The version's ID.
              id:,
              # What the version contains; null when not enumerated.
              components:,
              # This version's content scan; null when it has not been scanned.
              content_scan:,
              # RFC 3339.
              created_at:,
              # Who uploaded this version; null when not recorded.
              created_by:,
              # The manifest's description; null when it declares none.
              description:,
              # The manifest's display name; null when it declares none.
              display_name:,
              # The version string the manifest declares; null when it declares none.
              manifest_version:,
              # The Plugin's ID.
              plugin_id:,
              # How far the version reaches: `remote`, `privileged` or `contained`, as on the
              # Plugin; null when not classifiable.
              reach:,
              # As supplied with the upload; null when none were supplied.
              release_notes:,
              # Always `plugin_version`.
              type: :plugin_version
            )
            end

            sig do
              override.returns(
                {
                  id: String,
                  components:
                    T.nilable(
                      T::Array[
                        Anthropic::Beta::Organization::BetaPluginComponent
                      ]
                    ),
                  content_scan:
                    T.nilable(
                      Anthropic::Beta::Organization::BetaPluginContentScan
                    ),
                  created_at: Time,
                  created_by:
                    T.nilable(
                      Anthropic::Beta::Organization::Plugins::BetaPluginVersion::CreatedBy::Variants
                    ),
                  description: T.nilable(String),
                  display_name: T.nilable(String),
                  manifest_version: T.nilable(String),
                  plugin_id: String,
                  reach:
                    T.nilable(
                      Anthropic::Beta::Organization::Plugins::BetaPluginVersion::Reach::TaggedSymbol
                    ),
                  release_notes: T.nilable(String),
                  type: Symbol
                }
              )
            end
            def to_hash
            end

            # Who uploaded this version; null when not recorded.
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
                      Anthropic::Beta::Organization::Plugins::BetaPluginVersion::CreatedBy::Type
                    )
                  end
                OrSymbol = T.type_alias { T.any(Symbol, String) }

                USER_ACTOR =
                  T.let(
                    :user_actor,
                    Anthropic::Beta::Organization::Plugins::BetaPluginVersion::CreatedBy::Type::TaggedSymbol
                  )
                API_ACTOR =
                  T.let(
                    :api_actor,
                    Anthropic::Beta::Organization::Plugins::BetaPluginVersion::CreatedBy::Type::TaggedSymbol
                  )

                sig do
                  override.returns(
                    T::Array[
                      Anthropic::Beta::Organization::Plugins::BetaPluginVersion::CreatedBy::Type::TaggedSymbol
                    ]
                  )
                end
                def self.values
                end
              end

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Plugins::BetaPluginVersion::CreatedBy::Variants
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
                    Anthropic::Beta::Organization::Plugins::BetaPluginVersion::CreatedBy::Type::OrSymbol,
                  email_address: T.nilable(String),
                  user_id: String,
                  api_key_id: String
                ).returns(
                  Anthropic::Beta::Organization::Plugins::BetaPluginVersion::CreatedBy::Variants
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

            # How far the version reaches: `remote`, `privileged` or `contained`, as on the
            # Plugin; null when not classifiable.
            module Reach
              extend Anthropic::Internal::Type::Enum

              TaggedSymbol =
                T.type_alias do
                  T.all(
                    Symbol,
                    Anthropic::Beta::Organization::Plugins::BetaPluginVersion::Reach
                  )
                end
              OrSymbol = T.type_alias { T.any(Symbol, String) }

              CONTAINED =
                T.let(
                  :contained,
                  Anthropic::Beta::Organization::Plugins::BetaPluginVersion::Reach::TaggedSymbol
                )
              PRIVILEGED =
                T.let(
                  :privileged,
                  Anthropic::Beta::Organization::Plugins::BetaPluginVersion::Reach::TaggedSymbol
                )
              REMOTE =
                T.let(
                  :remote,
                  Anthropic::Beta::Organization::Plugins::BetaPluginVersion::Reach::TaggedSymbol
                )

              sig do
                override.returns(
                  T::Array[
                    Anthropic::Beta::Organization::Plugins::BetaPluginVersion::Reach::TaggedSymbol
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
end
