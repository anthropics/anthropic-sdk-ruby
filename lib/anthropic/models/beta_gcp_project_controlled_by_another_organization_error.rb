# frozen_string_literal: true

module Anthropic
  module Models
    # Another organization has data controls turned on for this Google Cloud project,
    # or turned them off recently. The message says how long to wait.
    class BetaGCPProjectControlledByAnotherOrganizationError < Anthropic::Errors::ConflictError
      # @!method error_code
      #   @return [Symbol, :gcp_project_controlled_by_another_organization]

      # @return [Anthropic::Models::BetaGCPProjectControlledByAnotherOrganizationErrorDetails]
      def details
        Anthropic::Internal::Type::Converter.coerce(
          Anthropic::BetaGCPProjectControlledByAnotherOrganizationErrorDetails,
          Anthropic::Internal::Util.dig(body, [:error, :details])
        )
      end
    end
  end
end
