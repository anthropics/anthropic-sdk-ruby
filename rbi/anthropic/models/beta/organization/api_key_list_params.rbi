# typed: strong

module Anthropic
  module Models
    module Beta
      module Organization
        class APIKeyListParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          OrHash =
            T.type_alias do
              T.any(
                Anthropic::Beta::Organization::APIKeyListParams,
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

          # Filter by the ID of the User who created the object.
          sig { returns(T.nilable(String)) }
          attr_accessor :created_by_user_id

          # Number of items to return per page.
          #
          # Defaults to `20`. Ranges from `1` to `1000`.
          sig { returns(T.nilable(Integer)) }
          attr_reader :limit

          sig { params(limit: Integer).void }
          attr_writer :limit

          # Filter by API key status.
          sig do
            returns(
              T.nilable(
                Anthropic::Beta::Organization::APIKeyListParams::Status::OrSymbol
              )
            )
          end
          attr_accessor :status

          # Filter by Workspace ID.
          sig { returns(T.nilable(String)) }
          attr_accessor :workspace_id

          sig do
            params(
              after_id: String,
              before_id: String,
              created_by_user_id: T.nilable(String),
              limit: Integer,
              status:
                T.nilable(
                  Anthropic::Beta::Organization::APIKeyListParams::Status::OrSymbol
                ),
              workspace_id: T.nilable(String),
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
            # Filter by the ID of the User who created the object.
            created_by_user_id: nil,
            # Number of items to return per page.
            #
            # Defaults to `20`. Ranges from `1` to `1000`.
            limit: nil,
            # Filter by API key status.
            status: nil,
            # Filter by Workspace ID.
            workspace_id: nil,
            request_options: {}
          )
          end

          sig do
            override.returns(
              {
                after_id: String,
                before_id: String,
                created_by_user_id: T.nilable(String),
                limit: Integer,
                status:
                  T.nilable(
                    Anthropic::Beta::Organization::APIKeyListParams::Status::OrSymbol
                  ),
                workspace_id: T.nilable(String),
                request_options: Anthropic::RequestOptions
              }
            )
          end
          def to_hash
          end

          # Filter by API key status.
          module Status
            extend Anthropic::Internal::Type::Enum

            TaggedSymbol =
              T.type_alias do
                T.all(
                  Symbol,
                  Anthropic::Beta::Organization::APIKeyListParams::Status
                )
              end
            OrSymbol = T.type_alias { T.any(Symbol, String) }

            ACTIVE =
              T.let(
                :active,
                Anthropic::Beta::Organization::APIKeyListParams::Status::TaggedSymbol
              )
            ARCHIVED =
              T.let(
                :archived,
                Anthropic::Beta::Organization::APIKeyListParams::Status::TaggedSymbol
              )
            EXPIRED =
              T.let(
                :expired,
                Anthropic::Beta::Organization::APIKeyListParams::Status::TaggedSymbol
              )
            INACTIVE =
              T.let(
                :inactive,
                Anthropic::Beta::Organization::APIKeyListParams::Status::TaggedSymbol
              )

            sig do
              override.returns(
                T::Array[
                  Anthropic::Beta::Organization::APIKeyListParams::Status::TaggedSymbol
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
