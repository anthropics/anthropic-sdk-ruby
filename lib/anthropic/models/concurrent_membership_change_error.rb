# frozen_string_literal: true

module Anthropic
  module Models
    # Another change to the organization's members is in progress. Retry the request
    # once it completes.
    class ConcurrentMembershipChangeError < Anthropic::Errors::ConflictError
      # @!method error_code
      #   @return [Symbol, :concurrent_membership_change]

      # @return [Anthropic::Models::ConcurrentMembershipChangeErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::ConcurrentMembershipChangeErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
