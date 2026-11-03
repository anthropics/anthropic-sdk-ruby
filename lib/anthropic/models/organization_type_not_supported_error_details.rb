# frozen_string_literal: true

module Anthropic
  module Models
    class OrganizationTypeNotSupportedErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :organization_type_not_supported]
      required :error_code, const: :organization_type_not_supported

      # @!method initialize(error_code: :organization_type_not_supported)
      #   The endpoint does not support the organization's type. Each endpoint's
      #   description says which organization types it supports.
      #
      #   @param error_code [Symbol, :organization_type_not_supported]
    end
  end
end
