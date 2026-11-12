# frozen_string_literal: true

module Anthropic
  module Models
    class ParentOrganizationRequiredErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :parent_organization_required]
      required :error_code, const: :parent_organization_required

      # @!method initialize(error_code: :parent_organization_required)
      #   The endpoint serves only organizations that belong to a parent organization, and
      #   this organization belongs to none.
      #
      #   @param error_code [Symbol, :parent_organization_required]
    end
  end
end
