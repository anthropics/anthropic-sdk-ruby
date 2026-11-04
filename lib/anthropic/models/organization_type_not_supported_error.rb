# frozen_string_literal: true

module Anthropic
  module Models
    # The endpoint does not support the organization's type. Each endpoint's
    # description says which organization types it supports.
    class OrganizationTypeNotSupportedError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :organization_type_not_supported]

      # @return [Anthropic::Models::OrganizationTypeNotSupportedErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::OrganizationTypeNotSupportedErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
