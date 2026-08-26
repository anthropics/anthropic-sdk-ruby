# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::APIKeys#retrieve
        class BetaAPIKey < Anthropic::Internal::Type::BaseModel
          # @!attribute id
          #   ID of the API key.
          #
          #   @return [String]
          required :id, String

          # @!attribute created_at
          #   RFC 3339 datetime string indicating when the API Key was created.
          #
          #   @return [Time]
          required :created_at, Time

          # @!attribute created_by
          #   The ID and type of the actor that created the API key, or `null` when the
          #   creator is not recorded (legacy, workload-identity-federated, or system-created
          #   keys).
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAPIKeyCreatedBy, nil]
          required :created_by, -> { Anthropic::Beta::Organization::BetaAPIKeyCreatedBy }, nil?: true

          # @!attribute expires_at
          #   RFC 3339 datetime string indicating when the API Key expires, or `null` if it
          #   never expires.
          #
          #   @return [Time, nil]
          required :expires_at, Time, nil?: true

          # @!attribute name
          #   Name of the API key.
          #
          #   @return [String]
          required :name, String

          # @!attribute partial_key_hint
          #   Partially redacted hint for the API key.
          #
          #   @return [String, nil]
          required :partial_key_hint, String, nil?: true

          # @!attribute principal
          #   The principal the API key acts as (a User or a Service Account), or `null` if
          #   the API key is not bound to a principal.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAPIKeyUserActor, Anthropic::Models::Beta::Organization::BetaAPIKeyServiceAccountActor, nil]
          required :principal, union: -> { Anthropic::Beta::Organization::BetaAPIKey::Principal }, nil?: true

          # @!attribute scope
          #   Where the API key belongs: its Workspace
          #   (`{"type": "workspace", "workspace_id": "wrkspc_..."}`, with the Workspace's
          #   real ID even when it is the organization's default Workspace), or the
          #   organization (`{"type": "organization"}`) for a principal-bound API key that has
          #   no Workspace.
          #
          #   @return [Anthropic::Models::Beta::Organization::BetaAPIKeyOrganizationScope, Anthropic::Models::Beta::Organization::BetaAPIKeyWorkspaceScope]
          required :scope, union: -> { Anthropic::Beta::Organization::BetaAPIKey::Scope }

          # @!attribute status
          #   Status of the API key.
          #
          #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaAPIKey::Status]
          required :status, enum: -> { Anthropic::Beta::Organization::BetaAPIKey::Status }

          # @!attribute type
          #   Object type.
          #
          #   For API Keys, this is always `"api_key"`.
          #
          #   @return [Symbol, :api_key]
          required :type, const: :api_key

          # @!attribute workspace_id
          #   @deprecated Use `scope` instead. `workspace_id` is `null` both for an API key in the default
          #   Workspace and for a principal-bound API key that has no Workspace.
          #
          #   Deprecated: use `scope` instead. ID of the Workspace associated with the API
          #   key, or `null` if the API key belongs to the default Workspace. Also `null` for
          #   a principal-bound API key that has no Workspace; `scope` tells the two apart.
          #
          #   @return [String, nil]
          required :workspace_id, String, nil?: true

          # @!method initialize(id:, created_at:, created_by:, expires_at:, name:, partial_key_hint:, principal:, scope:, status:, workspace_id:, type: :api_key)
          #   Some parameter documentations has been truncated, see
          #   {Anthropic::Models::Beta::Organization::BetaAPIKey} for more details.
          #
          #   @param id [String] ID of the API key.
          #
          #   @param created_at [Time] RFC 3339 datetime string indicating when the API Key was created.
          #
          #   @param created_by [Anthropic::Models::Beta::Organization::BetaAPIKeyCreatedBy, nil] The ID and type of the actor that created the API key, or `null` when the
          #
          #   @param expires_at [Time, nil] RFC 3339 datetime string indicating when the API Key expires, or `null` if it ne
          #
          #   @param name [String] Name of the API key.
          #
          #   @param partial_key_hint [String, nil] Partially redacted hint for the API key.
          #
          #   @param principal [Anthropic::Models::Beta::Organization::BetaAPIKeyUserActor, Anthropic::Models::Beta::Organization::BetaAPIKeyServiceAccountActor, nil] The principal the API key acts as (a User or a Service Account), or `null` if th
          #
          #   @param scope [Anthropic::Models::Beta::Organization::BetaAPIKeyOrganizationScope, Anthropic::Models::Beta::Organization::BetaAPIKeyWorkspaceScope] Where the API key belongs: its Workspace (`{"type": "workspace", "workspace_id":
          #
          #   @param status [Symbol, Anthropic::Models::Beta::Organization::BetaAPIKey::Status] Status of the API key.
          #
          #   @param workspace_id [String, nil] Deprecated: use `scope` instead. ID of the Workspace associated with the API key
          #
          #   @param type [Symbol, :api_key] Object type.

          # The principal the API key acts as (a User or a Service Account), or `null` if
          # the API key is not bound to a principal.
          #
          # @see Anthropic::Models::Beta::Organization::BetaAPIKey#principal
          module Principal
            extend Anthropic::Internal::Type::Union

            discriminator :type

            variant :user_actor, -> { Anthropic::Beta::Organization::BetaAPIKeyUserActor }

            variant :service_account_actor, -> { Anthropic::Beta::Organization::BetaAPIKeyServiceAccountActor }

            module Type
              extend Anthropic::Internal::Type::Enum

              USER_ACTOR = :user_actor
              SERVICE_ACCOUNT_ACTOR = :service_account_actor

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Organization::BetaAPIKeyUserActor, Anthropic::Models::Beta::Organization::BetaAPIKeyServiceAccountActor)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # @param type [Symbol, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String] :user_id ID of the User the API key acts as.
            #
            #   @option args [String] :service_account_id ID of the Service Account the API key acts as.
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Organization::BetaAPIKeyUserActor, Anthropic::Models::Beta::Organization::BetaAPIKeyServiceAccountActor]
            def self.new(type:, **args)
              case type.to_sym
              when :user_actor
                Anthropic::Beta::Organization::BetaAPIKeyUserActor.new(**args)
              when :service_account_actor
                Anthropic::Beta::Organization::BetaAPIKeyServiceAccountActor.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end

          # Where the API key belongs: its Workspace
          # (`{"type": "workspace", "workspace_id": "wrkspc_..."}`, with the Workspace's
          # real ID even when it is the organization's default Workspace), or the
          # organization (`{"type": "organization"}`) for a principal-bound API key that has
          # no Workspace.
          #
          # @see Anthropic::Models::Beta::Organization::BetaAPIKey#scope
          module Scope
            extend Anthropic::Internal::Type::Union

            discriminator :type

            variant :organization, -> { Anthropic::Beta::Organization::BetaAPIKeyOrganizationScope }

            variant :workspace, -> { Anthropic::Beta::Organization::BetaAPIKeyWorkspaceScope }

            module Type
              extend Anthropic::Internal::Type::Enum

              ORGANIZATION = :organization
              WORKSPACE = :workspace

              # @!method self.values
              #   @return [Array<Symbol>]
            end

            # @!method self.variants
            #   @return [Array(Anthropic::Models::Beta::Organization::BetaAPIKeyOrganizationScope, Anthropic::Models::Beta::Organization::BetaAPIKeyWorkspaceScope)]

            # Creates a new instance of the variant class whose `type` matches the given
            # value, passing the remaining arguments to its constructor.
            #
            # Some parameter documentations has been truncated, see
            # {Anthropic::Models::Beta::Organization::BetaAPIKey::Scope} for more details.
            #
            # @param type [Symbol, String]
            #
            # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
            #
            #   @option args [String] :workspace_id ID of the Workspace the API key belongs to. Unlike the deprecated top-level `wor
            #
            # @raise [ArgumentError]
            # @return [Anthropic::Models::Beta::Organization::BetaAPIKeyOrganizationScope, Anthropic::Models::Beta::Organization::BetaAPIKeyWorkspaceScope]
            def self.new(type:, **args)
              case type.to_sym
              when :organization
                Anthropic::Beta::Organization::BetaAPIKeyOrganizationScope.new(**args)
              when :workspace
                Anthropic::Beta::Organization::BetaAPIKeyWorkspaceScope.new(**args)
              else
                raise ArgumentError, "unknown type: #{type}"
              end
            end
          end

          # Status of the API key.
          #
          # @see Anthropic::Models::Beta::Organization::BetaAPIKey#status
          module Status
            extend Anthropic::Internal::Type::Enum

            ACTIVE = :active
            ARCHIVED = :archived
            EXPIRED = :expired
            INACTIVE = :inactive

            # @!method self.values
            #   @return [Array<Symbol>]
          end
        end
      end
    end
  end
end
