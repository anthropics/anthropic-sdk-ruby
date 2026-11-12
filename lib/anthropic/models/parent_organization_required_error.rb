# frozen_string_literal: true

module Anthropic
  module Models
    # The endpoint serves only organizations that belong to a parent organization, and
    # this organization belongs to none.
    class ParentOrganizationRequiredError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :parent_organization_required]

      # @return [Anthropic::Models::ParentOrganizationRequiredErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::ParentOrganizationRequiredErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
