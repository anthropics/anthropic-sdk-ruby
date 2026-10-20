# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::UserProfiles#list
      class UserProfileListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute limit
        #   The maximum number of user profiles to return, from 1 to 100. Defaults to 20.
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute order
        #   The sort direction, applied to the field that `order_by` selects. Defaults to
        #   `desc`.
        #
        #   @return [Symbol, Anthropic::Models::Beta::UserProfileListParams::Order, nil]
        optional :order, enum: -> { Anthropic::Beta::UserProfileListParams::Order }

        # @!attribute order_by
        #   The field to sort user profiles by, in the direction that `order` sets. Defaults
        #   to `created_at`.
        #
        #   @return [Symbol, Anthropic::Models::Beta::UserProfileListParams::OrderBy, nil]
        optional :order_by, enum: -> { Anthropic::Beta::UserProfileListParams::OrderBy }

        # @!attribute page
        #   The cursor for the page to return, taken from `next_page` in a previous
        #   response.
        #
        #   Leave it out to get the first page.
        #
        #   @return [String, nil]
        optional :page, String

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<Symbol, String, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

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

        # @!method initialize(limit: nil, order: nil, order_by: nil, page: nil, betas: nil, workspace_id: nil, request_options: {})
        #   Some parameter documentations has been truncated, see
        #   {Anthropic::Models::Beta::UserProfileListParams} for more details.
        #
        #   @param limit [Integer] The maximum number of user profiles to return, from 1 to 100. Defaults to 20.
        #
        #   @param order [Symbol, Anthropic::Models::Beta::UserProfileListParams::Order] The sort direction, applied to the field that `order_by` selects. Defaults to `d
        #
        #   @param order_by [Symbol, Anthropic::Models::Beta::UserProfileListParams::OrderBy] The field to sort user profiles by, in the direction that `order` sets. Defaults
        #
        #   @param page [String] The cursor for the page to return, taken from `next_page` in a previous response
        #
        #   @param betas [Array<Symbol, String, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param workspace_id [String] Optional header to select the Workspace for this request. The value is a Workspa
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # The sort direction, applied to the field that `order_by` selects. Defaults to
        # `desc`.
        module Order
          extend Anthropic::Internal::Type::Enum

          # Oldest first when `order_by` is `created_at`, or names in ascending order when `order_by` is `name`.
          ASC = :asc

          # Newest first when `order_by` is `created_at`, or names in descending order when `order_by` is `name`. This is the default.
          DESC = :desc

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # The field to sort user profiles by, in the direction that `order` sets. Defaults
        # to `created_at`.
        module OrderBy
          extend Anthropic::Internal::Type::Enum

          # Sort by when each user profile was created. This is the default.
          CREATED_AT = :created_at

          # Sort by `name`, ignoring the case of ASCII letters. Profiles without a name come last in either direction.
          NAME = :name

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
