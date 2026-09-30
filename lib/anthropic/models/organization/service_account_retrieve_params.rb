# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      # @see Anthropic::Resources::Organization::ServiceAccounts#retrieve
      class ServiceAccountRetrieveParams < Anthropic::Internal::Type::BaseModel
        extend Anthropic::Internal::Type::RequestParameters::Converter
        include Anthropic::Internal::Type::RequestParameters

        # @!attribute service_account_id
        #   ID of the service account.
        #
        #   @return [String]
        required :service_account_id, String

        # @!method initialize(service_account_id:, request_options: {})
        #   @param service_account_id [String] ID of the service account.
        #
        #   @param request_options [Anthropic::RequestOptions, Hash{Symbol=>Object}]
      end
    end
  end
end
