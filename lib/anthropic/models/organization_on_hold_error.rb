# frozen_string_literal: true

module Anthropic
  module Models
    # Anthropic has disabled the organization for trust and safety reasons. An
    # organization disabled for any other reason, such as billing, does not get this
    # code. `appeal_url`, when present, is where the organization can appeal.
    class OrganizationOnHoldError < Anthropic::Errors::BadRequestError
      # @!method error_code
      #   @return [Symbol, :organization_on_hold]

      # @return [Anthropic::Models::OrganizationOnHoldErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::OrganizationOnHoldErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
