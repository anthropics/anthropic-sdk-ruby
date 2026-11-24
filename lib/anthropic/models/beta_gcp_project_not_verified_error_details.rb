# frozen_string_literal: true

module Anthropic
  module Models
    class BetaGCPProjectNotVerifiedErrorDetails < Anthropic::Internal::Type::BaseModel
      # @!attribute error_code
      #
      #   @return [Symbol, :gcp_project_not_verified]
      required :error_code, const: :gcp_project_not_verified

      # @!method initialize(error_code: :gcp_project_not_verified)
      #   The organization has not proved that it owns the Google Cloud project that holds
      #   the key or bucket. The message names the field.
      #
      #   @param error_code [Symbol, :gcp_project_not_verified]
    end
  end
end
