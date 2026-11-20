# frozen_string_literal: true

module Anthropic
  module Models
    module Beta
      class BetaApprovalRequiredErrorDetails < Anthropic::Internal::Type::BaseModel
        # @!attribute error_code
        #
        #   @return [Symbol, :approval_required]
        required :error_code, const: :approval_required

        # @!attribute field
        #   The request field that needs the approval.
        #
        #   @return [String]
        required :field, String

        # @!method initialize(field:, error_code: :approval_required)
        #   Turning human review off needs Anthropic's approval for the organization, and
        #   the organization doesn't have it. Contact Anthropic support to request approval.
        #
        #   @param field [String] The request field that needs the approval.
        #
        #   @param error_code [Symbol, :approval_required]
      end
    end

    BetaApprovalRequiredErrorDetails = Beta::BetaApprovalRequiredErrorDetails
  end
end
