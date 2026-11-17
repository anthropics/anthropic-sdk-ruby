# frozen_string_literal: true

module Anthropic
  module Models
    class LinkedOrganizationSpendLimitReachedErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :linked_organization_spend_limit_reached]
      required :error_code, const: :linked_organization_spend_limit_reached

      # @!method initialize(error_code: :linked_organization_spend_limit_reached)
      #   The organization linked to the request's user profile has reached a spend limit
      #   that it set, or lacks credit for the request. The response does not say which
      #   applies.
      #
      #   @param error_code [Symbol, :linked_organization_spend_limit_reached]
    end
  end
end
