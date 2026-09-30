# typed: strong

module Anthropic
  module Models
    module Organization
      class APIKey < Anthropic::Internal::Type::BaseModel
        OrHash =
          T.type_alias do
            T.any(Anthropic::Organization::APIKey, Anthropic::Internal::AnyHash)
          end

        # ID of the API key.
        sig { returns(String) }
        attr_accessor :id

        # RFC 3339 datetime string indicating when the API Key was created.
        sig { returns(Time) }
        attr_accessor :created_at

        # The ID and type of the actor that created the API key, or `null` when the
        # creator is not recorded (legacy, workload-identity-federated, or system-created
        # keys).
        sig { returns(T.nilable(Anthropic::Organization::APIKeyCreatedBy)) }
        attr_reader :created_by

        sig do
          params(
            created_by:
              T.nilable(Anthropic::Organization::APIKeyCreatedBy::OrHash)
          ).void
        end
        attr_writer :created_by

        # RFC 3339 datetime string indicating when the API Key expires, or `null` if it
        # never expires.
        sig { returns(T.nilable(Time)) }
        attr_accessor :expires_at

        # Name of the API key.
        sig { returns(String) }
        attr_accessor :name

        # Partially redacted hint for the API key.
        sig { returns(T.nilable(String)) }
        attr_accessor :partial_key_hint

        # The principal the API key acts as (a User or a Service Account), or `null` if
        # the API key is not bound to a principal.
        sig do
          returns(
            T.nilable(Anthropic::Organization::APIKey::Principal::Variants)
          )
        end
        attr_accessor :principal

        # Where the API key belongs: its Workspace
        # (`{"type": "workspace", "workspace_id": "wrkspc_..."}`, with the Workspace's
        # real ID even when it is the organization's default Workspace), or the
        # organization (`{"type": "organization"}`) for a principal-bound API key that has
        # no Workspace.
        sig { returns(Anthropic::Organization::APIKey::Scope::Variants) }
        attr_accessor :scope

        # Status of the API key.
        sig { returns(Anthropic::Organization::APIKey::Status::TaggedSymbol) }
        attr_accessor :status

        # Object type.
        #
        # For API Keys, this is always `"api_key"`.
        sig { returns(Symbol) }
        attr_accessor :type

        sig do
          params(
            id: String,
            created_at: Time,
            created_by:
              T.nilable(Anthropic::Organization::APIKeyCreatedBy::OrHash),
            expires_at: T.nilable(Time),
            name: String,
            partial_key_hint: T.nilable(String),
            principal:
              T.nilable(
                T.any(
                  Anthropic::Organization::APIKeyUserActor::OrHash,
                  Anthropic::Organization::APIKeyServiceAccountActor::OrHash
                )
              ),
            scope:
              T.any(
                Anthropic::Organization::APIKeyOrganizationScope::OrHash,
                Anthropic::Organization::APIKeyWorkspaceScope::OrHash
              ),
            status: Anthropic::Organization::APIKey::Status::OrSymbol,
            type: Symbol
          ).returns(T.attached_class)
        end
        def self.new(
          # ID of the API key.
          id:,
          # RFC 3339 datetime string indicating when the API Key was created.
          created_at:,
          # The ID and type of the actor that created the API key, or `null` when the
          # creator is not recorded (legacy, workload-identity-federated, or system-created
          # keys).
          created_by:,
          # RFC 3339 datetime string indicating when the API Key expires, or `null` if it
          # never expires.
          expires_at:,
          # Name of the API key.
          name:,
          # Partially redacted hint for the API key.
          partial_key_hint:,
          # The principal the API key acts as (a User or a Service Account), or `null` if
          # the API key is not bound to a principal.
          principal:,
          # Where the API key belongs: its Workspace
          # (`{"type": "workspace", "workspace_id": "wrkspc_..."}`, with the Workspace's
          # real ID even when it is the organization's default Workspace), or the
          # organization (`{"type": "organization"}`) for a principal-bound API key that has
          # no Workspace.
          scope:,
          # Status of the API key.
          status:,
          # Object type.
          #
          # For API Keys, this is always `"api_key"`.
          type: :api_key
        )
        end

        sig do
          override.returns(
            {
              id: String,
              created_at: Time,
              created_by: T.nilable(Anthropic::Organization::APIKeyCreatedBy),
              expires_at: T.nilable(Time),
              name: String,
              partial_key_hint: T.nilable(String),
              principal:
                T.nilable(Anthropic::Organization::APIKey::Principal::Variants),
              scope: Anthropic::Organization::APIKey::Scope::Variants,
              status: Anthropic::Organization::APIKey::Status::TaggedSymbol,
              type: Symbol
            }
          )
        end
        def to_hash
        end

        # The principal the API key acts as (a User or a Service Account), or `null` if
        # the API key is not bound to a principal.
        module Principal
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Organization::APIKeyUserActor,
                Anthropic::Organization::APIKeyServiceAccountActor
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Anthropic::Organization::APIKey::Principal::Type)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            USER_ACTOR =
              T.let(
                :user_actor,
                Anthropic::Organization::APIKey::Principal::Type::TaggedSymbol
              )
            SERVICE_ACCOUNT_ACTOR =
              T.let(
                :service_account_actor,
                Anthropic::Organization::APIKey::Principal::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Organization::APIKey::Principal::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[Anthropic::Organization::APIKey::Principal::Variants]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: Anthropic::Organization::APIKey::Principal::Type::OrSymbol,
              user_id: String,
              service_account_id: String
            ).returns(Anthropic::Organization::APIKey::Principal::Variants)
          end
          def self.new(
            type:,
            # ID of the User the API key acts as.
            user_id: nil,
            # ID of the Service Account the API key acts as.
            service_account_id: nil
          )
          end
        end

        # Where the API key belongs: its Workspace
        # (`{"type": "workspace", "workspace_id": "wrkspc_..."}`, with the Workspace's
        # real ID even when it is the organization's default Workspace), or the
        # organization (`{"type": "organization"}`) for a principal-bound API key that has
        # no Workspace.
        module Scope
          extend Anthropic::Internal::Type::Union

          Variants =
            T.type_alias do
              T.any(
                Anthropic::Organization::APIKeyOrganizationScope,
                Anthropic::Organization::APIKeyWorkspaceScope
              )
            end

          module Type
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(Symbol, Anthropic::Organization::APIKey::Scope::Type)
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ORGANIZATION =
              T.let(
                :organization,
                Anthropic::Organization::APIKey::Scope::Type::TaggedSymbol
              )
            WORKSPACE =
              T.let(
                :workspace,
                Anthropic::Organization::APIKey::Scope::Type::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Organization::APIKey::Scope::Type::TaggedSymbol
                ]
              )
            end
            def self.values
            end
          end

          sig do
            override.returns(
              T::Array[Anthropic::Organization::APIKey::Scope::Variants]
            )
          end
          def self.variants
          end

          # Creates a new instance of the variant class whose `type` matches the given
          # value, passing the remaining arguments to its constructor.
          sig do
            params(
              type: Anthropic::Organization::APIKey::Scope::Type::OrSymbol,
              workspace_id: String
            ).returns(Anthropic::Organization::APIKey::Scope::Variants)
          end
          def self.new(
            type:,
            # ID of the Workspace the API key belongs to. Unlike the deprecated top-level
            # `workspace_id`, this is the Workspace's real ID even for the organization's
            # default Workspace.
            workspace_id: nil
          )
          end
        end

        # Status of the API key.
        module Status
          extend Anthropic::Internal::Type::Enum

          TaggedSymbol =
            T.type_alias do
              T.all(Symbol, Anthropic::Organization::APIKey::Status)
            end
          OrSymbol = T.type_alias { T.any(Symbol, String) }

          ACTIVE =
            T.let(
              :active,
              Anthropic::Organization::APIKey::Status::TaggedSymbol
            )
          ARCHIVED =
            T.let(
              :archived,
              Anthropic::Organization::APIKey::Status::TaggedSymbol
            )
          EXPIRED =
            T.let(
              :expired,
              Anthropic::Organization::APIKey::Status::TaggedSymbol
            )
          INACTIVE =
            T.let(
              :inactive,
              Anthropic::Organization::APIKey::Status::TaggedSymbol
            )

          sig do
            override.returns(
              T::Array[Anthropic::Organization::APIKey::Status::TaggedSymbol]
            )
          end
          def self.values
          end
        end
      end
    end
  end
end
