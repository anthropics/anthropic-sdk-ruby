# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class InviteListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::InviteListParams,
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

          # Filter by the email address the Invite was sent to. Matches the same way as the
          # Users list's `email` filter (normalized, case-insensitive).
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

          # Filter by Invite status. Repeatable; values are OR'ed together. Omit to return
          # `pending`, `accepted`, and `expired` Invites alike.
          sig do
            returns(
              T.nilable(
                T::Array[
                  Anthropic::Beta::Organization::InviteListParams::Status::OrSymbol
                ]
              )
            )
          end
          attr_reader :statuses

          sig do
            params(
              statuses:
                T::Array[
                  Anthropic::Beta::Organization::InviteListParams::Status::OrSymbol
                ]
            ).void
          end
          attr_writer :statuses

          sig do
            params(
              after_id: String,
              before_id: String,
              email: String,
              limit: Integer,
              roles: T::Array[String],
              statuses:
                T::Array[
                  Anthropic::Beta::Organization::InviteListParams::Status::OrSymbol
                ],
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
            # Filter by the email address the Invite was sent to. Matches the same way as the
            # Users list's `email` filter (normalized, case-insensitive).
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
            # Filter by Invite status. Repeatable; values are OR'ed together. Omit to return
            # `pending`, `accepted`, and `expired` Invites alike.
            statuses: nil,
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
                statuses:
                  T::Array[
                    Anthropic::Beta::Organization::InviteListParams::Status::OrSymbol
                  ],
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          module Status
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::InviteListParams::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ACCEPTED =
              T.let(
                :accepted,
                Anthropic::Beta::Organization::InviteListParams::Status::TaggedSymbol
              )
            EXPIRED =
              T.let(
                :expired,
                Anthropic::Beta::Organization::InviteListParams::Status::TaggedSymbol
              )
            PENDING =
              T.let(
                :pending,
                Anthropic::Beta::Organization::InviteListParams::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::InviteListParams::Status::TaggedSymbol
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
