# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class UserListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::UserListParams,
                Anthropic::Internal::AnyHash
              )
            end

          # ID of the object to use as a cursor for pagination. When provided, returns the
          # page of results immediately after this object.
          sig { returns(T.nilable(String)) }
          attr_reader :after_id

          sig { params(after_id: String).void }
          attr_writer :after_id

          # ID of the object to use as a cursor for pagination. When provided, returns the
          # page of results immediately before this object.
          sig { returns(T.nilable(String)) }
          attr_reader :before_id

          sig { params(before_id: String).void }
          attr_writer :before_id

          # Filter by user email.
          sig { returns(T.nilable(String)) }
          attr_reader :email

          sig { params(email: String).void }
          attr_writer :email

          # Number of items to return per page.
          #
          # Defaults to `20`. Ranges from `1` to `1000`.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Filter to items whose `role` equals one of the supplied values. Repeatable;
          # values are OR'ed together.
          #
          # Accepted values depend on the organization type: Console and API organizations
          # accept `user`, `developer`, `billing`, `admin`, and `claude_code_user`; Claude
          # Enterprise organizations accept `user`, `owner`, `primary_owner`,
          # `membership_admin`, and `managed`.
          sig { returns(T.nilable(T::Array[String])) }
          attr_reader :roles

          sig { params(roles: T::Array[String]).void }
          attr_writer :roles

          sig do
            params(
              after_id: String,
              before_id: String,
              email: String,
              limit: Integer,
              roles: T::Array[String],
              request_options: Anthropic::RequestOptions::OrHash
            ).returns(T.attached_class)
          end
          def self.new(
            # ID of the object to use as a cursor for pagination. When provided, returns the
            # page of results immediately after this object.
            after_id: nil,
            # ID of the object to use as a cursor for pagination. When provided, returns the
            # page of results immediately before this object.
            before_id: nil,
            # Filter by user email.
            email: nil,
            # Number of items to return per page.
            #
            # Defaults to `20`. Ranges from `1` to `1000`.
            limit: nil,
            # Filter to items whose `role` equals one of the supplied values. Repeatable;
            # values are OR'ed together.
            #
            # Accepted values depend on the organization type: Console and API organizations
            # accept `user`, `developer`, `billing`, `admin`, and `claude_code_user`; Claude
            # Enterprise organizations accept `user`, `owner`, `primary_owner`,
            # `membership_admin`, and `managed`.
            roles: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                after_id: String,
                before_id: String,
                email: String,
                limit: Integer,
                roles: T::Array[String],
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end
        end
      end
    end
  end
end
