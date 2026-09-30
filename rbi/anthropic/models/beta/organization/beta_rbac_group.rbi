# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class BetaRBACGroup < Anthropic::Internal::Type::BaseModel
          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::BetaRBACGroup,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the RBAC Group.
          sig { returns(String) }
          attr_accessor :id

          # RFC 3339 timestamp of when the RBAC Group was created.
          sig { returns(Time) }
          attr_accessor :created_at

          # Name of the RBAC Group. Not uniqueness-enforced.
          sig { returns(String) }
          attr_accessor :name

          # RBAC Role IDs attached to this RBAC Group. Role attachment is managed in the
          # admin settings and is read-only on this API. `null` means role data was
          # temporarily unavailable — retry to distinguish from an empty list.
          sig { returns(T.nilable(T::Array[String])) }
          attr_accessor :role_ids

          # How the RBAC Group was created: `"direct"` for groups created directly (for
          # example, in the organization's admin settings), `"scim"` for groups provisioned
          # by the identity provider.
          sig do
            returns(
              Anthropic::Beta::Organization::BetaRBACGroup::SourceType::TaggedSymbol
            )
          end
          attr_accessor :source_type

          # Object type.
          #
          # For RBAC Groups, this is always `"rbac_group"`.
          sig { returns(Symbol) }
          attr_accessor :type

          # RFC 3339 timestamp of when the RBAC Group was last updated.
          sig { returns(Time) }
          attr_accessor :updated_at

          sig do
            params(
              id: String,
              created_at: Time,
              name: String,
              role_ids: T.nilable(T::Array[String]),
              source_type:
                Anthropic::Beta::Organization::BetaRBACGroup::SourceType::OrSymbol,
              updated_at: Time,
              type: Symbol
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the RBAC Group.
            id:,
            # RFC 3339 timestamp of when the RBAC Group was created.
            created_at:,
            # Name of the RBAC Group. Not uniqueness-enforced.
            name:,
            # RBAC Role IDs attached to this RBAC Group. Role attachment is managed in the
            # admin settings and is read-only on this API. `null` means role data was
            # temporarily unavailable — retry to distinguish from an empty list.
            role_ids:,
            # How the RBAC Group was created: `"direct"` for groups created directly (for
            # example, in the organization's admin settings), `"scim"` for groups provisioned
            # by the identity provider.
            source_type:,
            # RFC 3339 timestamp of when the RBAC Group was last updated.
            updated_at:,
            # Object type.
            #
            # For RBAC Groups, this is always `"rbac_group"`.
            type: :rbac_group
          )
          end

          sig do
            override.returns(
              {
                id: String,
                created_at: Time,
                name: String,
                role_ids: T.nilable(T::Array[String]),
                source_type:
                  Anthropic::Beta::Organization::BetaRBACGroup::SourceType::TaggedSymbol,
                type: Symbol,
                updated_at: Time
              }
            )
          end
          def to_hash
          end

          # How the RBAC Group was created: `"direct"` for groups created directly (for
          # example, in the organization's admin settings), `"scim"` for groups provisioned
          # by the identity provider.
          module SourceType
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::BetaRBACGroup::SourceType
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            DIRECT =
              T.let(
                :direct,
                Anthropic::Beta::Organization::BetaRBACGroup::SourceType::TaggedSymbol
              )
            SCIM =
              T.let(
                :scim,
                Anthropic::Beta::Organization::BetaRBACGroup::SourceType::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::BetaRBACGroup::SourceType::TaggedSymbol
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
