# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaServiceAccount < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaServiceAccount,
                Anthropic::Internal::AnyHash
              )
            end

          # Tagged ID of the service account.
          sig { returns(String) }
          attr_accessor :id

          # If set, this service account is archived.
          sig { returns(T.nilable(Time)) }
          attr_accessor :archived_at

          # Tagged ID (`user_`/`svac_`) of the actor that archived this service account.
          sig { returns(T.nilable(String)) }
          attr_accessor :archived_by_actor_id

          # When this service account was created.
          sig { returns(Time) }
          attr_accessor :created_at

          # Tagged ID (`user_`/`svac_`) of the actor that created this service account.
          sig { returns(T.nilable(String)) }
          attr_accessor :created_by_actor_id

          # Optional free-text description.
          sig { returns(T.nilable(String)) }
          attr_accessor :description

          # Admin-chosen slug identifier.
          sig { returns(String) }
          attr_accessor :name

          # Org-level role. A federation rule may only be created or retargeted to grant
          # `org:admin` scope when this is `admin`. A rule granting `org:admin` whose target
          # is later demoted to `developer` is rejected at token exchange. Rules granting
          # `org:admin` are managed in the Console.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaServiceAccount::OrganizationRole::TaggedSymbol
            )
          end
          attr_accessor :organization_role

          sig { returns(Symbol) }
          attr_accessor :type

          # When this service account was last updated.
          sig { returns(Time) }
          attr_accessor :updated_at

          # Tagged ID (`user_`/`svac_`) of the actor that last updated this service account.
          sig { returns(T.nilable(String)) }
          attr_accessor :updated_by_actor_id

          # Named non-human identity within the caller's organization.
          #
          # A service account is a pure identity: name + org. Authorization lives on
          # whatever references it (federation rules).
          sig do
            params(
              id: String,
              archived_at: T.nilable(Time),
              archived_by_actor_id: T.nilable(String),
              created_at: Time,
              created_by_actor_id: T.nilable(String),
              description: T.nilable(String),
              name: String,
              organization_role:
                Anthropic::Beta::Organization::BetaServiceAccount::OrganizationRole::OrSymbol,
              updated_at: Time,
              updated_by_actor_id: T.nilable(String),
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # Tagged ID of the service account.
            id:,
            # If set, this service account is archived.
            archived_at:,
            # Tagged ID (`user_`/`svac_`) of the actor that archived this service account.
            archived_by_actor_id:,
            # When this service account was created.
            created_at:,
            # Tagged ID (`user_`/`svac_`) of the actor that created this service account.
            created_by_actor_id:,
            # Optional free-text description.
            description:,
            # Admin-chosen slug identifier.
            name:,
            # Org-level role. A federation rule may only be created or retargeted to grant
            # `org:admin` scope when this is `admin`. A rule granting `org:admin` whose target
            # is later demoted to `developer` is rejected at token exchange. Rules granting
            # `org:admin` are managed in the Console.
            organization_role:,
            # When this service account was last updated.
            updated_at:,
            # Tagged ID (`user_`/`svac_`) of the actor that last updated this service account.
            updated_by_actor_id:,
            type: :service_account
          )
          end

          sig do
            override.returns(
              {
                id: String,
                archived_at: T.nilable(Time),
                archived_by_actor_id: T.nilable(String),
                created_at: Time,
                created_by_actor_id: T.nilable(String),
                description: T.nilable(String),
                name: String,
                organization_role:
                  Anthropic::Beta::Organization::BetaServiceAccount::OrganizationRole::TaggedSymbol,
                type: Symbol,
                updated_at: Time,
                updated_by_actor_id: T.nilable(String)
              }
            )
          end
          def to_hash
          end

          # Org-level role. A federation rule may only be created or retargeted to grant
          # `org:admin` scope when this is `admin`. A rule granting `org:admin` whose target
          # is later demoted to `developer` is rejected at token exchange. Rules granting
          # `org:admin` are managed in the Console.
          module OrganizationRole
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaServiceAccount::OrganizationRole
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ADMIN =
              T.let(
                :admin,
                Anthropic::Beta::Organization::BetaServiceAccount::OrganizationRole::TaggedSymbol
              )
            DEVELOPER =
              T.let(
                :developer,
                Anthropic::Beta::Organization::BetaServiceAccount::OrganizationRole::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaServiceAccount::OrganizationRole::TaggedSymbol
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
