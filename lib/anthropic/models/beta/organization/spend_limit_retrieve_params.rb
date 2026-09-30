# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      module Organization
        # @see Anthropic::Resources::Beta::Organization::SpendLimits#retrieve
        class SpendLimitRetrieveParams < Anthropic::Internal::Type::BaseModel
          extend Anthropic::Internal::Type::RequestParameters::Converter
          include Anthropic::Internal::Type::RequestParameters

          # @!attribute spend_limit_id
          #   ID of the Spend Limit.
          #
          #   @return [String]
          required :spend_limit_id, String

          # @!method initialize(spend_limit_id:, request_options: {})
          #   @param spend_limit_id [String] ID of the Spend Limit.
          #
          #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
        end
      end
    end
  end
end
