# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module Plugins
          # @see Anthropic::Resources::Beta::Organization::Plugins::Versions#create
          class BetaPluginVersion < Anthropic::Internal::Type::BaseModel
            # @!attribute id
            #   The version's ID.
            #
            #   @return [String]
            required :id, String

            # @!attribute components
            #   What the version contains; null when not enumerated.
            #
            #   @return [Array<Anthropic::Models::Beta::Organization::BetaPluginComponent>, nil]
            required :components,
                     -> {
                       Anthropic::Internal::Type::ArrayOf[Anthropic::Beta::Organization::BetaPluginComponent]
                     },
                     nil?: true

            # @!attribute content_scan
            #   This version's content scan; null when it has not been scanned.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaPluginContentScan, nil]
            required :content_scan, -> { Anthropic::Beta::Organization::BetaPluginContentScan }, nil?: true

            # @!attribute created_at
            #   RFC 3339.
            #
            #   @return [Time]
            required :created_at, Time

            # @!attribute created_by
            #   Who uploaded this version; null when not recorded.
            #
            #   @return [Anthropic::Models::Beta::Organization::BetaPluginUserActor, Anthropic::Models::Beta::Organization::BetaPluginAPIActor, nil]
            required :created_by,
                     union: -> { Anthropic::Beta::Organization::Plugins::BetaPluginVersion::CreatedBy },
                     nil?: true

            # @!attribute description
            #   The manifest's description; null when it declares none.
            #
            #   @return [String, nil]
            required :description, String, nil?: true

            # @!attribute display_name
            #   The manifest's display name; null when it declares none.
            #
            #   @return [String, nil]
            required :display_name, String, nil?: true

            # @!attribute manifest_version
            #   The version string the manifest declares; null when it declares none.
            #
            #   @return [String, nil]
            required :manifest_version, String, nil?: true

            # @!attribute plugin_id
            #   The Plugin's ID.
            #
            #   @return [String]
            required :plugin_id, String

            # @!attribute reach
            #   How far the version reaches: `remote`, `privileged` or `contained`, as on the
            #   Plugin; null when not classifiable.
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::Plugins::BetaPluginVersion::Reach, nil]
            required :reach,
                     enum: -> {
                       Anthropic::Beta::Organization::Plugins::BetaPluginVersion::Reach
                     },
                     nil?: true

            # @!attribute release_notes
            #   As supplied with the upload; null when none were supplied.
            #
            #   @return [String, nil]
            required :release_notes, String, nil?: true

            # @!attribute type
            #   Always `plugin_version`.
            #
            #   @return [Symbol, :plugin_version]
            required :type, const: :plugin_version

            # @!method initialize(id:, components:, content_scan:, created_at:, created_by:, description:, display_name:, manifest_version:, plugin_id:, reach:, release_notes:, type: :plugin_version)
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::Plugins::BetaPluginVersion} for more
            #   details.
            #
            #   @param id [String] The version's ID.
            #
            #   @param components [Array<Anthropic::Models::Beta::Organization::BetaPluginComponent>, nil] What the version contains; null when not enumerated.
            #
            #   @param content_scan [Anthropic::Models::Beta::Organization::BetaPluginContentScan, nil] This version's content scan; null when it has not been scanned.
            #
            #   @param created_at [Time] RFC 3339.
            #
            #   @param created_by [Anthropic::Models::Beta::Organization::BetaPluginUserActor, Anthropic::Models::Beta::Organization::BetaPluginAPIActor, nil] Who uploaded this version; null when not recorded.
            #
            #   @param description [String, nil] The manifest's description; null when it declares none.
            #
            #   @param display_name [String, nil] The manifest's display name; null when it declares none.
            #
            #   @param manifest_version [String, nil] The version string the manifest declares; null when it declares none.
            #
            #   @param plugin_id [String] The Plugin's ID.
            #
            #   @param reach [Symbol, Anthropic::Models::Beta::Organization::Plugins::BetaPluginVersion::Reach, nil] How far the version reaches: `remote`, `privileged` or `contained`, as on the Pl
            #
            #   @param release_notes [String, nil] As supplied with the upload; null when none were supplied.
            #
            #   @param type [Symbol, :plugin_version] Always `plugin_version`.

            # Who uploaded this version; null when not recorded.
            #
            # @see Anthropic::Models::Beta::Organization::Plugins::BetaPluginVersion#created_by
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
              # {Anthropic::Models::Beta::Organization::Plugins::BetaPluginVersion::CreatedBy}
              # for more details.
              #
              # @param type [Symbol, Anthropic::Models::Beta::Organization::Plugins::BetaPluginVersion::CreatedBy::Type, String]
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

            # How far the version reaches: `remote`, `privileged` or `contained`, as on the
            # Plugin; null when not classifiable.
            #
            # @see Anthropic::Models::Beta::Organization::Plugins::BetaPluginVersion#reach
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
end
