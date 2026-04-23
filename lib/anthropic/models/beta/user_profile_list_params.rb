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

        # @!method initialize(limit: nil, order: nil, page: nil, betas: nil, request_options: {})
        #   @param limit [Integer] Query parameter for limit
        #
        #   @param order [Symbol, Anthropic::Models::Beta::UserProfileListParams::Order] Query parameter for order
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
      end
    end
  end
end
