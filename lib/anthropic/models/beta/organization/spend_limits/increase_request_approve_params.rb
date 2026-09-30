# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module SpendLimits
          # @see Anthropic::Resources::Beta::Organization::SpendLimits::IncreaseRequests#approve
          class IncreaseRequestApproveParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute spend_limit_increase_request_id
            #   ID of the spend limit increase request.
            #
            #   @return [String]
            required :spend_limit_increase_request_id, String

            # @!attribute amount
            #   New per-user spend limit as a non-negative integer decimal string (minor units).
            #
            #   @return [String]
            required :amount, String

            # @!attribute period
            #
            #   @return [Symbol, Anthropic::Models::Beta::Organization::BetaSpendLimitPeriod, nil]
            optional :period, enum: -> { Anthropic::Beta::Organization::BetaSpendLimitPeriod }, nil?: true

            # @!attribute suppress_notification
            #
            #   @return [Boolean, nil]
            optional :suppress_notification, Anthropic::Internal::Type::Boolean

            # @!method initialize(spend_limit_increase_request_id:, amount:, period: nil, suppress_notification: nil, request_options: {})
            #   Some parameter documentations has been truncated, see
            #   {Anthropic::Models::Beta::Organization::SpendLimits::IncreaseRequestApproveParams}
            #   for more details.
            #
            #   @param spend_limit_increase_request_id [String] ID of the spend limit increase request.
            #
            #   @param amount [String] New per-user spend limit as a non-negative integer decimal string (minor units).
            #
            #   @param period [Symbol, Anthropic::Models::Beta::Organization::BetaSpendLimitPeriod, nil]
            #
            #   @param suppress_notification [Boolean]
            #
            #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
          end
        end
      end
    end
  end
end
