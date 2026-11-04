# typed: strong

module Anthropic
  module Models
    module Organization
      class WorkspaceListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        OrHash =
          T.type_alias do
            T.any(
              Anthropic::Organization::WorkspaceListParams,
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

        # Only the Workspaces with these IDs, at most 100. `include_archived` and
        # `include_default` still apply, and IDs of Workspaces the caller can't list are
        # left out.
        sig { returns(T.nilable(T::Array[String])) }
        attr_reader :ids

        sig { params(ids: T::Array[String]).void }
        attr_writer :ids

        # Whether to include Workspaces that have been archived in the response
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_archived

        sig { params(include_archived: T::Boolean).void }
        attr_writer :include_archived

        # Whether to include the organization's default Workspace in the response
        sig { returns(T.nilable(T::Boolean)) }
        attr_reader :include_default

        sig { params(include_default: T::Boolean).void }
        attr_writer :include_default

        # Number of items to return per page.
        #
        # Defaults to `20`. Ranges from `1` to `1000`.
        sig { returns(T.nilable(Integer)) }
        attr_reader :limit

        sig { params(limit: Integer).void }
        attr_writer :limit

        sig do
          params(
            after_id: String,
            before_id: String,
            ids: T::Array[String],
            include_archived: T::Boolean,
            include_default: T::Boolean,
            limit: Integer,
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
          # Only the Workspaces with these IDs, at most 100. `include_archived` and
          # `include_default` still apply, and IDs of Workspaces the caller can't list are
          # left out.
          ids: nil,
          # Whether to include Workspaces that have been archived in the response
          include_archived: nil,
          # Whether to include the organization's default Workspace in the response
          include_default: nil,
          # Number of items to return per page.
          #
          # Defaults to `20`. Ranges from `1` to `1000`.
          limit: nil,
          request_options: {}
        )
        end

        sig do
          override.returns(
            {
              after_id: String,
              before_id: String,
              ids: T::Array[String],
              include_archived: T::Boolean,
              include_default: T::Boolean,
              limit: Integer,
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
