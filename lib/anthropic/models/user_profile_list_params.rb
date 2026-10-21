# frozen_string_literal: true

module Anthropic
  module Models
    # @see Anthropic::Resources::UserProfiles#list
    class UserProfileListParams < Anthropic::Internal::Type::BaseModel
      extend Anthropic::Internal::Type::RequestParameters::Converter
      include Anthropic::Internal::Type::RequestParameters

      # @!attribute enforcement_status
      #   Return only the user profiles whose `enforcement_status` is one of these values:
      #   `unrestricted`, `pending`, `restricted` or `banned`. Repeat the parameter to
      #   match any of several. With it set, a page may hold fewer than `limit` profiles,
      #   or none, and still carry a `next_page`: the service examines a bounded number of
      #   profiles per request, and only a null `next_page` means the listing is complete.
      #   Rejected with `invalid_request_error` under the `user-profiles-2026-09-04` and
      #   earlier beta headers. Fails with `overloaded_error` when a profile's enforcement
      #   actions cannot be read for the moment.
      #
      #   @return [Array<Symbol, Anthropic::Models::UserProfileEnforcementStatus>, nil]
      optional :enforcement_status,
               -> { Anthropic::Internal::Type::ArrayOf[enum: Anthropic::UserProfileEnforcementStatus] }

      # @!attribute limit
      #   The maximum number of user profiles to return, from 1 to 100. Defaults to 20.
      #
      #   @return [Integer, nil]
      optional :limit, Integer

      # @!attribute order
      #   The sort direction, applied to the field that `order_by` selects. Defaults to
      #   `desc`.
      #
      #   @return [Symbol, Anthropic::Models::UserProfileListOrder, nil]
      optional :order, enum: -> { Anthropic::UserProfileListOrder }

      # @!attribute order_by
      #   The field to sort user profiles by, in the direction that `order` sets. Defaults
      #   to `created_at`.
      #
      #   @return [Symbol, Anthropic::Models::UserProfileListOrderBy, nil]
      optional :order_by, enum: -> { Anthropic::UserProfileListOrderBy }

      # @!attribute page
      #   The cursor for the page to return, taken from `next_page` in a previous
      #   response.
      #
      #   Leave it out to get the first page.
      #
      #   @return [String, nil]
      optional :page, String

      # @!attribute workspace_id
      #   Optional header to select the Workspace for this request. The value is a
      #   Workspace ID (for example, `wrkspc_011CZkZaBF1tNoB5wlCeusgy`).
      #
      #   Only needed for credentials that can act on more than one Workspace. A
      #   credential that belongs to a specific Workspace may omit it; if sent, it must
      #   match that Workspace.
      #
      #   @return [String, nil]
      optional :workspace_id, String

      # @!method initialize(enforcement_status: nil, limit: nil, order: nil, order_by: nil, page: nil, workspace_id: nil, request_options: {})
      #   Some parameter documentations has been truncated, see
      #   {Anthropic::Models::UserProfileListParams} for more details.
      #
      #   @param enforcement_status [Array<Symbol, Anthropic::Models::UserProfileEnforcementStatus>] Return only the user profiles whose `enforcement_status` is one of these values:
      #
      #   @param limit [Integer] The maximum number of user profiles to return, from 1 to 100. Defaults to 20.
      #
      #   @param order [Symbol, Anthropic::Models::UserProfileListOrder] The sort direction, applied to the field that `order_by` selects. Defaults to `d
      #
      #   @param order_by [Symbol, Anthropic::Models::UserProfileListOrderBy] The field to sort user profiles by, in the direction that `order` sets. Defaults
      #
      #   @param page [String] The cursor for the page to return, taken from `next_page` in a previous response
      #
      #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
      #
      #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
    end
  end
end
