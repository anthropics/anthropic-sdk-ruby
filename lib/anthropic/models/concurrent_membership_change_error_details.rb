# frozen_string_literal: true

module Anthropic
  module Models
    class ConcurrentMembershipChangeErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :concurrent_membership_change]
      required :error_code, const: :concurrent_membership_change

      # @!method initialize(error_code: :concurrent_membership_change)
      #   Another change to the organization's members is in progress. Retry the request
      #   once it completes.
      #
      #   @param error_code [Symbol, :concurrent_membership_change]
    end
  end
end
