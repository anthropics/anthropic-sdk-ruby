# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class UserUpdateParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::UserUpdateParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the User.
          sig { returns(String) }
          attr_accessor :user_id

          # New role for the User.
          #
          # The accepted values depend on the organization type. Console and API
          # organizations accept `user`, `developer`, `billing`, and `claude_code_user`;
          # `admin` cannot be assigned through the API. Claude Enterprise organizations
          # accept `user` and `managed`.
          sig do
            returns(
              Anthropic::Beta::Organization::UserUpdateParams::Role::OrSymbol
            )
          end
          attr_accessor :role

          sig do
            params(
              user_id: String,
              role:
                Anthropic::Beta::Organization::UserUpdateParams::Role::OrSymbol,
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the User.
            user_id:,
            # New role for the User.
            #
            # The accepted values depend on the organization type. Console and API
            # organizations accept `user`, `developer`, `billing`, and `claude_code_user`;
            # `admin` cannot be assigned through the API. Claude Enterprise organizations
            # accept `user` and `managed`.
            role:,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                user_id: String,
                role:
                  Anthropic::Beta::Organization::UserUpdateParams::Role::OrSymbol,
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          # New role for the User.
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
                  Anthropic::Beta::Organization::UserUpdateParams::Role
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            BILLING =
              T.let(
                :billing,
                Anthropic::Beta::Organization::UserUpdateParams::Role::TaggedSymbol
              )
            CLAUDE_CODE_USER =
              T.let(
                :claude_code_user,
                Anthropic::Beta::Organization::UserUpdateParams::Role::TaggedSymbol
              )
            DEVELOPER =
              T.let(
                :developer,
                Anthropic::Beta::Organization::UserUpdateParams::Role::TaggedSymbol
              )
            MANAGED =
              T.let(
                :managed,
                Anthropic::Beta::Organization::UserUpdateParams::Role::TaggedSymbol
              )
            USER =
              T.let(
                :user,
                Anthropic::Beta::Organization::UserUpdateParams::Role::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::UserUpdateParams::Role::TaggedSymbol
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
