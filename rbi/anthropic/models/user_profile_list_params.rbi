# typed: strong

module Anthropic
  module Models
    class UserProfileListParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      OrHash =
        T.type_alias do
          T.any(Anthropic::UserProfileListParams, Anthropic::Internal::AnyHash)
        end

      # Return only the user profiles whose `enforcement_status` is one of these values:
      # `unrestricted`, `pending`, `restricted` or `banned`. Repeat the parameter to
      # match any of several. With it set, a page may hold fewer than `limit` profiles,
      # or none, and still carry a `next_page`: the service examines a bounded number of
      # profiles per request, and only a null `next_page` means the listing is complete.
      # Rejected with `invalid_request_error` under the `user-profiles-2026-09-04` and
      # earlier beta headers. Fails with `overloaded_error` when a profile's enforcement
      # actions cannot be read for the moment.
      sig do
        returns(
          T.nilable(T::Array[Anthropic::UserProfileEnforcementStatus::OrSymbol])
        )
      end
      attr_reader :enforcement_status

      sig do
        params(
          enforcement_status:
            T::Array[Anthropic::UserProfileEnforcementStatus::OrSymbol]
        ).void
      end
      attr_writer :enforcement_status

      # The maximum number of user profiles to return, from 1 to 100. Defaults to 20.
      sig { returns(T.nilable(Integer)) }
      attr_reader :limit

      sig { params(limit: Integer).void }
      attr_writer :limit

      # The sort direction, applied to the field that `order_by` selects. Defaults to
      # `desc`.
      sig { returns(T.nilable(Anthropic::UserProfileListOrder::OrSymbol)) }
      attr_reader :order

      sig { params(order: Anthropic::UserProfileListOrder::OrSymbol).void }
      attr_writer :order

      # The field to sort user profiles by, in the direction that `order` sets. Defaults
      # to `created_at`.
      sig { returns(T.nilable(Anthropic::UserProfileListOrderBy::OrSymbol)) }
      attr_reader :order_by

      sig { params(order_by: Anthropic::UserProfileListOrderBy::OrSymbol).void }
      attr_writer :order_by

      # The cursor for the page to return, taken from `next_page` in a previous
      # response.
      #
      # Leave it out to get the first page.
      sig { returns(T.nilable(String)) }
      attr_reader :page

      sig { params(page: String).void }
      attr_writer :page

      # Optional header to select the Workspace for this request. The value is a
      # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
      #
      # Only needed for credentials that can act on more than one Workspace. A
      # credential that belongs to a specific Workspace may omit it; if sent, it must
      # match that Workspace.
      sig { returns(T.nilable(String)) }
      attr_reader :workspace_id

      sig { params(workspace_id: String).void }
      attr_writer :workspace_id

      sig do
        params(
          enforcement_status:
            T::Array[Anthropic::UserProfileEnforcementStatus::OrSymbol],
          limit: Integer,
          order: Anthropic::UserProfileListOrder::OrSymbol,
          order_by: Anthropic::UserProfileListOrderBy::OrSymbol,
          page: String,
          workspace_id: String,
          request_options: Anthropic::RequestOptions::OrHash
        ).returns(T.attached_class)
      end
      def self.new(
        # Return only the user profiles whose `enforcement_status` is one of these values:
        # `unrestricted`, `pending`, `restricted` or `banned`. Repeat the parameter to
        # match any of several. With it set, a page may hold fewer than `limit` profiles,
        # or none, and still carry a `next_page`: the service examines a bounded number of
        # profiles per request, and only a null `next_page` means the listing is complete.
        # Rejected with `invalid_request_error` under the `user-profiles-2026-09-04` and
        # earlier beta headers. Fails with `overloaded_error` when a profile's enforcement
        # actions cannot be read for the moment.
        enforcement_status: nil,
        # The maximum number of user profiles to return, from 1 to 100. Defaults to 20.
        limit: nil,
        # The sort direction, applied to the field that `order_by` selects. Defaults to
        # `desc`.
        order: nil,
        # The field to sort user profiles by, in the direction that `order` sets. Defaults
        # to `created_at`.
        order_by: nil,
        # The cursor for the page to return, taken from `next_page` in a previous
        # response.
        #
        # Leave it out to get the first page.
        page: nil,
        # Optional header to select the Workspace for this request. The value is a
        # Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
        #
        # Only needed for credentials that can act on more than one Workspace. A
        # credential that belongs to a specific Workspace may omit it; if sent, it must
        # match that Workspace.
        workspace_id: nil,
        request_options: {}
      )
      end

      sig do
        override.returns(
          {
            enforcement_status:
              T::Array[Anthropic::UserProfileEnforcementStatus::OrSymbol],
            limit: Integer,
            order: Anthropic::UserProfileListOrder::OrSymbol,
            order_by: Anthropic::UserProfileListOrderBy::OrSymbol,
            page: String,
            workspace_id: String,
            request_options: Anthropic::RequestOptions
          }
        )
      end
      def to_hash
      end
    end
  end
end
