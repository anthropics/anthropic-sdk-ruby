# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      # @see Anthropic::Resources::Beta::UserProfiles#list
      class UserProfileListParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute limit
        #   Query parameter for limit
        #
        #   @return [Integer, nil]
        optional :limit, Integer

        # @!attribute order
        #   Query parameter for order
        #
        #   @return [Symbol, Anthropic::Models::Beta::UserProfileListParams::Order, nil]
        optional :order, enum: -> { Anthropic::Beta::UserProfileListParams::Order }

        # @!attribute order_by
        #   Query parameter for order_by
        #
        #   @return [Symbol, Anthropic::Models::Beta::UserProfileListParams::OrderBy, nil]
        optional :order_by, enum: -> { Anthropic::Beta::UserProfileListParams::OrderBy }

        # @!attribute page
        #   Query parameter for page
        #
        #   @return [String, nil]
        optional :page, String

        # @!attribute betas
        #   Optional header to specify the beta version(s) you want to use.
        #
        #   @return [Array<String, Symbol, Anthropic::Models::AnthropicBeta>, nil]
        optional :betas, -> { Anthropic::Internal::Type::ArrayOf[union: Anthropic::AnthropicBeta] }

        # @!method initialize(limit: nil, order: nil, order_by: nil, page: nil, betas: nil, request_options: {})
        #   @param limit [Integer] Query parameter for limit
        #
        #   @param order [Symbol, Anthropic::Models::Beta::UserProfileListParams::Order] Query parameter for order
        #
        #   @param order_by [Symbol, Anthropic::Models::Beta::UserProfileListParams::OrderBy] Query parameter for order_by
        #
        #   @param page [String] Query parameter for page
        #
        #   @param betas [Array<String, Symbol, Anthropic::Models::AnthropicBeta>] Optional header to specify the beta version(s) you want to use.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]

        # Query parameter for order
        module Order
          extend Anthropic::Internal::Type::Enum

          ASC = :asc
          DESC = :desc

          # @!method self.values
          #   @return [Array<Symbol>]
        end

        # Query parameter for order_by
        module OrderBy
          extend Anthropic::Internal::Type::Enum

          CREATED_AT = :created_at
          NAME = :name

          # @!method self.values
          #   @return [Array<Symbol>]
        end
      end
    end
  end
end
