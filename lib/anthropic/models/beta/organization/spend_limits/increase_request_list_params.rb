# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module SpendLimits
          # @see Anthropic::Resources::Beta::Organization::SpendLimits::IncreaseRequests#list
          class IncreaseRequestListParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute actor_ids
            #   Filter by requester, as `user_...` tagged IDs.
            #
            #   @return [Array<String>, nil]
            optional :actor_ids, Anthropic::Internal::Type::ArrayOf[String], nil?: true

            # @!attribute limit
            #
            #   @return [Integer, nil]
            optional :limit, Integer

            # @!attribute page
            #   Opaque cursor from a previous response's `next_page`.
            #
            #   @return [String, nil]
            optional :page, String, nil?: true

            # @!attribute status
            #   Filter by status. Omit to return all.
            #
            #   @return [Array<Symbol, Anthropic::Models::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus>, nil]
            optional :status,
                     -> {
                       Anthropic::Internal::Type::ArrayOf[enum: Anthropic::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus]
                     },
                     nil?: true

            # @!method initialize(actor_ids: nil, limit: nil, page: nil, status: nil, request_options: {})
            #   @param actor_ids [Array<String>, nil] Filter by requester, as `user_...` tagged IDs.
            #
            #   @param limit [Integer]
            #
            #   @param page [String, nil] Opaque cursor from a previous response's `next_page`.
            #
            #   @param status [Array<Symbol, Anthropic::Models::Beta::Organization::SpendLimits::BetaSpendLimitIncreaseRequestStatus>, nil] Filter by status. Omit to return all.
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
