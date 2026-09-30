# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # @see Anthropic::Resources::Organization::APIKeys#retrieve
      class APIKey < Anthropic::Internal::Type::BaseModel
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
        #   @return [Anthropic::Models::Organization::APIKeyCreatedBy, nil]
        required :created_by, -> { Anthropic::Organization::APIKeyCreatedBy }, nil?: true

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
        #   @return [Anthropic::Models::Organization::APIKeyUserActor, Anthropic::Models::Organization::APIKeyServiceAccountActor, nil]
        required :principal, union: -> { Anthropic::Organization::APIKey::Principal }, nil?: true

        # @!attribute scope
        #   Where the API key belongs: its Workspace
        #   (`{"type": "workspace", "workspace_id": "wrkspc_..."}`, with the Workspace's
        #   real ID even when it is the organization's default Workspace), or the
        #   organization (`{"type": "organization"}`) for a principal-bound API key that has
        #   no Workspace.
        #
        #   @return [Anthropic::Models::Organization::APIKeyOrganizationScope, Anthropic::Models::Organization::APIKeyWorkspaceScope]
        required :scope, union: -> { Anthropic::Organization::APIKey::Scope }

        # @!attribute status
        #   Status of the API key.
        #
        #   @return [Symbol, Anthropic::Models::Organization::APIKey::Status]
        required :status, enum: -> { Anthropic::Organization::APIKey::Status }

        # @!attribute type
        #   Object type.
        #
        #   For API Keys, this is always `"api_key"`.
        #
        #   @return [Symbol, :api_key]
        required :type, const: :api_key

        # @!method initialize(id:, created_at:, created_by:, expires_at:, name:, partial_key_hint:, principal:, scope:, status:, type: :api_key)
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Organization::APIKey} for more details.
        #
        #   @param id [String] ID of the API key.
        #
        #   @param created_at [Time] RFC 3339 datetime string indicating when the API Key was created.
        #
        #   @param created_by [Anthropic::Models::Organization::APIKeyCreatedBy, nil] The ID and type of the actor that created the API key, or `null` when the
        #
        #   @param expires_at [Time, nil] RFC 3339 datetime string indicating when the API Key expires, or `null` if it ne
        #
        #   @param name [String] Name of the API key.
        #
        #   @param partial_key_hint [String, nil] Partially redacted hint for the API key.
        #
        #   @param principal [Anthropic::Models::Organization::APIKeyUserActor, Anthropic::Models::Organization::APIKeyServiceAccountActor, nil] The principal the API key acts as (a User or a Service Account), or `null` if th
        #
        #   @param scope [Anthropic::Models::Organization::APIKeyOrganizationScope, Anthropic::Models::Organization::APIKeyWorkspaceScope] Where the API key belongs: its Workspace (`{"type": "workspace", "workspace_id":
        #
        #   @param status [Symbol, Anthropic::Models::Organization::APIKey::Status] Status of the API key.
        #
        #   @param type [Symbol, :api_key] Object type.

        # The principal the API key acts as (a User or a Service Account), or `null` if
        # the API key is not bound to a principal.
        #
        # @see Anthropic::Models::Organization::APIKey#principal
        module Principal
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :user_actor, -> { Anthropic::Organization::APIKeyUserActor }

          variant :service_account_actor, -> { Anthropic::Organization::APIKeyServiceAccountActor }

          module Type
            extend Anthropic::Internal::Type::Enum

            USER_ACTOR = :user_actor
            SERVICE_ACCOUNT_ACTOR = :service_account_actor

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Organization::APIKeyUserActor, Anthropic::Models::Organization::APIKeyServiceAccountActor)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # @param type [Symbol, Anthropic::Models::Organization::APIKey::Principal::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :user_id ID of the User the API key acts as.
          #
          #   @option args [String] :service_account_id ID of the Service Account the API key acts as.
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Organization::APIKeyUserActor, Anthropic::Models::Organization::APIKeyServiceAccountActor]
          def self.new(type:, **args)
            case type.to_sym
            when :user_actor
              Anthropic::Organization::APIKeyUserActor.new(**args)
            when :service_account_actor
              Anthropic::Organization::APIKeyServiceAccountActor.new(**args)
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
        # @see Anthropic::Models::Organization::APIKey#scope
        module Scope
          extend Anthropic::Internal::Type::Union

          discriminator :type

          variant :organization, -> { Anthropic::Organization::APIKeyOrganizationScope }

          variant :workspace, -> { Anthropic::Organization::APIKeyWorkspaceScope }

          module Type
            extend Anthropic::Internal::Type::Enum

            ORGANIZATION = :organization
            WORKSPACE = :workspace

            # @!method self.values
            #   @return [Array<Symbol>]
          end

          # @!method self.variants
          #   @return [Array(Anthropic::Models::Organization::APIKeyOrganizationScope, Anthropic::Models::Organization::APIKeyWorkspaceScope)]

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          #
          # Some parameter documentations has been truncated, see
          # {Anthropic::Models::Organization::APIKey::Scope} for more details.
          #
          # @param type [Symbol, Anthropic::Models::Organization::APIKey::Scope::Type, String]
          #
          # @param args [Hash{Symbol=>Object}] Attributes for the chosen variant.
          #
          #   @option args [String] :workspace_id ID of the Workspace the API key belongs to. Unlike the deprecated top-level `wor
          #
          # @raise [ArgumentError]
          # @return [Anthropic::Models::Organization::APIKeyOrganizationScope, Anthropic::Models::Organization::APIKeyWorkspaceScope]
          def self.new(type:, **args)
            case type.to_sym
            when :organization
              Anthropic::Organization::APIKeyOrganizationScope.new(**args)
            when :workspace
              Anthropic::Organization::APIKeyWorkspaceScope.new(**args)
            else
              raise ArgumentError, "unknown type: #{type}"
            end
          end
        end

        # Status of the API key.
        #
        # @see Anthropic::Models::Organization::APIKey#status
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
