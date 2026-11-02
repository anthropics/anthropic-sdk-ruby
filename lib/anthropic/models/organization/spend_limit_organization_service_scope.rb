# frozen_string_literal: true

module Anthropic
  module Models
    module Organization
      class SpendLimitOrganizationServiceScope < Anthropic::Internal::Type::BaseModel
        # @!attribute service
        #
        #   @return [String]
        required :service, String

        # @!attribute type
        #
        #   @return [Symbol, :organization_service]
        required :type, const: :organization_service

        # @!method initialize(service:, type: :organization_service)
        #   @param service [String]
        #   @param type [Symbol, :organization_service]
      end
    end
  end
end
