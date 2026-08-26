# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class InviteCreateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::InviteCreateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # Email of the User.
          sig { returns(String) }
          attr_accessor :email

          # Role for the invited User.
          #
          # The accepted values depend on the organization type. Console and API
          # organizations accept `user`, `developer`, `billing`, and `claude_code_user`;
          # `admin` cannot be assigned through the API. Claude Enterprise organizations
          # accept `user` and `managed`.
          sig do
            returns(
              Anthropic::Beta::Organization::InviteCreateParams::Role::OrSymbol
            )
          end
          attr_accessor :role

          # RBAC group IDs to assign to the User when the Invite is accepted. A non-empty
          # array is accepted only for a Claude Enterprise organization with RBAC groups,
          # and requires the key to carry the `write:rbac_groups` scope.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :rbac_group_ids

          sig { params(rbac_group_ids: T::Array[String]).void }
          attr_writer :rbac_group_ids

          sig do
            params(
              email: String,
              role:
                Anthropic::Beta::Organization::InviteCreateParams::Role::OrSymbol,
              rbac_group_ids: T::Array[String],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # Email of the User.
            email:,
            # Role for the invited User.
            #
            # The accepted values depend on the organization type. Console and API
            # organizations accept `user`, `developer`, `billing`, and `claude_code_user`;
            # `admin` cannot be assigned through the API. Claude Enterprise organizations
            # accept `user` and `managed`.
            role:,
            # RBAC group IDs to assign to the User when the Invite is accepted. A non-empty
            # array is accepted only for a Claude Enterprise organization with RBAC groups,
            # and requires the key to carry the `write:rbac_groups` scope.
            rbac_group_ids: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                email: String,
                role:
                  Anthropic::Beta::Organization::InviteCreateParams::Role::OrSymbol,
                rbac_group_ids: T::Array[String],
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          # Role for the invited User.
          #
          # The accepted values depend on the organization type. Console and API
          # organizations accept `user`, `developer`, `billing`, and `claude_code_user`;
          # `admin` cannot be assigned through the API. Claude Enterprise organizations
          # accept `user` and `managed`.
          module Role
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::InviteCreateParams::Role
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            BILLING =
              T.let(
                :billing,
                Anthropic::Beta::Organization::InviteCreateParams::Role::TaggedSymbol
              )
            CLAUDE_CODE_USER =
              T.let(
                :claude_code_user,
                Anthropic::Beta::Organization::InviteCreateParams::Role::TaggedSymbol
              )
            DEVELOPER =
              T.let(
                :developer,
                Anthropic::Beta::Organization::InviteCreateParams::Role::TaggedSymbol
              )
            MANAGED =
              T.let(
                :managed,
                Anthropic::Beta::Organization::InviteCreateParams::Role::TaggedSymbol
              )
            USER =
              T.let(
                :user,
                Anthropic::Beta::Organization::InviteCreateParams::Role::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::InviteCreateParams::Role::TaggedSymbol
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
