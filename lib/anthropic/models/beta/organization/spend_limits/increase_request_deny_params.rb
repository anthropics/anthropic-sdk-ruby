# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        module SpendLimits
          # @see Anthropic::Resources::Beta::Organization::SpendLimits::IncreaseRequests#deny
          class IncreaseRequestDenyParams < Anthropic::Internal::Type::BaseModel
            extend Anthropic::Internal::Type::RequestParameters::Converter
            include Anthropic::Internal::Type::RequestParameters

            # @!attribute spend_limit_increase_request_id
            #   ID of the spend limit increase request.
            #
            #   @return [String]
            required :spend_limit_increase_request_id, String

            # @!attribute suppress_notification
            #
            #   @return [Boolean, nil]
            optional :suppress_notification, Anthropic::Internal::Type::Boolean

            # @!method initialize(spend_limit_increase_request_id:, suppress_notification: nil, request_options: {})
            #   @param spend_limit_increase_request_id [String] ID of the spend limit increase request.
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
