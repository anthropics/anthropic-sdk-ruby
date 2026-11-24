# frozen_string_literal: true

module Anthropic
  module Models
    class BetaGCPProjectControlledByAnotherOrganizationErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :gcp_project_controlled_by_another_organization]
      required :error_code, const: :gcp_project_controlled_by_another_organization

      # @!method initialize(error_code: :gcp_project_controlled_by_another_organization)
      #   Another organization has data controls turned on for this Google Cloud project,
      #   or turned them off recently. The message says how long to wait.
      #
      #   @param error_code [Symbol, :gcp_project_controlled_by_another_organization]
    end
  end
end
